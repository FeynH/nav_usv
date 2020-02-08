#ifndef NAVIGATION_CORE_H
#define NAVIGATION_CORE_H

//c++ include
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <math.h>
//ROS include 
#include <ros/ros.h>
#include <serial/serial.h>
#include <eigen3/Eigen/Dense>
#include <nmea2000/Cartesian.h>
#include <nmea2000/Magnetometer.h>
#include <nav_uas/Nav_msg.h>
using namespace std;

namespace nav_uas
{
    /* code */
class Navigation
{
    public:
        Navigation();
        ~Navigation();
        void run();   
    private:
        //handle
        ros::NodeHandle nh_;
        //publisher
        ros::Publisher pub1_;
        //subscriber
        ros::Subscriber sub_gps;
        ros::Subscriber sub_yaw;
        
        //struct for original navigation message
        struct Combination{
           ros::Time position_time;
           ros::Time  orientation_time;
           double x;
           double y;
           double yaw;
        };
        //variable
        serial::Serial ser;
        int direction;  //巡河方向 1：从起点到终点方向   0：从终点到起点方向
        int isArrive;   //1表示到达目标点，0表示没有
        int isNavigation;   //是否进行导航,0不导航 1导航
        int indexOfPoint;   //当前目标点的下标
        int length;
        double threshold_dist;
        double distance;
        double angle;
        string path;
        Combination current_msg;
        vector< vector<double> > waypoints;
        vector<double> targetPoint;
        ofstream outPath;
        //callbacks
        void callbackForGPS(const nmea2000::Cartesian::ConstPtr &gps_msg);
        void callbackForYaw(const nmea2000::Magnetometer::ConstPtr &yaw_msg);

        //intializer
        void initForROS();

        //functions
        void seachForClosePoint();
        //void write2slave();
        void pulishNav_msg();
        void Compute(); //计算当前航向与当前位置和目标点连线之间的夹角
};
vector<double> split(const std::string &string);
vector< vector<double> > getWaypoints(string path);    //get waypoints from file
}

#endif