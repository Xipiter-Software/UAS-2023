# UAS-2023 Documentation
## Tutorials
ROS Basics: http://wiki.ros.org/ROS/Tutorials
Follow as many as possible
1-8, 10-11, 13-14, 16-18 are important
## Competition
Reading the rules
SUAS: https://suas-competition.org/competitions
# Setup
## Linux Enviroment
### Uning Linux
## Install Software
### ROS
### ArduPilot

# Development
## Github Setup
1. Install the GitHub CLI with `snap install gh`
2. Run `gh auth login` to link your GitHub account to loginto `GitHub.com` and use the `HTTPS` and `Login with a Browswer` options.
4. Make sure you have been added as a member to the `Xipiter-Software` organization. This way you can commiit your changes to the team's repository

## MAVROS
MAVROS is a ROS package that handles communication between our companion computer and flight computer.


## MAVLink
MAVLink is just a protocol that is used to communicate commands and data
https://mavlink.io/en/about/overview.html

## ArduPilot
Clone the ArduPilot github to your home folder.
```cd
git clone https://github.com/ArduPilot/ardupilot.git```

Once done, 

# Running a Simulation
First, launch a plane simulation use `~/ardupilot/ArduPlane$ sim_vehicle.py -v ArduPlane --map --console`

Next, run a MAVROS node to test connecting to the simulated plane.
`roslaunch mavros apm.launch fcu_url:=udp://127.0.0.1:14550@`
We used the address listed as "link 0" in the ardupilot simulation, listed in the fcu_url paramater. Also look at the https://ardupilot.org/dev/docs/ros-connecting.html for a tutorial, and http://wiki.ros.org/mavros#Usage for other connection types.

