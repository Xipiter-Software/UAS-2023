#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>
#include <chrono>
#include <thread>

//mavros message definitions
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>

ros::ServiceClient armingSrv;
ros::ServiceClient setModeSrv;

ros::Subscriber currStateSub;
mavros_msgs::State currState;
int stateQueueSize = 5;

void stateCallback(const mavros_msgs::State::ConstPtr& msg){
    currState = *msg;
}


int main(int argc, char** argv){

    ros::init(argc, argv, "xipiterUAV");

    ros::NodeHandle n;
    armingSrv = n.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    setModeSrv = n.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    currStateSub = n.subscribe<mavros_msgs::State>("mavros/state", stateQueueSize, stateCallback);

    ros::Rate rate(10); //node operating rate of 10Hz. (must be >2Hz to support custom mode operation--otherwise drops out to previous mode)
    while(ros::ok() && !currState.connected){
        ros::spinOnce(); //call callbacks to check for autopilot connection
        rate.sleep(); //wait a cycle
    }
    ROS_INFO("Connected to FCU.\n");
    std::this_thread::sleep_for(std::chrono::seconds(10));

    bool armed = false;
    {
        mavros_msgs::CommandBool armRequest;
        armRequest.request.value = true;

        std::this_thread::sleep_for(std::chrono::seconds(1));

        if(armingSrv.call(armRequest)){
            armed = armRequest.response.success;
            ROS_INFO("Result: %d, Success code: %d\n", armRequest.response.result, armed);
        }else{
            ROS_INFO("Failed to call arming service.\n");
            return 1;
        }
        
    }

    std::this_thread::sleep_for(std::chrono::seconds(4));
    ros::spinOnce(); //check callback for state change (i.e. is now armed?)

    //TODO: This should really be in a wile loop, trying avery maybe 2-5 seconds to arm and running
    //ros::spinOnce at the end to get the new callback
    if(currState.armed){
        mavros_msgs::SetMode modeRequest;
        modeRequest.request.base_mode = 0;
        modeRequest.request.custom_mode = "AUTO";
        //We might try OFFBOARD mode, which has pose/setpoint streaming as a prereq to switching to the mode

        if(setModeSrv.call(modeRequest)){
            
            std::this_thread::sleep_for(std::chrono::seconds(4));
            ros::spinOnce(); //need callback for checking current mode
            ROS_INFO("The current mode is: %s\n", currState.mode.c_str());
        }else{
            ROS_INFO("Failed to call SetMode service.\n");
            return 1;
        }
    }else{
        ROS_INFO("Not armed.\n");
    }


    return 0;
}