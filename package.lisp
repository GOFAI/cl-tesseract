;;;; package.lisp

(defpackage #:cl-tesseract
  (:use #:cl #:cffi)
  (:nicknames #:tesseract #:tess)
  (:export
   #:*tessdata-directory*
   #:tesseract-version
   #:with-base-api
   #:init-tess-api
   #:process-pages
   #:image-to-text
   #:image-to-hocr))

