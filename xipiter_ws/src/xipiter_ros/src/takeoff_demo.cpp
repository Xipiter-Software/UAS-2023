#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>
#include <chrono>
#include <thread>

#include <mavros_msgs/State.h>

#include "ros_services.h"


ros::Subscriber currStateSub;
mavros_msgs::State currState;
int stateQueueSize = 5;


void stateCallback(const mavros_msgs::State::ConstPtr& msg){
    currState = *msg;
}

int main(int argc, char** argv){

    // Initialization//
    // ROS
    ros::init(argc, argv, "xipiterUAV");
    ros::NodeHandle n;
    rosService srv = rosService(n);

    // Subcriptions
    currStateSub = n.subscribe<mavros_msgs::State>("mavros/state", stateQueueSize, stateCallback);

    // Vehicle Setup //
    // Configure connection to FCU
    ros::Rate rate(10); //node operating rate of 10Hz. (must be >2Hz to support custom mode operation--otherwise drops out to previous mode)
    while(ros::ok() && !currState.connected){
        ros::spinOnce(); //call callbacks to check for autopilot connection
        rate.sleep(); //wait a cycle
    }
    ROS_INFO("Connected to FCU.\n");
    std::this_thread::sleep_for(std::chrono::seconds(10));


    // Arm vehicle
    bool armed = false;
    do {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        srv.setArming(true);
    } while (!armed);


    std::this_thread::sleep_for(std::chrono::seconds(4));
    ros::spinOnce(); //check callback for state change (i.e. is now armed?)

    // Main Loop //
    // Curently ensures the mode is auto
    while (ros::ok()){
        //TODO: This should really be in a wile loop, trying avery maybe 2-5 seconds to arm and running
        //ros::spinOnce at the end to get the new callback
        if(currState.armed){

            if (currState.mode.c_str() != "AUTO") {
                srv.setMode("AUTO");
                ROS_INFO("The current mode is: %s\n", currState.mode.c_str());
            }
        }else{
            ROS_INFO("Not armed.\n");
        }

        std::this_thread::sleep_for(std::chrono::seconds(3));
        ros::spinOnce();
    }


    return 0;
}