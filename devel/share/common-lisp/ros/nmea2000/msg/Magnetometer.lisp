; Auto-generated. Do not edit!


(cl:in-package nmea2000-msg)


;//! \htmlinclude Magnetometer.msg.html

(cl:defclass <Magnetometer> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (magnetic
    :reader magnetic
    :initarg :magnetic
    :type cl:float
    :initform 0.0))
)

(cl:defclass Magnetometer (<Magnetometer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Magnetometer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Magnetometer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nmea2000-msg:<Magnetometer> is deprecated: use nmea2000-msg:Magnetometer instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Magnetometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nmea2000-msg:header-val is deprecated.  Use nmea2000-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'magnetic-val :lambda-list '(m))
(cl:defmethod magnetic-val ((m <Magnetometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nmea2000-msg:magnetic-val is deprecated.  Use nmea2000-msg:magnetic instead.")
  (magnetic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Magnetometer>) ostream)
  "Serializes a message object of type '<Magnetometer>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'magnetic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Magnetometer>) istream)
  "Deserializes a message object of type '<Magnetometer>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'magnetic) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Magnetometer>)))
  "Returns string type for a message object of type '<Magnetometer>"
  "nmea2000/Magnetometer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Magnetometer)))
  "Returns string type for a message object of type 'Magnetometer"
  "nmea2000/Magnetometer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Magnetometer>)))
  "Returns md5sum for a message object of type '<Magnetometer>"
  "072145ffd7e245f630d016dd83c1d0f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Magnetometer)))
  "Returns md5sum for a message object of type 'Magnetometer"
  "072145ffd7e245f630d016dd83c1d0f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Magnetometer>)))
  "Returns full string definition for message of type '<Magnetometer>"
  (cl:format cl:nil "Header header~%float32 magnetic~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Magnetometer)))
  "Returns full string definition for message of type 'Magnetometer"
  (cl:format cl:nil "Header header~%float32 magnetic~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Magnetometer>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Magnetometer>))
  "Converts a ROS message object to a list"
  (cl:list 'Magnetometer
    (cl:cons ':header (header msg))
    (cl:cons ':magnetic (magnetic msg))
))
