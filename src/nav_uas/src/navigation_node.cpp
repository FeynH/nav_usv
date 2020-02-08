#include <ros/ros.h>
#include "navigation_core.h"

int main(int argc,char **argv)
{
    ros::init(argc, argv, "navigation_uas");
    nav_uas::Navigation ntpn;
    ntpn.run();
    return 0;
}