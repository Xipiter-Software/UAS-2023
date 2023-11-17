#ifndef HEADERFILE_H
#define HEADERFILE_H

#include <ros/ros.h>
#include <string.h>
#include <stdlib.h>

//mavros service deffinitions
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/WaypointPush.h>
#include <mavros_msgs/WaypointPull.h>
#include <mavros_msgs/WaypointList.h>
#include <mavros_msgs/WaypointClear.h>
   

class uasControl 
{
public:
    // Constructor
    uasControl(ros::NodeHandle nodeHandle);

    ros::NodeHandle n;

    // MAVROS Services
    ros::ServiceClient armingSrv;
    ros::ServiceClient setModeSrv;
    ros::ServiceClient wpPushSrv;
    ros::ServiceClient wpPullSrv;
    ros::ServiceClient wpListSrv;
    ros::ServiceClient wpClearSrv;

    // Base functions    
    int setArming(bool armed);
    int setMode(std::string custom_mode);

    int wpPush(std::vector<mavros_msgs::Waypoint, std::allocator<mavros_msgs::Waypoint>> waypointList, u_int16_t startIndex);
    u_int32_t wpPull();
    int wpClear();

    //Example class extention declaration
    int captureImage();

    int wpPushTest();

};

#endif