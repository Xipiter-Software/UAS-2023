#include "ros/ros.h"
#include "uas_calls.cpp"
#include <string.h>
#include <cstdlib>

ros::ServiceClient armService;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "uas_main_script");

  UAS uav = UAS();

  UAS::WP.push();
  uav.arming(atoi(argv[1]));
  uav.set_mode(argv[2]);




}