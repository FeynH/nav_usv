#include "boat_control.h"

void dealCmd_vel(const geometry_msgs::Twist::ConstPtr &msg)
{
    double speed_temp[2];
    double speed_lin=msg->linear.x/maxSpeedLin*maxWhellSpeed;
    double speed_ang=msg->angular.z/maxSpeedAng*maxWhellSpeed;
    double scale=max(fabs(speed_lin+speed_ang/2.0),fabs(speed_lin-speed_ang/2))/maxWhellSpeed;
    if (scale>1.0)
    {
        scale=1.0/scale;
    }
    speed_temp[0]=scale*(speed_lin-speed_ang/2);
    speed_temp[0] = std::min(speed_temp[0], 1000.0);
    speed_temp[0] = std::max(0.0, speed_temp[0]);
    
    speed_temp[1] = scale * (speed_lin + speed_ang / 2)+offset_right;
    speed_temp[1] = std::min(speed_temp[1], 1000.0);
    speed_temp[1] = std::max(0.0, speed_temp[1]);
    
    left_speed=short(speed_temp[0]);
    right_speed=short(speed_temp[1]);
    uint8_t buffer[10];
    buffer[0]=0x56;
    buffer[1]=0x51;
    buffer[2]=0x00;
    buffer[3]=left_speed>>8;
    buffer[4]=left_speed&0xff;
    buffer[5]=right_speed>>8;
    buffer[6]=right_speed&0xff;
    buffer[9]=0xf0;
    ser3.write(buffer,10);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "boat_control");
    ros::NodeHandle nh;
    ros::NodeHandle nh_get("~");
    ros::Subscriber sub_cmd_vel= nh.subscribe("/cmd_vel", 1000,  dealCmd_vel);
    nh_get.getParam("controlPort",controlPort);
    nh_get.getParam("Baudrate",Baudrate);
    nh_get.getParam("offset_right",offset_right);
    try
  {
  //设置串口属性，并打开串口
      ser3.setPort(controlPort);//串口名称
    //   ser3.setPort("/dev/LowerPC");//串口名称
      ser3.setBaudrate(Baudrate);//波特率
      serial::Timeout to = serial::Timeout::simpleTimeout(1000);
      ser3.setTimeout(to);
      ser3.open();
  }
  catch (serial::IOException& e)
  {
      ROS_ERROR_STREAM("Unable to open port ");
      return -1;
  }
  //检测串口是否已经打开，并给出提示信息
  if(ser3.isOpen())
  {
      ROS_INFO_STREAM("serial Port initialized");
  }
  else
  {
      return -1;
  }
  ros::spin();
}
