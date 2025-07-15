;;;; defmodule.lisp
(restas:define-module #:list-dir
    (:use #:cl #:restas #:restas.directory-publisher)
  (:export #:start-it
	   #:stop-it))

(in-package #:list-dir)

(defparameter *template-directory*
  (merge-pathnames #P"templates/" list-dir-config:*base-directory*))

(defparameter *static-directory*
  (merge-pathnames #P"static/" list-dir-config:*base-directory*))

(sexml:with-compiletime-active-layers
    (sexml:standard-sexml sexml:xml-doctype)
  (sexml:support-dtd
   (merge-pathnames "html5.dtd" (asdf:system-source-directory "sexml"))
   :<))
