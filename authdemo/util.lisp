;;;; util.lisp

(in-package #:authdemo)

(defun logged-on-p ()
  (hunchentoot:session-value :username))

(defun log-in (username &optional (redirect-route *redirect-route*))
  (hunchentoot:start-session)
  (setf (hunchentoot:session-value :username) username)
  (restas:redirect redirect-route))

(defun log-out (&optional (redirect-route *redirect-route*))
  (setf (hunchentoot:session-value :username) nil)
  (restas:redirect redirect-route))
