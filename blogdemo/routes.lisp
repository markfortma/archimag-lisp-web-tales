;;;; blogdemo.lisp

(in-package #:blogdemo)

;;;; GET /
(restas:define-route home ("")
  (:render-method 'html-frame)
  (list :title "Blogdemo"
	:body (mapcar #'render-post *posts*)))

;;;; GET /post/<id>
(restas:define-route post ("post/:id")
  (:render-method 'html-frame)
  (:sift-variables (id #'validate-post-id))
  (let ((post (elt *posts* id)))
    (list :title (getf post :title)
	  :body  (render-post post))))

;;;; GET /author/<id>
(restas:define-route author ("author/:id")
  (:render-method 'html-frame)
  (:sift-variables (id #'validate-author-id))
  (let ((posts (loop for post in *posts*
		     if (string= id (getf post :author-id))
		     collect post)))
     (list :title (format nil "Posts by ~a" (getf (first posts) :author))
	   :body  (mapcar #'render-post posts))))

;;;; GET /add
(restas:define-route add ("add")
  (:render-method 'html-frame)
  (:requirement #'logged-on-p)
  (list :title "Add a blog post"
	:body  (add-post-form)))

;;;; POST /add
(restas:define-route add/post ("add" :method :post)
  (let ((author (hunchentoot:post-parameter "author"))
	(title (hunchentoot:post-parameter "title"))
	(content (hunchentoot:post-parameter "content")))
    (push (list :author author
		:author-id (slug author)
		:title title
		:content content)
	  *posts*)
    (redirect 'home)))

;;;; GET /login
(restas:define-route login ("login")
  (:render-method 'html-frame)
  (list :title "Login"
	:body (login-form)))

;;;; POST /login
(restas:define-route login/post ("login" :method :post)
  (if (and (string= "user" (hunchentoot:post-parameter "username"))
	   (string= "pass" (hunchentoot:post-parameter "password")))
      (progn
	(hunchentoot:start-session)
	(setf (hunchentoot:session-value :username) "user")
	(restas:redirect 'home))
      (restas:redirect 'login)))

;;;; GET /logout
(restas:define-route logout ("logout")
  (setf (hunchentoot:session-value :username) nil)
  (restas:redirect 'home))
