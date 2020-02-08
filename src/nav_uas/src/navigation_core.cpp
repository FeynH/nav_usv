#include "navigation_core.h"
using namespace std;
using namespace Eigen;
namespace nav_uas
{
Navigation::Navigation()
 : direction(1)
 , isArrive(0)
 , indexOfPoint(0)
 , isNavigation(0)
 , distance(0.0)
 , angle(0.0)
 , current_msg({ros::Time::now(),ros::Time::now(),0.,0.,0.})
{
    initForROS();
    outPath=ofstream("/home/ubuntu/Documents/test_ws/outPath.txt");
}
Navigation::~Navigation()
{
}

void Navigation::initForROS()
{   
    ros::NodeHandle nh_get_("~");
    nh_get_.getParam("threshold_dist",threshold_dist);
    nh_get_.getParam("path",path);
    ROS_INFO("dist is: %f",threshold_dist);
    waypoints=getWaypoints(path);
    length=waypoints.size();
    targetPoint=waypoints[0];
    pub1_=nh_.advertise<nav_uas::Nav_msg>("nav_msg",10);
    sub_gps=nh_.subscribe("gps_xy",100,&Navigation::callbackForGPS,this);
    sub_yaw=nh_.subscribe("yaw",100,&Navigation::callbackForYaw,this);
    //open the serial port
//     try
//   {
//   //设置串口属性，并打开串口
//       ser.setPort("/dev/ttyUSB1");//串口名称
//     //   ser.setPort("/dev/LowerPC");//串口名称
//       ser.setBaudrate(115200);//波特率
//       serial::Timeout to = serial::Timeout::simpleTimeout(1000);
//       ser.setTimeout(to);
//       ser.open();
//   }
//   catch (serial::IOException& e)
//   {
//       ROS_ERROR_STREAM("Unable to open port ");
//       return -1;
//   }
//   //检测串口是否已经打开，并给出提示信息
//   if(ser.isOpen())
//   {
//       ROS_INFO_STREAM("Serial Port initialized");
//   }
//   else
//   {
//       return -1;
//   }
//   return 0;
}

void Navigation::run()
{
    ros::spin();
}

// void Navigation::write2slave()    //通过串口将夹角数据发送给下位机
// {
//     uint8_t Buffer[10];
//     short temp_angle=short(angle*10);
//     short temp_distance=short(distance*10);
//     Buffer[0]=0x56;          //起始位
//     Buffer[1]=0x51;
//     Buffer[2]=temp_angle>>8;
//     Buffer[3]=temp_angle&0xff;
//     Buffer[4]=temp_distance>>8;
//     Buffer[5]=temp_distance&0xff;
//     if(!isArrive)
//     Buffer[6]=0x01;
//     else
//     Buffer[6]=0x00;
//     // Buffer[7]=0x00;
//     // Buffer[8]=0x00;
//     Buffer[9]=0xf0;   //停止位
//     ser.write(Buffer,10);
// }

void Navigation::pulishNav_msg()   //小车试验
{
    nav_uas::Nav_msg my_nav_msg;
    my_nav_msg.Angle=angle;
    my_nav_msg.Distance=distance;
    my_nav_msg.IsArrive=isArrive;
    pub1_.publish(my_nav_msg);
}

void Navigation::Compute()
{
    Eigen::Vector3d v1(cos(current_msg.yaw*M_PI/180),sin(current_msg.yaw*M_PI/180),0);//船身向量,x方向为正北方向
    Eigen::Vector3d v2(targetPoint[0]-current_msg.x,targetPoint[1]-current_msg.y,0);
    ROS_INFO("yam=%f,x=%f,y=%f",current_msg.yaw,current_msg.x,current_msg.y);
    distance=sqrt(v2.transpose()*v2);
    // if(distance<=threshold_dist)   //如果
    v2=v2/distance;
    Eigen::Vector3d v3=v1.cross(v2);
    double cos_theta=(v1.dot(v2))/sqrt(((v1.transpose()*v1)*(v2.transpose()*v2))); //两个向量之间的夹角的余弦值
    double theta=acos((cos_theta > 1) ? 1 : (cos_theta < -1) ? -1 : cos_theta);  //0~M_PI之间的值
    if(v3(2)>0)
    { theta=(-1)*theta*180/M_PI; }
    else if(v3(2)==0)
    { theta=0;}
    else 
    { theta=theta*180/M_PI; }
    angle=theta;
}

void Navigation::callbackForYaw(const nmea2000::Magnetometer::ConstPtr &yaw_msg)
{
    current_msg.orientation_time=yaw_msg->header.stamp;
    current_msg.yaw=yaw_msg->magnetic;
}

void Navigation::callbackForGPS(const nmea2000::Cartesian::ConstPtr &gps_msg)
{
    current_msg.position_time=gps_msg->header.stamp;
    current_msg.x=gps_msg->x;
    current_msg.y=gps_msg->y;
    Compute();
    outPath<<current_msg.x<<","<<current_msg.y<<","<<current_msg.yaw<<","<<angle<<","<<distance<<"\n";
    if(distance<=threshold_dist)
    {
        isArrive=1;
        indexOfPoint+=1;                //临时不完整写法
        if(indexOfPoint==2)
        {
            outPath.close();
            ros::shutdown();
        }
        targetPoint=waypoints[indexOfPoint];
        ROS_INFO("the target is %d",indexOfPoint);
    }
    //write2slave();
    pulishNav_msg();
}




vector<double> split(const std::string &string)
{
  std::vector<std::string> str_vec_ptr;
  std::string token;
  std::stringstream ss(string);

  while (getline(ss, token, ','))
    str_vec_ptr.push_back(token);
  vector<double> myWaypoints;
  myWaypoints.push_back(stod(str_vec_ptr.at(0)));
  myWaypoints.push_back(stod(str_vec_ptr.at(1)));
  return  myWaypoints;
}

//读取GPS数据
vector< vector<double> > getWaypoints(string path)
{
    ifstream originalData(path);
    vector< vector<double> > ParseData;
    if(originalData.is_open())
    {
        string line;
        while(getline(originalData,line)){
                ParseData.push_back(split(line));
        }
        {
                originalData.close();
        }
    }
    return ParseData;
}

}
