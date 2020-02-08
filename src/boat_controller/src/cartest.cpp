#include <geometry_msgs/Twist.h>
#include <nav_uas/Nav_msg.h>
#include <ros/ros.h>
#include <math.h>
ros::Publisher pub_control;

void subCallback(const nav_uas::Nav_msg::ConstPtr &msg)
{
    geometry_msgs::Twist test_controll;
    test_controll.angular.z=(fabs(msg->Angle)>=100)?0.8:0.8*msg->Angle/100;
    test_controll.linear.x=0.5-std::min(fabs(test_controll.angular.z),0.5);
    pub_control.publish(test_controll);
}

int main(int argc, char** argv){
    ros::init(argc, argv, "cartest");
    ros::NodeHandle nh1;
    ros::Subscriber sub_nav = nh1.subscribe("nav_msg", 100, subCallback);
    pub_control=nh1.advertise<geometry_msgs::Twist>("cmd_vel",100); 
    ros::spin();
    return 0;
}
