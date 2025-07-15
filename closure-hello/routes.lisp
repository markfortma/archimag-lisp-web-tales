;;;; routes.lisp

(in-package #:closure-hello)

(defparameter *todos* (list "Get milk" "Pick up paycheck" "Cash paycheck"))

;;; GET /
(restas:define-route main ("")
  (:render-method #'closure-hello.view:main)
  (list :title "Hello world!"
	:main t
	:body "<h1>It works!</h1>"))

;;; GET /todos
(restas:define-route todos ("todos")
  (:render-method #'closure-hello.view:main)
  (list :title "Tasks for today"
	:todos t
	:body (closure-hello.view:todos (list :todos *todos*))))

;;; GET /lost
(restas:define-route lost ("lost")
  (:render-method #'closure-hello.view:main)
  (list :title "Are we lost?"))
