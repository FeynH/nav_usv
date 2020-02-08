// Generated by gencpp from file nmea2000/Cartesian.msg
// DO NOT EDIT!


#ifndef NMEA2000_MESSAGE_CARTESIAN_H
#define NMEA2000_MESSAGE_CARTESIAN_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace nmea2000
{
template <class ContainerAllocator>
struct Cartesian_
{
  typedef Cartesian_<ContainerAllocator> Type;

  Cartesian_()
    : header()
    , x(0.0)
    , y(0.0)  {
    }
  Cartesian_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , x(0.0)
    , y(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::nmea2000::Cartesian_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nmea2000::Cartesian_<ContainerAllocator> const> ConstPtr;

}; // struct Cartesian_

typedef ::nmea2000::Cartesian_<std::allocator<void> > Cartesian;

typedef boost::shared_ptr< ::nmea2000::Cartesian > CartesianPtr;
typedef boost::shared_ptr< ::nmea2000::Cartesian const> CartesianConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nmea2000::Cartesian_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nmea2000::Cartesian_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace nmea2000

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'nmea2000': ['/home/ubuntu/Documents/test_ws/src/nmea2000/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::nmea2000::Cartesian_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nmea2000::Cartesian_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nmea2000::Cartesian_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nmea2000::Cartesian_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nmea2000::Cartesian_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nmea2000::Cartesian_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nmea2000::Cartesian_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f16aa5647280167f1cb51bc642522156";
  }

  static const char* value(const ::nmea2000::Cartesian_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf16aa5647280167fULL;
  static const uint64_t static_value2 = 0x1cb51bc642522156ULL;
};

template<class ContainerAllocator>
struct DataType< ::nmea2000::Cartesian_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nmea2000/Cartesian";
  }

  static const char* value(const ::nmea2000::Cartesian_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nmea2000::Cartesian_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
float64 x\n\
float64 y\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::nmea2000::Cartesian_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nmea2000::Cartesian_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Cartesian_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nmea2000::Cartesian_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nmea2000::Cartesian_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NMEA2000_MESSAGE_CARTESIAN_H