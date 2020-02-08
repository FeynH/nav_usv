# nav_usv
Navigation for unmanned  boat   
导航系统的硬件整体框图如下所示：  
![水面导航硬件框图](https://tva3.sinaimg.cn/mw690/0060BUgEly1gbp3ebtrn7j30db0cbglm.jpg)   

船的定位信息和目标点位置均由GPS得到，只不过在本系统中将直接由GPS得到的经纬度转换成了东北天局部坐标系下的坐标点（原点的经纬度可以自行设置）。  

IMU为九轴IMU，含地磁计，其主要功能为得到船的航向角（和正北方向的绝对夹角）。   
   
由于目标点位置和船当前位置都处于东北天局部坐标系中，所以可以通过目标点和船当前位置的连线以及船的航向角得到船身方向和连线之间的夹角。控制目标就是使这个夹角变小和连线长度变短。  
   
## 各功能包简介
* nmea2000
* nav_uas
* boat_controller
### nmea2000

