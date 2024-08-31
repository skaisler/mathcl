;;;
;;; Module Name to Pathname Mappings
;;;
;  (c) Copyright Gerald Roylance 1989
;      All Rights Reserved.
;
;  No part of this material may be used, photocopied,
;  reproduced or committed to magnetic, electronic or any other
;  form of media without prior written consent.
;  Revised and Annotated by Steve Kaisler for Medley Interlisp, 2024

; Bugs and Fixes
;   compile only those files that need it
;   make distribution tapes (maybe binary only)
;     include/exclude some systems
;   separate compilation without loading
;   bug with declares
;   release/version/edit
;   patches
;   might have an argument that imports the packages external symbols.
;

(in-package "USER")

(provide "MODULES")

(export '(	module-require
			module-provide
			module-pathname-get
			module-pathname-put)
)

;;
;; Database Manipulation Routines
;
; Keep the correspondence between names and pathnames
;
(defvar module-database
		(make-hash-table :test #'equal :size 200)
)

(defun module-pathname-get (name)
 	(let	((pathnames (gethash name module-database)))
			(if (null pathnames)
				;
				(warn "Module ~A has no pathname translations" name)
				(return)
			)
			pathnames
	)
)

(defun module-pathname-put (name pathname)
	;
	(if (null pathname)
		;
		(remhash name module-database)
		(setf (gethash name module-database) pathname)
	)
)

(defun module-require (name)
	;
	(require name (module-pathname-get name))
)

(defun module-provide (name)
	;
  	(provide name)
)

(defmacro module-namestring
	(module-name host namestring)
	;
	`(module-pathname-put 
		,module-name
			(parse-namestring ,namestring ,host)
	)
)

(module-require (name)
	;
	(require name (module-pathname-get name))
)

(defun module-provide (name)
	;
	(provide name)
)

(defmacro module-namestring (module-name host namestring)
	`(module-pathname-put ,module-name (parse-namestring ,namestring ,host))
)
