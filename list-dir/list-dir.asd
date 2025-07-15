(defpackage #:list-dir-config (:export #:*base-directory*))

(defparameter list-dir-config:*base-directory*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(asdf:defsystem #:list-dir
    :serial t
    :description "Using restas-directory-publisher to list a directory, inspired by Ch 8"
    :author "matt"
    :license "GPLv2"
    :depends-on (:RESTAS :SEXML :RESTAS-DIRECTORY-PUBLISHER)
    :components ((:file "defmodule")
		 (:file "util")
		 (:file "template")
		 (:file "routes")))
