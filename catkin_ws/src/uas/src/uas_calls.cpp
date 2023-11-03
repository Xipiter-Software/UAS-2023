#include "ros/ros.h"
#include <string.h>
#include <cstdlib>

// Messages
#include "mavros_msgs/SetMode.h"
#include "mavros_msgs/Waypoint.h"

// Services
#include "mavros_msgs/CommandBool.h"
#include "mavros_msgs/WaypointPush.h"
#include "mavros_msgs/WaypointPull.h"
#include "mavros_msgs/WaypointList.h"





class UAS {

    /* Service call template for ROS messages

        #include "#SRV_MSG.h"

        int uas_#NAME(#ARGS)
        {
            ros::NodeHandle n;
            ros::ServiceClient Service = n.serviceClient<mavros_msgs::#SRV_MSG>("#SRV_NAME");
            mavros_msgs::#SRV_MSG srv;

            // Customize
            srv.request.#REQUEST_VAR = #ARGS;

            if (Service.call(srv))
            {
                ROS_INFO("Settng mode");
            }
            else
            {
                ROS_ERROR("Failed to call service while changing mode");
                return 1;
            }

            return 0;
        }

        */

    struct WP {
        int push()
        {
            ROS_WARN("Push ran");
        }

        int pull()
        {
            ROS_WARN("Pull ran");
        }

    };

    int uas_arm(bool armed)
    {

        ros::NodeHandle n;
        ros::ServiceClient Service = n.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
        mavros_msgs::CommandBool srv;

        srv.request.value = armed;

        if (Service.call(srv))
        {
            ROS_INFO("Settng arm to %d (Success == 1): %d", (int)armed, (int)srv.response.success);
        }
        else
        {
            ROS_ERROR("Failed to call service while arming");
            return 1;
        }

        return 0;
    }

    int uas_mode(std::string mode)
    {
        ros::NodeHandle n;
        ros::ServiceClient Service = n.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
        mavros_msgs::SetMode srv;
        srv.request.custom_mode = mode;

        if (Service.call(srv))
        {
            ROS_INFO("Settng mode");
        }
        else
        {
            ROS_ERROR("Failed to call service while changing mode");
            return 1;
        }

        return 0;
    }

};

