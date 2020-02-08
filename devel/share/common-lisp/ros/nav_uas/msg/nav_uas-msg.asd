
(cl:in-package :asdf)

(defsystem "nav_uas-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Nav_msg" :depends-on ("_package_Nav_msg"))
    (:file "_package_Nav_msg" :depends-on ("_package"))
  ))