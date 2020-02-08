; Auto-generated. Do not edit!


(cl:in-package nav_uas-msg)


;//! \htmlinclude Nav_msg.msg.html

(cl:defclass <Nav_msg> (roslisp-msg-protocol:ros-message)
  ((Angle
    :reader Angle
    :initarg :Angle
    :type cl:float
    :initform 0.0)
   (Distance
    :reader Distance
    :initarg :Distance
    :type cl:float
    :initform 0.0)
   (IsArrive
    :reader IsArrive
    :initarg :IsArrive
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Nav_msg (<Nav_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_uas-msg:<Nav_msg> is deprecated: use nav_uas-msg:Nav_msg instead.")))

(cl:ensure-generic-function 'Angle-val :lambda-list '(m))
(cl:defmethod Angle-val ((m <Nav_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_uas-msg:Angle-val is deprecated.  Use nav_uas-msg:Angle instead.")
  (Angle m))

(cl:ensure-generic-function 'Distance-val :lambda-list '(m))
(cl:defmethod Distance-val ((m <Nav_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_uas-msg:Distance-val is deprecated.  Use nav_uas-msg:Distance instead.")
  (Distance m))

(cl:ensure-generic-function 'IsArrive-val :lambda-list '(m))
(cl:defmethod IsArrive-val ((m <Nav_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_uas-msg:IsArrive-val is deprecated.  Use nav_uas-msg:IsArrive instead.")
  (IsArrive m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav_msg>) ostream)
  "Serializes a message object of type '<Nav_msg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'IsArrive)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav_msg>) istream)
  "Deserializes a message object of type '<Nav_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'IsArrive) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav_msg>)))
  "Returns string type for a message object of type '<Nav_msg>"
  "nav_uas/Nav_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav_msg)))
  "Returns string type for a message object of type 'Nav_msg"
  "nav_uas/Nav_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav_msg>)))
  "Returns md5sum for a message object of type '<Nav_msg>"
  "39a4dfb897b4de0e5aa5ba62412e2faf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav_msg)))
  "Returns md5sum for a message object of type 'Nav_msg"
  "39a4dfb897b4de0e5aa5ba62412e2faf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav_msg>)))
  "Returns full string definition for message of type '<Nav_msg>"
  (cl:format cl:nil "float64 Angle~%float64 Distance~%int16 IsArrive~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav_msg)))
  "Returns full string definition for message of type 'Nav_msg"
  (cl:format cl:nil "float64 Angle~%float64 Distance~%int16 IsArrive~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav_msg>))
  (cl:+ 0
     8
     8
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav_msg
    (cl:cons ':Angle (Angle msg))
    (cl:cons ':Distance (Distance msg))
    (cl:cons ':IsArrive (IsArrive msg))
))
