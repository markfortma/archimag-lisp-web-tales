(defpackage #:blogdemo-config (:export #:*base-directory*))

(defparameter blogdemo-config:*base-directory*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(asdf:defsystem #:blogdemo
    :serial t
    :description "blogdemo from Ch 4"
    :author "matt"
    :license "GPLv2"
    :depends-on (:RESTAS :SEXML)
    :components ((:file "defmodule")
		 (:file "util")
		 (:file "template")
		 (:file "routes")))
