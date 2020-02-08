/****************************************
*    @author  : He Xudong
*    @date    : 20190614
*    @ROS     : Kinetic
*    @Version : 1.0.0
****************************************/
#include "ros/ros.h"
#include <std_msgs/Empty.h>
#include <serial/serial.h>  //ROS已经内置了的串口包
#include <std_msgs/String.h>
#include "nmea2000/Magnetometer.h"
using namespace std;
serial::Serial ser; //声明串口对象
string imuport;
ros::Publisher _pub_magnetic;
static const int DATA_LENGTH=11;


int Parsefeedback(unsigned char* buffer, int & length)
{
    if (buffer == NULL || length < DATA_LENGTH)
    {
        return 1;
        
    }
    int index = 0;
    while (length >= DATA_LENGTH)
    {
        // if (buffer[index] == 0x0d && buffer[index+1] == 0x0a)
        // {
            
        //         nmea2000::Magnetometer _mag_msg;
        //         _mag_msg.header.stamp=ros::Time::now();
        //         int bai=(int)buffer[index+2]-48;
        //         int shi=(int)buffer[index+3]-48;
        //         int ge=(int)buffer[index+4]-48;
        //         int xiaoshu=(int)buffer[index+6]-48;
        //         _mag_msg.magnetic=(float)(bai*100+shi*10+ge)+(float)(xiaoshu)/10.0;
        //         cout<<"here is fastfeedback"<<endl;
        //         cout<<"buffer[2]: "<<(int)buffer[index+2]+0<<endl;
        //         _pub_magnetic.publish(_mag_msg);
        //         index = 0;
        //         length = length - DATA_LENGTH;
        //         memcpy(buffer, buffer + DATA_LENGTH, length);
        // }
        if (buffer[index] == 0x55 && buffer[index+1] == 0x53)
            {
            
                nmea2000::Magnetometer _mag_msg;
                _mag_msg.header.stamp=ros::Time::now();
                float temp_mag=(float)((short)((uint8_t)buffer[index+6]+((uint8_t)buffer[index+7]<<8)))/32768.0*180;
                if(0<temp_mag && temp_mag<=180)
                _mag_msg.magnetic=360.0-temp_mag;
                else if(temp_mag<0 && temp_mag>=-180.0)
                _mag_msg.magnetic=-1*temp_mag;
                else
                _mag_msg.magnetic=1000.;
                uint8_t sum=0x55+0x53+buffer[index+2]+buffer[index+3]+buffer[index+4]+buffer[index+5]+buffer[index+6]+buffer[index+7]+buffer[index+8]+buffer[index+9];
                if(sum==buffer[10])
                {cout<<"it's true"<<(uint8_t)sum<<endl;}
                //_mag_msg.magnetic=(float)(bai*100+shi*10+ge)+(float)(xiaoshu)/10.0;
                cout<<"buffer[7]: "<<(uint8_t)buffer[index+7]<<"buffer[6]"<<(uint8_t)buffer[index+6]<<endl;
                _pub_magnetic.publish(_mag_msg);
                index = 0;
                length = length - DATA_LENGTH;
                memcpy(buffer, buffer + DATA_LENGTH, length);
            }
        else{
                index = 0;
                length = length - 1;
                memcpy(buffer, buffer + 1, length);
            }
    }
    int j=0;
    int templength=0;
    for(int i=0;i<length;i++)
    {
        if(buffer[i]==0x0d)
        {
            memcpy(buffer, buffer + i, length-i);
            templength=length-i;
            j++;
            break;
        }
    }
    length=templength;
    return j;
}


int main (int argc, char** argv)
{
  //初始化节点
  ros::init(argc, argv, "magnetometer");
  //声明节点句柄
  ros::NodeHandle nh;
  ros::NodeHandle nh_get("~");
  nh_get.getParam("imuport",imuport);
  ROS_INFO("imuport is: %s",imuport.c_str());
  //订阅主题，并配置回调函数
   _pub_magnetic= nh.advertise<nmea2000::Magnetometer>("yaw", 10); //方位角
  
  //发布主题
  //ros::Publisher read_pub = nh.advertise<serial_common::f>("read", 64);//串口接收

  try
  {
  //设置串口属性，并打开串口
      ser.setPort(imuport);//串口名称
    //   ser.setPort("/dev/LowerPC");//串口名称
      ser.setBaudrate(115200);//波特率
      serial::Timeout to = serial::Timeout::simpleTimeout(1000);
      ser.setTimeout(to);
      ser.open();
  }
  catch (serial::IOException& e)
  {
      ROS_ERROR_STREAM("Unable to open port ");
      return -1;
  }
  //检测串口是否已经打开，并给出提示信息
  if(ser.isOpen())
  {
      ROS_INFO_STREAM("Serial Port initialized");
  }
  else
  {
      return -1;
  }

  unsigned char* buffer=new unsigned char[200]; 
  int joint=0;
  int length=0;
  ros::Rate loop_rate(100);//指定循环的频率 
  uint8_t read[1];
  //read[0]=0x31; 
  //ser.write(read,1);
  while(ros::ok())
  {   
      if(ser.available()){
          ROS_INFO_STREAM("Reading from serial port\n");
          std_msgs::String result;
          result.data = ser.read(ser.available());
          if(joint)
          {    
             //ROS_INFO_STREAM("joint is 1");
             memcpy(buffer+length, (unsigned char *)result.data.c_str(),result.data.length());
             //*(buffer+length)=*((unsigned char *)result.data.c_str());
             }
          else if(joint==0)
          {   
            //ROS_INFO_STREAM("joint is 0");
            memcpy(buffer,(unsigned char *)result.data.c_str(),result.data.length());
            //*(buffer)=*((unsigned char *)result.data.c_str());
            //string tempstr=(char *)buffer;
              }    
          length=length+result.data.length();
          ROS_INFO_STREAM("Read: " << length<<"\n");
          joint=Parsefeedback(buffer,length);
      }
      //ser.write(read,1);
      //处理ROS的信息，比如订阅消息,并调用回调函数
      ros::spinOnce();
      loop_rate.sleep();
  }
}
