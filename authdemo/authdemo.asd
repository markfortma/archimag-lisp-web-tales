(defpackage #:authdemo-config (:export #:*base-directory*))

(defparameter authdemo-config:*base-directory*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(asdf:defsystem #:authdemo
    :serial t
    :description "authdemo module from Ch 9"
    :author "matt"
    :license "GPLv2"
    :depends-on (:RESTAS :SEXML)
    :components ((:file "defmodule")
		 (:file "util")
		 (:file "template")
		 (:file "authdemo")
		 (:file "routes")))
