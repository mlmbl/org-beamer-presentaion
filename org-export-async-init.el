;; パッケージシステムを使う
(require 'package)
(setq package-user-dir (expand-file-name "~/.emacs.d/elpa"))
(package-initialize)

;; Set load paths to the system's emacs initializing directory.
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Load required packages
(require 'citeproc)
;; (require 'ox-latex)
(require 'ox-beamer)
(require 'oc-basic)
(require 'oc-csl)
(require 'oc-biblatex)
(require 'oc-natbib)

;; basic export settings
(setq org-export-with-smart-quotes t)
(setq org-export-with-broken-links 'mark) 
(setq org-export-with-toc nil) 
(setq org-export-allow-bind-keywords t)
(setq org-export-headline-levels 4)

(setq org-latex-text-markup-alist '((bold . "\\textbf{%s}")
                                    (code . protectedtexttt)
                                    (italic . "\\textit{%s}")
                                    (strike-through . "\\sout{%s}")
                                    (underline . "\\uline{%s}")
                                    (verbatim . "\\verb|%s|")))


;; org-babel settings
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)		      
   (latex . t)
   (org . t)
   (python . t)
   (R . t)
   (ruby . t) 
   (sql . t)
   (sqlite . t)))

;; citation setting
(setq org-cite-global-bibliography
      '("~/Dropbox/1-bibliography/references.bib")) ;; ここを適宜書きかえる
(setq org-cite-export-processors
      '((latex biblatex)
	   (t csl)))


;; latex compiler and pdf process setting
(setq org-latex-compiler "lualatex")
(setq org-latex-pdf-process '("latexmk -f %f"))

;; Title export setting
(setq org-latex-subtitle-separate t)
;; (setq org-latex-subtitle-format ": %s")
(setq org-latex-title-command "\\maketitle")


;; default packages
(setq org-latex-default-packages-alist '(("AUTO" "inputenc" t ("pdflatex"))
                                         ("T1" "fontenc" t ("pdflatex"))
                                         ("" "graphicx" t)
					 ("" "tabularx" t)
                                         ("" "wrapfig2" nil)
                                         ("" "rotating" nil)
                                         ("normalem" "ulem" t)
                                         ("" "amsmath" t)
                                         ("" "amssymb" t)
                                         ("" "capt-of" nil)
                                         ("" "hyperref" nil)
					 ;; ("" "enumitem" nil)
  				         ("" "listings" nil)
  				         ("" "booktabs" nil)
  				         ("" "caption" t)
  				         ("dvipsnames" "xcolor" t)
  				         ("" "jvlisting" t)))

;; code blocks 
(setq org-latex-listings t)
(setq org-latex-listings-options
      '(("basicstyle" "\\ttfamily\\small")
        ("keywordstyle" "\\color{blue}\\bfseries")
        ("breaklines" "true")
        ("commentstyle" "\\color{gray}\\textit")
        ("frame" "shadowbox")
        ("framesep" "0.5em")
        ("xleftmargin" "3em")
        ("xrightmargin" "3em")
        ("numbers" "left")
        ("numberstyle" "\\tiny\\color{gray}")
        ("stepnumber" "1")))


;; hyperref settings
(setq org-latex-hyperref-template "
\\hypersetup{setpagesize = false,
             pdfauthor={%a},
             pdftitle={%t},
             pdfkeywords={%k},
             pdfsubject={%d},
             pdfcreator={%c}, 
             pdflang={%L},
             colorlinks  = true,
             linkcolor   = OliveGreen,
             urlcolor    = Blue,
             filecolor   = Red,
             citecolor   = Maroon,
             bookmarks   = true}
")

;; class setting
(setq org-latex-classes nil)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass{beamer}
  \\usepackage[T1]{fontenc}
  \\usepackage{luatexja}
  \\usepackage{luatexja-fontspec}
  \\setmainjfont[UprightFont = * Light,BoldFont = * Bold,Scale=0.95]{NotoSansCJKjp}
  \\setsansjfont{HiraMaruProN-W4}
  \\setmonojfont{PlemolJP35Console-Regular}
  [DEFAULT-PACKAGES]
  [PACKAGES]
  [EXTRA]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(setq org-latex-dafault-class "beamer")
