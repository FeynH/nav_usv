#include <nmea2000/myfilter.hpp>
lpf::lpf(double _x, double _y, double _fcut):x(_x),y(_y),fcut(_fcut){   
            isInitialization=false;         
        }
lpf::lpf(double _fcut):fcut(_fcut){;}
lpf::~lpf(){;}
void lpf::set_fcut(double _fcut){
            fcut=_fcut;
        }
double lpf::getFcut(){
            return fcut;  
        }
double lpf::getX(){
            return x;
        }
double lpf::getY()
        {
            return y;
        }
void lpf::filter(double time, double x_, double y_)
        {
            now_stamp=time;
            if(!isInitialization){
                last_stamp=now_stamp;
                x=x_;
                y=y_;
                isInitialization=true;
            }
            double deltaT=now_stamp-last_stamp;
            float b=2*M_PI*fcut*deltaT;
            double a=b/(1+b);
            x=a*x_+(1-a)*x;
            y=a*y_+(1-a)*y;
            last_stamp=now_stamp;
        }