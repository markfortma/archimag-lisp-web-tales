(defpackage #:closure-hello-config (:export #:*base-directory*))

(defparameter closure-hello-config:*base-directory*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(asdf:defsystem #:closure-hello
    :serial t
    :description "closure-hello from Ch 3"
    :author "matt"
    :license "GPLv2"
    :defsystem-depends-on (#:closure-template)
    :depends-on (:RESTAS :CLOSURE-TEMPLATE)
    :components ((:closure-template "templates/main")
		 (:file "defmodule")
		 (:file "routes")))
