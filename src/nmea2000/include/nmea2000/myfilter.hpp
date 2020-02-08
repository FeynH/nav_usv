#ifndef _MYFILTER_
#define _MYFILTER_

#include <math.h>
//#include <iostream>

//namespace gpsodom{
class lpf{
    private:
        double now_stamp;
        double last_stamp;
        double x;
        double y;
        double fcut;
        bool isInitialization;
    public:
        lpf(double _x, double _y, double _fcut);
        lpf(double _fcut);
        ~lpf();
        void set_fcut(double _fcut);
        double getFcut();
        double getX();
        double getY();
        void filter(double time, double x_, double y_);
};
//}
#endif