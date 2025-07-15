;;;; authdemo.lisp

(in-package #:authdemo)

;;;; GET /login
(restas:define-route login ("login")
  (:render-method 'html-frame)
  (list :title "Log in"
	:body (login-form)))

;;;; POST /login
(restas:define-route login/post ("login" :method :post)
  (let ((user (funcall *authenticate-user-function*
		       (hunchentoot:post-parameter "username")
		       (hunchentoot:post-parameter "password"))))
    (if user
	(log-in user)
	(restas:redirect 'login))))


;;;; GET /register
(restas:define-route register ("register")
  (:render-method 'html-frame)
  (list :title "register"
	:body (register-form)))

;;;; POST /register
(restas:define-route register/post ("register" :method :post)
  (let ((user (funcall *register-user-function*
		       (hunchentoot:post-parameter "username")
		       (hunchentoot:post-parameter "password"))))
    (if user
	(log-in user)
	(restas:redirect 'register))))

;;;; GET /logout
(restas:define-route logout ("logout")
  (log-out))
