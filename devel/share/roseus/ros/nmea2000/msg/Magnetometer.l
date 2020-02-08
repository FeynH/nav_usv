;; Auto-generated. Do not edit!


(when (boundp 'nmea2000::Magnetometer)
  (if (not (find-package "NMEA2000"))
    (make-package "NMEA2000"))
  (shadow 'Magnetometer (find-package "NMEA2000")))
(unless (find-package "NMEA2000::MAGNETOMETER")
  (make-package "NMEA2000::MAGNETOMETER"))

(in-package "ROS")
;;//! \htmlinclude Magnetometer.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass nmea2000::Magnetometer
  :super ros::object
  :slots (_header _magnetic ))

(defmethod nmea2000::Magnetometer
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:magnetic __magnetic) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _magnetic (float __magnetic))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:magnetic
   (&optional __magnetic)
   (if __magnetic (setq _magnetic __magnetic)) _magnetic)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _magnetic
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _magnetic
       (sys::poke _magnetic (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _magnetic
     (setq _magnetic (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nmea2000::Magnetometer :md5sum-) "072145ffd7e245f630d016dd83c1d0f9")
(setf (get nmea2000::Magnetometer :datatype-) "nmea2000/Magnetometer")
(setf (get nmea2000::Magnetometer :definition-)
      "Header header
float32 magnetic
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :nmea2000/Magnetometer "072145ffd7e245f630d016dd83c1d0f9")


