
(cl:in-package :asdf)

(defsystem "nmea2000-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Cartesian" :depends-on ("_package_Cartesian"))
    (:file "_package_Cartesian" :depends-on ("_package"))
    (:file "Magnetometer" :depends-on ("_package_Magnetometer"))
    (:file "_package_Magnetometer" :depends-on ("_package"))
  ))