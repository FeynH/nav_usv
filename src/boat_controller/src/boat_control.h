#ifndef BOAT_CONTROL_H
#define BOAT_CONTROL_H

#include <geometry_msgs/Twist.h>
#include <serial/serial.h>
#include <ros/ros.h>
#include <string> 

using namespace std;
serial::Serial ser3;
string controlPort;
int Baudrate;
double maxSpeedLin=0.5;
double maxSpeedAng=1.0;
double maxWhellSpeed=1000.0;
double offset_right;
short left_speed,right_speed;
void dealCmd_vel(const geometry_msgs::Twist::ConstPtr &msg);
#endif