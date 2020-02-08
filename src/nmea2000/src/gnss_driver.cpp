// C++ includes
#include <nmea2000/myfilter.hpp>
#include <string>
#include <memory>
#include <iostream>
// ROS includes
#include <ros/ros.h>
#include <sensor_msgs/NavSatFix.h>
#include <nmea_msgs/Sentence.h>
#include "nmea2000/Cartesian.h"
#include <nmea2000/geo_pos_conv.hpp>
//#include <tf/transform_broadcaster.h>
using namespace std;

ros::Publisher pub1_;
double origin_lat,origin_lon;
const string MAP_FRAME_="map";
geo_pos_conv geo_;
lpf mylpf_(20.0);
double orientation_time_, position_time_;
ros::Time current_time_, orientation_stamp_;  

// struct GNSS_DATA
// {
// double lat;
// double lon;
// double h;
// };

// struct GNSS_DATA gnssData;

void publishNavSatStamped()
{
  nmea2000::Cartesian xyData;
  xyData.header.frame_id = MAP_FRAME_;
  xyData.header.stamp= current_time_;
  xyData.x=mylpf_.getX();
  xyData.y= mylpf_.getY();
  pub1_.publish(xyData);

}

double GeshiChange(double Dufen)
{
  int du=int(Dufen/100);
  double fen=fmod(Dufen,100)/60.0;
  double gpsData=double(du)+fen;
  return gpsData;
}

const int convert(std::vector<std::string> nmea, ros::Time current_stamp)
{
  
    if(nmea.at(0).compare(3, 3, "GGA")==0)   //新增部分，对GPYBM报文进行解析
    {
      if(nmea.at(2)==""||nmea.at(4)=="")
      {
        cout<<"The Message is invalid"<<endl;
        return 0;
      }
      position_time_= stod(nmea.at(1));
      orientation_time_ = stod(nmea.at(1));
      double lat=GeshiChange(stod(nmea.at(2)));
      double lon = GeshiChange(stod(nmea.at(4)));
      double h =stod(nmea.at(9));
      orientation_stamp_ = current_stamp;    //添加的
      geo_.set_llh_nmea_degrees(lat, lon, h);
      mylpf_.filter(position_time_,geo_.x(),geo_.y());
      //ROS_INFO("GGA lat=:%f,lon=:%f,h=:%f",lat,lon,h);
      //ROS_INFO("x=%f,y=%f",geo_.x(),geo_.y());
      //cout<<"1:"<<nmea.at(0)<<" "<<"2:"<<nmea.at(1)<<" "<<"3:"<<nmea.at(2)<<" "<<"4:"<<nmea.at(3)<<endl;
      return 1;                                       //如果有GGA报文并且报文中存在经纬度值才算有效值。
    }
    return 0;
}


vector<std::string> split(const std::string &string)
{
  std::vector<std::string> str_vec_ptr;
  std::string token;
  std::stringstream ss(string);

  while (getline(ss, token, ','))
    str_vec_ptr.push_back(token);

  return str_vec_ptr;
}


void callbackFromNmeaSentence(const nmea_msgs::Sentence::ConstPtr &msg)
{
 current_time_ = msg->header.stamp;
 const int valid=convert(split(msg->sentence), msg->header.stamp);//解析报文
 //double e = 1e-2;
  if(valid)//fabs(orientation_time_ - position_time_) < e
  {
    publishNavSatStamped();
    ROS_INFO("pose is pubed");
    return;
  }
}

int main(int argc, char** argv)
{
  //初始化节点
  ros::init(argc, argv, "gnss_sender");
   //声明节点句柄
  ros::NodeHandle nh;
  ros::NodeHandle nh_get("~");
  nh_get.getParam("origin_lat",origin_lat);
  nh_get.getParam("origin_lon",origin_lon);
  geo_.set_plane(origin_lat,origin_lon);
  //ros::Rate loop_rate(50);//指定循环的频率 
  ros::Subscriber sub1=nh.subscribe("nmea_sentence", 100, callbackFromNmeaSentence);
  pub1_=nh.advertise<nmea2000::Cartesian>("gps_xy", 10);
  ros::spin();
  return 0;
}
