#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>
#include <chrono>
#include <thread>
#include <random>

//mavros message definitions
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>

#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/Waypoint.h>
#include <mavros_msgs/WaypointPush.h>
#include <mavros_msgs/CommandCode.h>
#include <list>

ros::ServiceClient armingSrv;
ros::ServiceClient setModeSrv;

ros::ServiceClient waypointSrv;

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
    waypointSrv = n.serviceClient<mavros_msgs::WaypointPush>("mavros/mission/push");

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
    ros::spinOnce();

    mavros_msgs::WaypointPush waypointRequest;
    mavros_msgs::Waypoint wp_item;

    //Takeoff
    wp_item.frame = mavros_msgs::Waypoint::FRAME_GLOBAL_REL_ALT;
    wp_item.command = mavros_msgs::CommandCode::NAV_TAKEOFF;
    wp_item.is_current = true;
    wp_item.autocontinue = true;
    wp_item.x_lat = 0;
    wp_item.y_long = 0;
    wp_item.z_alt = 100;
    waypointRequest.request.waypoints.push_back(wp_item);

    //test coordinate bounds for simulation
    //lat:  -35.36536180 to -35.35997208
    const long lat_min = -35.36536180;
    const long lat_max = -35.35997208;
    //lon: 149.16072123 to 149.17063481
    const long lon_min = 149.16072123;
    const long lon_max = 149.17063481;

    std::random_device rd;
    std::default_random_engine generator(rd());
    std::uniform_real_distribution<double> lat_distr(lat_min, lat_max);
    std::uniform_real_distribution<double> lon_distr(lon_min, lon_max);

    for(int i = 1; i < 9; i++){
        wp_item.frame = mavros_msgs::Waypoint::FRAME_GLOBAL_REL_ALT;
        wp_item.command = mavros_msgs::CommandCode::NAV_WAYPOINT;
        wp_item.is_current = false;
        wp_item.autocontinue = true;
        wp_item.x_lat = lat_distr(generator);
        wp_item.y_long = lon_distr(generator);
        wp_item.z_alt = 100;

        waypointRequest.request.waypoints.push_back(wp_item);
    }

    //RTL
    wp_item.frame = mavros_msgs::Waypoint::FRAME_MISSION;
    wp_item.command = mavros_msgs::CommandCode::NAV_RETURN_TO_LAUNCH;
    wp_item.is_current = false;
    wp_item.autocontinue = true;
    wp_item.x_lat = 0;
    wp_item.y_long = 0;
    wp_item.z_alt = 0; //uh maybe not 0, probably 100
    waypointRequest.request.waypoints.push_back(wp_item);


    if(waypointSrv.call(waypointRequest)){
        ROS_INFO("Sent waypoints: %d", waypointRequest.response.success);
    }else{
        ROS_INFO("Failed to send waypoints.\n");
        return 1;
    }

    std::this_thread::sleep_for(std::chrono::seconds(4));
    ros::spinOnce();

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