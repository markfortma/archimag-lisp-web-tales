;;;; util.lisp

(in-package #:blogdemo)

(defun validate-post-id (id)
  (let ((id (parse-integer id :junk-allowed t)))
    (if (< id (length *posts*))
	id
	nil)))

(defun get-authors ()
  (loop for post in *posts*
	collect (getf post :author-id)))

(defun validate-author-id (author-id)
  (find author-id (get-authors) :test #'string=))

(defun logged-on-p ()
  (hunchentoot:session-value :username))

(defun slug (string)
  (substitute #\- #\Space
	      (string-downcase
	       (string-trim '(#\Space #\Tab #\Newline)
			    string))))

(defun start-it (&optional (port 8080))
  (format t "starting WebApp on port ~a~%" port)
  (restas:start '#:blogdemo
		:port port))

(defun stop-it ()
  (format t "stopping WebApp")
  (restas:stop-all))
