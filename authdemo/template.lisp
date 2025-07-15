;;;; template.lisp

(in-package #:authdemo)

(defun login-form ()
  (<:form :action (genurl 'login/post) :method "post"
	  "Username:" (<:br)
	  (<:input :type "text" :name "username")(<:br)
	  "Password:" (<:br)
	  (<:input :type "password" :name "password") (<:br)
	  (<:input :type "submit" :value "Login")))

(defun register-form ()
  (<:form :action (genurl 'register/post) :method "post"
	  "Username:" (<:br)
	  (<:input :type "text" :name "username")(<:br)
	  "Password:" (<:br)
	  (<:input :type "password" :name "password") (<:br)
	  (<:input :type "submit" :value "Register")))
