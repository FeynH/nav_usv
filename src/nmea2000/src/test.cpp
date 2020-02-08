#include <nmea2000/myfilter.hpp>
#include <nmea2000/geo_pos_conv.hpp>
#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <ros/ros.h>
using namespace std;

geo_pos_conv _testgeo;

double GeshiChange(double Dufen)
{
  int du=int(Dufen/100);
  double fen=fmod(Dufen,100)/60.0;
  double gpsData=double(du)+fen;
  return gpsData;
}

vector<double> split(const std::string &string)
{
  std::vector<std::string> str_vec_ptr;
  std::string token;
  std::stringstream ss(string);

  while (getline(ss, token, ','))
    str_vec_ptr.push_back(token);
 vector<double> LatAndLon;
  LatAndLon.push_back(GeshiChange(stod(str_vec_ptr.at(2))));
  LatAndLon.push_back(GeshiChange(stod(str_vec_ptr.at(4))));
  LatAndLon.push_back(stod(str_vec_ptr.at(1)));
  return LatAndLon;
}

//读取GPS数据
vector< vector<double> > getGPS(string path)
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

int main(int argc, char** argv){
    ros::init(argc, argv, "testGPS");
    double last_timestamp=0.0, now_timestamp=0.0;
    lpf mylpf(20.0);
    _testgeo.set_plane(34.2194186,108.9982604);
    vector< vector<double> > Data_GPS=getGPS("/home/ubuntu/Documents/test.txt");
    ofstream out("/home/ubuntu/Documents/out.txt");
    int size=Data_GPS.size();
    int i=0;
    while(i<size){//获取传感器数据
        //initialize kalman filter
        //double input[3];
        // input[0]=Data_GPS[i][2];
        // input[1]=Data_GPS[i][0];
        // input[2]=Data_GPS[i][1];
        mylpf.filter(Data_GPS[i][2],Data_GPS[i][0],Data_GPS[i][1]);
        _testgeo.set_llh_nmea_degrees(mylpf.getX(),mylpf.getY(),0);
        cout.precision(7);
        cout.setf(ios::fixed);
        out.precision(7);
        out.setf(ios::fixed);
        out<<_testgeo.x()<<","<<_testgeo.y()<<"\n";
        cout<<"LPF output x: "<<_testgeo.x()<<"  "<<
        "y: "<<_testgeo.y()<<endl;
        i++;
    }
    out.close();
    ros::spin();
    return 0;
}