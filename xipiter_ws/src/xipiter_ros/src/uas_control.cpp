#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>

#include <random>
#include <list>

//mavros message definitions
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/Waypoint.h>
#include <mavros_msgs/State.h>

//mavros service deffinitions
#include <mavros_msgs/SetMode.h>

#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/WaypointPush.h>
#include <mavros_msgs/WaypointPull.h>
#include <mavros_msgs/WaypointClear.h>
#include <mavros_msgs/CommandCode.h>

#include "uas_control.h"


uasControl::uasControl(ros::NodeHandle nodeHandle) 
{
    n = nodeHandle;

    // Services
    armingSrv = n.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    setModeSrv = n.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    // TODO: Find msg paths
    wpPushSrv = n.serviceClient<mavros_msgs::WaypointPush>("mavros/mission/push");
    wpPullSrv = n.serviceClient<mavros_msgs::WaypointPull>("mavros/mission/pull");
    wpClearSrv = n.serviceClient<mavros_msgs::WaypointClear>("mavros/mission/clear");

};

int uasControl::setArming(bool armed) {
    mavros_msgs::CommandBool armRequest;
    armRequest.request.value = armed;

    if(armingSrv.call(armRequest)){
        ROS_INFO("setArming: %d, Success code: %d\n", armRequest.response.result, armRequest.response.success);
        return armRequest.response.success;
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
        ROS_INFO("Failed to call SetMode.\n");
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
        ROS_INFO("Failed to call wpPull.\n");
        return -1;
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

// Grayson wrote code to test waypoint testing
// TODO: Find better source for waypoints
int uasControl::wpPushTest() {
    mavros_msgs::WaypointPush wpPushRequest;
    mavros_msgs::Waypoint wp_item;

    //test coordinate bounds for simulation
    //lat:  -35.36536180 to -35.35997208
    const long lat_min = -35.36536180;
    const long lat_max = -35.35997208;
    //lon: 149.16072123 to 149.17063481
    const long lon_min = 149.16072123;
    const long lon_max = 149.17063481;

    wpPushRequest.request.start_index = 0;

    // WP1
    wp_item.frame = mavros_msgs::Waypoint::FRAME_GLOBAL_REL_ALT;
    wp_item.command = mavros_msgs::CommandCode::NAV_WAYPOINT;
    wp_item.is_current = true;
    wp_item.autocontinue = true;
    wp_item.x_lat = lat_min;
    wp_item.y_long = lon_min;
    wp_item.z_alt = 100;
    wpPushRequest.request.waypoints.push_back(wp_item);

    // WP2
    wp_item.frame = mavros_msgs::Waypoint::FRAME_GLOBAL_REL_ALT;
    wp_item.command = mavros_msgs::CommandCode::NAV_WAYPOINT;
    wp_item.is_current = false;
    wp_item.autocontinue = true;
    wp_item.x_lat = lat_max;
    wp_item.y_long = lon_max;
    wp_item.z_alt = 100;
    wpPushRequest.request.waypoints.push_back(wp_item);

    if(wpPushSrv.call(wpPushRequest)){
        ROS_INFO("wpPush sucess: %d", wpPushRequest.response.success);
        return wpPushRequest.response.wp_transfered;
    }else{
        ROS_INFO("Failed to call wpPush.\n");
        return 1;
    }

    wp_item.command = mavros_msgs::CommandCode::NAV_WAYPOINT;

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

        wpPushRequest.request.waypoints.push_back(wp_item);
    }


    //RTL
    wp_item.frame = mavros_msgs::Waypoint::FRAME_MISSION;
    wp_item.command = mavros_msgs::CommandCode::NAV_RETURN_TO_LAUNCH;
    wp_item.is_current = false;
    wp_item.autocontinue = true;
    wp_item.x_lat = 0;
    wp_item.y_long = 0;
    wp_item.z_alt = 0; //uh maybe not 0, probably 100
    wpPushRequest.request.waypoints.push_back(wp_item);


    wpPushRequest.request.start_index = 0;
    if(wpPushSrv.call(wpPushRequest)){
        ROS_INFO("wpPush sucess: %d", wpPushRequest.response.success);
        return wpPushRequest.response.wp_transfered;
    }else{
        ROS_INFO("Failed to call wpPush.\n");
        return 1;
    }
}
