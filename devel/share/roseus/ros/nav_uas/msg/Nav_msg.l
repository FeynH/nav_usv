;; Auto-generated. Do not edit!


(when (boundp 'nav_uas::Nav_msg)
  (if (not (find-package "NAV_UAS"))
    (make-package "NAV_UAS"))
  (shadow 'Nav_msg (find-package "NAV_UAS")))
(unless (find-package "NAV_UAS::NAV_MSG")
  (make-package "NAV_UAS::NAV_MSG"))

(in-package "ROS")
;;//! \htmlinclude Nav_msg.msg.html


(defclass nav_uas::Nav_msg
  :super ros::object
  :slots (_Angle _Distance _IsArrive ))

(defmethod nav_uas::Nav_msg
  (:init
   (&key
    ((:Angle __Angle) 0.0)
    ((:Distance __Distance) 0.0)
    ((:IsArrive __IsArrive) 0)
    )
   (send-super :init)
   (setq _Angle (float __Angle))
   (setq _Distance (float __Distance))
   (setq _IsArrive (round __IsArrive))
   self)
  (:Angle
   (&optional __Angle)
   (if __Angle (setq _Angle __Angle)) _Angle)
  (:Distance
   (&optional __Distance)
   (if __Distance (setq _Distance __Distance)) _Distance)
  (:IsArrive
   (&optional __IsArrive)
   (if __IsArrive (setq _IsArrive __IsArrive)) _IsArrive)
  (:serialization-length
   ()
   (+
    ;; float64 _Angle
    8
    ;; float64 _Distance
    8
    ;; int16 _IsArrive
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _Angle
       (sys::poke _Angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Distance
       (sys::poke _Distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _IsArrive
       (write-word _IsArrive s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _Angle
     (setq _Angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Distance
     (setq _Distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _IsArrive
     (setq _IsArrive (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get nav_uas::Nav_msg :md5sum-) "39a4dfb897b4de0e5aa5ba62412e2faf")
(setf (get nav_uas::Nav_msg :datatype-) "nav_uas/Nav_msg")
(setf (get nav_uas::Nav_msg :definition-)
      "float64 Angle
float64 Distance
int16 IsArrive

")



(provide :nav_uas/Nav_msg "39a4dfb897b4de0e5aa5ba62412e2faf")


