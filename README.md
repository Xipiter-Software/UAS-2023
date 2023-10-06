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

Also see
> https://mavlink.io/en/about/overview.html

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
waf configure build --board=CubeOrange
war plane
```

Also see
> Tutorial: https://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux

# Running a Simulation
First, launch a plane simulation use `~/ardupilot/ArduPlane$ sim_vehicle.py -v ArduPlane --map --console`

Next, run a MAVROS node to test connecting to the simulated plane.
`roslaunch mavros apm.launch fcu_url:=udp://127.0.0.1:14550@`

We used the address listed as "link 0" in the ardupilot simulation, listed in the fcu_url paramater.

Also see:
> Tutorial: https://ardupilot.org/dev/docs/ros-connecting.html
> Connection Types: http://wiki.ros.org/mavros#Usage
