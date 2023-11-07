#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>

//mavros message definitions
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/Waypoint.h>
#include <mavros_msgs/State.h>

//mavros service deffinitions
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/WaypointPush.h>
#include <mavros_msgs/WaypointPull.h>
#include <mavros_msgs/WaypointList.h>
#include <mavros_msgs/WaypointClear.h>

#include "uas_control.h"


uasControl::uasControl(ros::NodeHandle nodeHandle) 
{
    n = nodeHandle;

    // Services
    armingSrv = n.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    setModeSrv = n.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    // TODO: Find msg paths
    wpPushSrv = n.serviceClient<mavros_msgs::WaypointPush>("mavros/set_mode");
    wpPullSrv = n.serviceClient<mavros_msgs::WaypointPull>("mavros/set_mode");
    wpListSrv = n.serviceClient<mavros_msgs::WaypointList>("mavros/set_mode");
    wpClearSrv = n.serviceClient<mavros_msgs::WaypointClear>("mavros/set_mode");

};


int uasControl::setArming(bool armed) {
    mavros_msgs::CommandBool armRequest;
    armRequest.request.value = armed;

    if(armingSrv.call(armRequest)){
        ROS_INFO("setArming: %d, Success code: %d\n", armRequest.response.result, armRequest.response.success);
    }else{
        ROS_INFO("Failed to call arming service.\n");
        return 1;
    }
};

int uasControl::setMode(std::string custom_mode) {
    mavros_msgs::SetMode modeRequest;
    modeRequest.request.base_mode = 0;
    modeRequest.request.custom_mode = custom_mode;
    //We might try OFFBOARD mode, which has pose/setpoint streaming as a prereq to switching to the mode

    if(setModeSrv.call(modeRequest)){
        ros::spinOnce(); //need callback for checking current mode
        ROS_INFO("setMode sent: %d", modeRequest.response.mode_sent);
        return 0;
    }else{
        ROS_INFO("Failed to call SetMode service.\n");
        return 1;
    }
}

int uasControl::wpPush(std::vector<mavros_msgs::Waypoint, std::allocator<mavros_msgs::Waypoint>> waypointList, u_int16_t startIndex) {
    mavros_msgs::WaypointPush wpPushRequest;
    wpPushRequest.request.waypoints = waypointList;
    wpPushRequest.request.start_index = startIndex;
    if(wpPushSrv.call(wpPushRequest)){
        ROS_INFO("wpPush sucess: %d", wpPushRequest.response.success);
        return wpPushRequest.response.wp_transfered;
    }else{
        ROS_INFO("Failed to call SetMode service.\n");
        return 1;
    }
}

u_int32_t uasControl::wpPull() {
    mavros_msgs::WaypointPull wpPullRequest;
    if(wpPullSrv.call(wpPullRequest)){
        ROS_INFO("wpPull sucess: %d", wpPullRequest.response.success);
        return wpPullRequest.response.wp_received;
    }else{
        ROS_INFO("Failed to call SetMode service.\n");
        return 1;
    }
}

int uasControl::wpClear() {
    mavros_msgs::WaypointClear wpClearRequest;
    if(wpClearSrv.call(wpClearRequest)){
        ROS_INFO("wpClear sucess: %d", wpClearRequest.response.success);
        return 0;
    }else{
        ROS_INFO("Failed to call SetMode service.\n");
        return 1;
    }
}


