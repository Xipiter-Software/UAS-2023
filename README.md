# UAS-2023 Documentation
This is a collection of information and steps taken during our journey towards creating an autopilot for this year's aircraft. It details the setup of our development environment, the hardware we use(d), any supporting softwares and why we chose them, and the thought process behind our design decisions. This is being written as we develop the autopilot with our new software subteam members, so it may not be complete upon viewing.

## Competition
The SUAS rulesets for the competition years can be found at https://suas-competition.org/competitions  
Every year, a new competition ruleset is released; whether that be to detail new competition elements or tweaks to previous elements.  

The general theme for each competition is that of a search & rescue mission. Teams are tasked with flying a waypoint course to "arrive" at the incident scene. There the UAV will identify ground targets and conduct payload drops at their corresponding markers. The aircraft is required to perform the mission autonomously (while takeoff & landing may be manually conducted).

# Setup
## Linux Enviroment
Ubuntu version 20.04 (Focal) is used for the development environment. This can either be run natively on your machine or through a virtual machine. This decision was made in order to run ROS Noetic which is not supported in later versions of Ubuntu.
### Using Linux

## ROS
ROS Basics: http://wiki.ros.org/ROS/Tutorials
Follow as many as possible
1-8, 10-11, 13-14, 16-18 are important

## MAVROS
MAVROS is a ROS package that handles communication between our companion computer and flight computer.

Also see
> https://github.com/mavlink/mavros/blob/master/mavros/README.md#installation

## MAVLink
MAVLink is just a protocol that is used to communicate commands and data

Also see
> https://mavlink.io/en/about/overview.html
> https://mavlink.io/en/messages/common.html

## ArduPilot
Clone the ArduPilot github to your home folder.
```
cd
git clone https://github.com/ArduPilot/ardupilot.git
```

Once done, go into the created directory.
```
cd ardupilot
```

Then run a setup script and reload the path
 ```
Tools/environment_install/install-prereqs-ubuntu.sh -y
. ~/.profile
./waf clean
```

Finally, build ArduPilot. This may take a while, (10-30 minutes).
```
./waf configure build --board=CubeOrange
./waf plane
```

Also see
> Tutorial: https://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux

# Development

## Github Setup
1. Install the GitHub CLI with `snap install gh`
2. Run `gh auth login` to link your GitHub account to loginto `GitHub.com` and use the `HTTPS` and `Login with a Browswer` options.
4. Make sure you have been added as a member to the `Xipiter-Software` organization. This way you can commiit your changes to the team's repository

# Running a Simulation
##  Step 1: ArduPlane
Launch a plane simulation use `~/ardupilot/ArduPlane$ sim_vehicle.py -v ArduPlane --map --console`

## Step 2: ROS Nodes

1. Run roscore
2. To prevent timesync issues (a warning that occurs when running the default mavros apm.launch file) set timesync_rate to 0.
```
# file /opt/ros/noetic/share/mavros/launch/px4_config.yaml
timesync_rate: 0    # TIMESYNC rate in Hertz (10.0 is default, feature disabled if 0.0)
```
3. Run a MAVROS node to test connecting to the simulated plane.
`~/catkin_ws roslaunch mavros px4.launch fcu_url:=udp://127.0.0.1:14550@`

We used the address listed as "link 0" in the ardupilot simulation, listed in the fcu_url paramater.

## Step 3:
```
rosrun mavros mavsafety arm
rosrun mavros mavsys mode -c takeoff
rosrun mavros mavcmd land 355.6 -35.36314024 149.16520213 0

```
Next steps:
1. Find source MAVROS files
2. Include in catkin_ws project

Camera/Image Processing Designs
1. People make model
2. People make dataset
3. People setup camera

`inteigent quads`
Also see:
> Tutorial: https://ardupilot.org/dev/docs/ros-connecting.html
> Connection Types: http://wiki.ros.org/mavros#Usage
