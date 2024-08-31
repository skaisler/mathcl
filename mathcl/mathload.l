;;; -*- Mode: LISP; Syntax: Common-lisp; Package: USER -*-
;;;
;;; Load Math and Statistics Functions:
;;;
;;; Some of the files below have been slightly reformated for readability
;;; by Steve Kaisler, July 2024
;;;

(in-package :xcl-user)


	(print "Loading mathcl")
	;;;(load "CONSTS.l")
	(load "Basic.l")
	(load "Bessel.l")	; loads HORNER.l
	(load "Binomial.l")	; loads Beta.l, Plot.l
	(load "ERF.L")		; loads Horner.l
	(load "COMBIN.L")
	(load "fit.l")		; loads Regres.l
	(load "extcfn.L")	; uses basic.l
	(load "matrix.l")
	(load "marq.l")
	(load "mod.l")
	(load "fib.l")
	(load "fmfp.l")
	(load "gamma.l")l
	(load "integr.l")
	(load "poisson.l")
	(load "regres.l")
	(load "runge.l")
	(load "statis.l")
	(terpri)
	(print "Loaded mathcl")

;;;