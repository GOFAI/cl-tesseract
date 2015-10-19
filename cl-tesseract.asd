;;;; cl-tesseract.asd

(asdf:defsystem #:cl-tesseract
  :description "CFFI bindings to the Tesseract OCR library."
  :author "Edward Geist"
  :license "MIT"
  :depends-on (#:cffi)
  :serial t
  :components ((:file "package")
	       (:file "library")
	       (:file "capi")
               (:file "cl-tesseract")))

