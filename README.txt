CL-TESSERACT is a set of CFFI bindings for the Tesseract OCR library v. 3.04: 
https://github.com/tesseract-ocr/tesseract

On OS X, Tesseract can be conveniently installed using Homebrew:
brew install tesseract

As Tesseract OCR’s capi changed in the update to v. 3.04, earlier versions such as 3.02
will not work with these bindings.

CL-TESSERACT also provides convenient lisp functions to retrieve text from images, 
IMAGE-TO-TEXT and IMAGE-TO-HOCR.

IMAGE-TO-TEXT accepts a lisp pathname and an optional language parameter and returns a 
unicode string:

* (image-to-text #P"~/eurotext.tif")
"The (quick) [brown] {fox} jumps!
Over the $43,456.78 <lazy> #90 dog
& duck/goose, as 12.5% of E-mail
from aspammer@website.com is spam.
Der ,,schnelle” braune Fuchs springt
ﬁber den faulen Hund. Le renard brun
«rapide» saute par-dessus le chien
paresseux. La volpe marrone rapida
salta sopra i] cane pigro. El zorro
marrén répido salta sobre el perro
perezoso. A raposa marrom répida
salta sobre 0 C50 preguieoso.

"

* (image-to-text #P"~/eurotext.tif" :lang "rus")
"ТЬе (чиісК) [Ьгошп] {Гох} ]итрз!
Очег [пе $43‚456.78 <1а2у> #90 603
& ‹1исК/3005е, аз 12.5% ог Е-таіі
Ггот азраттег@шеЬ5і[е.сош із зрат.
Бег ‚,5с11пе11е” Ьгаипе Риспз зргіпві
ііЬег ‹!еп Тапіеп Нипа. Ье гепага Ьгип
«гарісіе» заше раг-сіеззиз 1е сЬіеп
рагеззеих. Ьа уоіре тапопе гаріаа
зама зорга і] сапе рівго. Е1 гогго
таггбп гёріао зама воЬге е1 репо
регегозо. А гароза шапот гйріаа
зака воЬге о еде ргевиісозо.

"

Available languages are dependent on the Tesseract OCR .traineddata files located in the directory denoted by *TESSDATA-DIRECTORY*. CL-TESSERACT attempts to set this variable to 
a reasonable default for your platform.

IMAGE-TO-HOCR accepts a lisp pathname, the optional language parameter, and a optional 
page number (default 0) and return HOCR XML describing not just the recognized text, but 
its location in the page:

* (image-to-hocr #P"~/python-tesseract/eurotext.jpg”)
"  <div class='ocr_page' id='page_2' title='image \"/Users/Walrus/python-tesseract/eurotext.jpg\"; bbox 0 0 1024 800; ppageno 1'>
   <div class='ocr_carea' id='block_2_1' title=\"bbox 98 66 918 661\">
. . .
word_2_65' title='bbox 391 621 456 651; x_wconf 72' lang='eng' dir='ltr'>C50</span> <span class='ocrx_word' id='word_2_66' title='bbox 481 621 710 661; x_wconf 74' lang='eng' dir='ltr'>preguieoso.</span> 
     </span>
    </p>
   </div>
  </div>
"

This can be parsed using Common Lisp libraries such as Closure-XML and plump.

Tested on CCL and SBCL.

License: 

MIT

Author:
Edward Geist (egeist@stanford.edu)
