#include "ros/ros.h"
#include "uas_calls.cpp"
#include <string.h>
#include <cstdlib>

ros::ServiceClient armService;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "uas_main_script");

  uas_arm(atoi(argv[1]));
  uas_mode(argv[2]);

  UAS.wp.push()

}