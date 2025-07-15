;;;; util.lisp

(in-package #:list-dir)

(defun start-it (&optional (port 8080))
  (format t "starting WebApp on port ~a~%" port)
  (restas:start '#:list-dir
		:port port))

(defun stop-it ()
  (format t "stopping WebApp")
  (restas:stop-all))
