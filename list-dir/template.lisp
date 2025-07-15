;;;; template.lisp

(in-package #:list-dir)

(<:augment-with-doctype "html" "" :auto-emit-p t)

(defun html-frame (context)
  (<:html
   (<:head (<:title (getf context :title))
	   ;;; Stylesheet
	   (<:link :rel "stylesheet" :type "text/css" :href "/static/css/style.css"))
   (<:body
    (<:div
     (<:h1
      (getf context :title))
     (<:hr)
     (getf context :body)))))
