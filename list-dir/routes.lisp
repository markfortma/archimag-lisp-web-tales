;;;; routes.lisp

(in-package #:list-dir)

;;;; GET / (yields /static)
(restas:mount-module -static- (#:restas.directory-publisher)
		     (:url "")
		     (:render-method #'restas.directory-publisher.view:autoindex)
		     (restas.directory-publisher:*directory* *static-directory*)
		     (restas.directory-publisher:*autoindex* t))
