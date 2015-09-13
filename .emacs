(setq load-path (cons (expand-file-name "c:/emacs/emacs-24.3/lisp") 
                      load-path))

(defun lars-setup-color-faces ()
  (custom-set-faces
   '(font-lock-comment-face             ((t (:foreground "darkblue" :bold nil))) t)
   '(font-lock-string-face              ((t (:foreground "darkgreen"))) t)
   '(font-lock-keyword-face             ((t (:foreground "red" :bold nil))) t)
   '(font-lock-builtin-face             ((t (:foreground "black" :bold nil))) t)
   '(font-lock-function-name-face       ((t (:foreground "black" :bold t))) t)
   '(font-lock-variable-name-face       ((t (:foreground "black"))) t)
   '(font-lock-type-face                ((t (:foreground "red" :bold nil))) t)
   '(font-lock-constant-face            ((t (:foreground "black" :bold t))) t)
   '(font-lock-warning-face             ((t (:foreground "black" :bold t))) t)
   '(font-lock-reference-face           ((t (:foreground "green" :bold t))) t)
   '(font-lock-doc-string-face          ((t (:foreground "blue"))) t)
   
   '(highlight                          ((t (:foreground "cyan" :background "darkblue"))) t)
   '(zmacs-region                       ((t (:foreground "white" :background "darkblue"))) t)
   '(isearch                            ((t (:foreground "white" :background "darkblue"))) t)
   
   '(irchat-my-nick-highlight           ((t (:foreground "yellow" :background "blue" :bold t))) t)
   
   '(dired-face-permissions             ((t (:foreground "white" :background "blue"))) t)
   
   '(gnus-cite-face-1                   ((t (:foreground "green"))) t)
   '(gnus-cite-face-2                   ((t (:foreground "cyan"))) t)
   '(gnus-cite-face-3                   ((t (:foreground "pink"))) t)
   '(gnus-cite-face-4                   ((t (:foreground "red"))) t)))




; 12 means width in pixels, 7 means height in pixels: SEE
; EmacsFontSpec.txt for details

(set-default-font "-outline-Lucida Console-normal-r-normal-normal-10-*-96-96-c-6-iso8859-1")
;;(set-default-font "-outline-Consolas-normal-r-normal-normal-10-*-96-96-c-10-iso8859-1")

(lars-setup-color-faces)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
;(hscroll-mode)


; Make i-search string local to each buffer
;(make-variable-buffer-local 'search-ring)

;(winner-mode)

;;(add-hook 'c-mode-hook 'turn-on-font-lock)
;;(add-hook 'c++-mode-hook 'turn-on-font-lock)

(auto-fill-mode)
(transient-mark-mode t)
(toggle-save-place-globally)
;(isearch-toggle-case-fold)

(defun lb-scroll-window-point-to-top ()
  "Scroll point to top of window "
  (interactive)
  (beginning-of-line)
  (set-window-start (selected-window) (point)))

; (defun lb-scroll-window-point-to-bottom ()
;   "Scroll point to bottom of window "
;   (interactive)
;   (beginning-of-line)
;   (set-window-start (selected-window) (+ (point) (window-height))))

;  (let ((nl (count-lines (point-min) (point))))
;    (scroll-up (- nl (window-start)))))

(defun lb-previous-window ()
  "Larsasas version of goto previous window."
  (interactive)
  (beginning-of-line)
  (other-window -1))

(defun lb-scroll-one-line-down ()
  "Larsasas version of scroll-down."
  (interactive)
  (scroll-up 1))

(defun lb-scroll-one-line-up ()
  "Larsasas version of scroll-up."
  (interactive)
  (scroll-down 1))


(load-file "c:/emacs/emacs-24.3/site-lisp/visual-basic/visual-basic-mode.el")
(setq visual-basic-mode-indent 3)

(load-file "c:/emacs/emacs-24.3/site-lisp/nxml-mode-20041004/rng-auto.el")
(setq nxml-slash-auto-complete-flag t)
(setq nxml-sexp-element-flag t)

; http://www.emacswiki.org/emacs/FillAdapt
; According to comment in el-file this package cannot be auto-loaded. Should use require instead.
; This didn't work good. Slow general response and ret redefined.
;(require 'filladapt)
;(load-file "c:/emacs/emacs-23.2/site-lisp/filladapt/filladapt.el")


;(load-file "p:/emacs/emacs-21.2/lisp/view.el")

(global-set-key "\C-xc" 'compile)
;(global-set-key "\C-xr" 'Electric-command-history-redo-expression)
(global-set-key "\C-xC-f" 'find-all-files)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
;(global-set-key "\C-u" 'universal-argument)
(global-set-key (kbd "C--") 'backward-kill-paragraph)

(global-set-key "\C-xp"    'lb-previous-window)
(global-set-key [C-up] 'lb-scroll-one-line-up)
(global-set-key [C-down] 'lb-scroll-one-line-down)
(global-set-key [S-up] 'lb-scroll-window-point-to-top)

(global-set-key [C-next] 'scroll-other-window)
(global-set-key [C-prior] 'scroll-other-window-down)
(global-set-key [C-left] 'backward-word)
(global-set-key [C-right] 'forward-word)

(global-set-key "\M-g" 'goto-line)
(global-set-key [f9] 'grep)

(grep-compute-defaults)
(grep-apply-setting 'grep-find-command "find . ! -name \"*~\" ! -name \"#*#\" \( -name \"*.cpp\" -o -name \"*.h\" \) -type f -print0 | xargs -0 -e grep -nH -e ") 
(global-set-key [f11] 'find-grep)


;(global-set-key [f12] 'next-error)
;(global-set-key [f11] 'previous-error)
(global-set-key [C-f12] 'next-error)
(global-set-key [C-f11] 'previous-error)


(global-set-key "\C-c\C-b" 'bookmark-jump)
(global-set-key "\C-c\C-s" 'bookmark-set)
(global-set-key "\C-xx"    'copy-to-register)
(global-set-key "\C-xg"    'insert-register)
(global-set-key "\C-xw"    'point-to-register)
(global-set-key "\C-xr"    'jump-to-register)
(global-set-key "\C-s"     'isearch-forward-regexp)
(global-set-key "\C-cb"    'ediff-buffers)
(global-set-key "\C-c\C-v" 'uncomment-region)
(global-set-key "\C-d"     'c-hungry-delete-forward)
(global-set-key "\M-p"     'c-fill-paragraph)
(global-set-key "\C-x9"    'delete-other-windows-vertically)
(global-set-key "\C-xt"    'toggle-truncate-lines)
(global-set-key "\C-cw"     'whitespace-mode)
(global-set-key "\C-cn"     'whitespace-cleanup)
(global-set-key "\C-ci"     'indent-region)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(global-font-lock-mode t nil (font-lock))
 '(safe-local-variable-values (quote ((folded-file . t))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "outline" :family "Consolas"))))
 '(dired-face-permissions ((t (:foreground "white" :background "blue"))) t)
 '(font-lock-builtin-face ((t (:foreground "black" :bold nil))))
 '(font-lock-comment-face ((t (:foreground "darkblue" :bold nil))))
 '(font-lock-constant-face ((t (:foreground "black" :bold t))))
 '(font-lock-doc-string-face ((t (:foreground "blue"))) t)
 '(font-lock-function-name-face ((t (:foreground "black" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "red" :bold nil))))
 '(font-lock-reference-face ((t (:foreground "green" :bold t))) t)
 '(font-lock-string-face ((t (:foreground "darkgreen"))))
 '(font-lock-type-face ((t (:foreground "red" :bold nil))))
 '(font-lock-variable-name-face ((t (:foreground "black"))))
 '(font-lock-warning-face ((t (:foreground "black" :bold t))))
 '(gnus-cite-face-1 ((t (:foreground "green"))) t)
 '(gnus-cite-face-2 ((t (:foreground "cyan"))) t)
 '(gnus-cite-face-3 ((t (:foreground "pink"))) t)
 '(gnus-cite-face-4 ((t (:foreground "red"))) t)
 '(highlight ((t (:foreground "cyan" :background "darkblue"))))
 '(irchat-my-nick-highlight ((t (:foreground "yellow" :background "blue" :bold t))) t)
 '(isearch ((t (:foreground "white" :background "darkblue"))))
 '(zmacs-region ((t (:foreground "white" :background "darkblue"))) t))

;(load "completion")
;(initialize-completions)
;(global-set-key "\C-xy" 'dabbrev-expand)

;; (setq load-path (cons "P:/XRefactory/xref/emacs" load-path))
;; (setq exec-path (cons "P:/XRefactory/xref" exec-path))
;; (load "xrefactory")

;; (setq load-path (cons "p:/emacs/emacs-21.2/tmp" load-path))
;; (setq exec-path (cons "p:/emacs/emacs-21.2/tmp" exec-path))
;;(load "csharp")

;(find-file "x:/ShareDDisk/TimeTrackBase/400/x/ttsys.cpp")


;; Set indentation step to 3 spaces per level
;BRAT removed 4 line
(setq c-basic-offset 3)
(add-hook 'java-mode-hook
	  '(lambda () (setq c-basic-offset 3)))
(setq tcl-indent-level 3)
(setq-default indent-tabs-mode nil)

;; (add-hook 'tcl-mode-hook
;; 	  '(lambda () (setq c-basic-offset 3)))


;To force Emacs to insert spaces instead of tabs when you press the TAB key:
;M-x set-variable<RET> indent-tabs-mode<RET> nil

; BRAT removed 1 line and added 3 including comment
;(setq-default indent-tabs-mode nil)
; Always use tab only when indentation (no spaces)
;(setq default-tab-width 3)
;(setq c-basic-offset 3)
;(setq-default indent-tabs-mode t)
;(setq-default indent-tabs-mode nil)


;; LARS: Code from zbrad.emacs:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; extension to mode mapping
;
(setq auto-mode-alist
      (append '(
		("\\.s?html?\\'" . html-helper-mode)
		("\\.asp$" . html-helper-mode)
		("\\.as[phm]x$" . html-helper-mode)
		("\\.html$" . html-helper-mode)
		("\\.htm$" . html-helper-mode)
                ("\\.md$" . emacs-lisp-mode)
		("\\.txt$" . text-mode)
		("\\.cs$" . csharp-mode)
		("\\.java$" . java-mode)
		("\\.tcl$" . tcl-mode)
		("\\.xml$" . nxml-mode)
		("\\.vb$" . visual-basic-mode)
		("\\.lua$" . lua-mode)
		) auto-mode-alist ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;              C# Mode support
;;;
(load "csharp-mode-0.7.0.el")
;;(autoload 'csharp-mode "cc-mode")

(c-add-style "myC#Style"
  '("C#"
;BRAT removed 1 line
;  (c-basic-offset . 2)
  (c-comment-only-line-offset . (0 . 0))
  (c-offsets-alist . (
    (c                     . c-lineup-C-comments)
    (inclass		   . 0)
    (namespace-open	   . +)
    (namespace-close	   . +)
    (innamespace	   . 0)
    (class-open		   . +)
    (class-close	   . +)
    (inclass		   . 0)
    (defun-open		   . +)
    (defun-block-intro     . 0)
    (inline-open	   . +)
    (inline-close	   . 0)
    (statement-block-intro . 0)
    (statement-cont	   . +)
    (brace-list-intro      . +)
    (topmost-intro-cont    . 0)
    (block-open		   . +)
    (block-close	   . 0)
    (arglist-intro	   . +)
;    (arglist-cont	   . 0)
    (arglist-close	   . 0)
    ))
  ))

;; (defun my-csharp-mode-hook ()
;;   (cond (window-system
;; 	 (turn-on-font-lock)
;; 	 (c-set-style "myC#Style")
;; 	 )))
;; (add-hook 'csharp-mode-hook 'my-csharp-mode-hook)


;; (setq compilation-error-regexp-alist
;; 	(append '(
;; ;C# Compiler
;; ;t.cs(6,18): error SC1006: Name of constructor must match name of class
;; ;
;; ("\\(\\([a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)[,]\\([0-9]+\\)): \\(error\\|warning\\) CS[0-9]+:" 1 3 4)
;;         )
;; 	compilation-error-regexp-alist))


;; ;;; Set up PSGML
;; ; Add PSGML to load-path so Emacs can find it.
;; ; Note the forward slashes in the path... this is platform-independent so I 
;; ; would suggest using them over back slashes. If you use back slashes, they 
;; ; MUST BE doubled, as Emacs treats backslash as an escape character. 
;; (setq load-path (append (list nil "X:/emacs/emacs-21.2/site-lisp/psgml-1.2.5") load-path))

;; ; Use PSGML for sgml and xml major modes.
;; (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;; (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)



;(find-file "h:/Projects/AutomateTests/javaws/SS3AutoTestServer/SS3Manager.java")
;(find-file "h:/Projects/AutomateTests/csharp/VS2003/SS3BratR2Plugin/SS3Provider.cs")


; This reloads files automtically if changed outside of emacs:
; auto revert (update buffer when file changes on disk) 
(autoload 'auto-revert-mode "autorevert" nil t) 
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil) 
(autoload 'global-auto-revert-mode "autorevert" nil t) 
(global-auto-revert-mode 1) 
(setq auto-revert-interval 2) 


; Some additions from http://www.io.com/~jimm/emacs_tips.html

; Expanding
(setq dabbrev-case-replace nil)  ; Ensure that case is preserved when
                                 ; using dabbrev
; http://psung.blogspot.com/2008/05/from-dabbrev-expand-to-hippie-expand.html
(global-set-key "\M-7" 'hippie-expand) ; redefine dabbrev-expand 
(global-set-key "\M-/" 'dabbrev-expand)


(define-key global-map [f1] 'bookmark-jump)
(define-key global-map [f2] 'bookmark-set)
(define-key global-map [f3] 'bookmark-bmenu-list)
(setq bookmark-save-flag 1)		; How many modified bookmarks between saves

; How to see diff between buffer and file for instance when saving a
; file and you don't know what the changes are). Must have turned
; highlight-changes-mode on at start for it to track the changes. 
; Then issue global-highlight-changes-mode to toggle it.
;; higlight changes in documents
(setq global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil); initially hide


; Abbrev-mode
; From: http://www.emacswiki.org/emacs/AbbrevMode#toc6
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1))) ; Use abbrev-mode in text-mode and derived modes only:
; (abbrev-mode 1)
(setq save-abbrevs t)       ;; save abbrevs when files are saved
                            ;; you will be asked before the abbreviations are saved
(quietly-read-abbrev-file)  ;; reads the abbreviations file on startup



;; (autoload 'expand-abbrev-hook "expand")
;; (define-abbrev-table 'java-mode-abbrev-table '(
;;     ("sout" ["System.out.println(\"\")" 2 () nil] expand-abbrev-hook 0)))


; Skeletons
(define-skeleton skeleton-switch
  "Inserts a switch statement"
  "Switch on: "
  > "switch (" str ")" \n "{" \n "case" _ ":" > \n "break;" > \n  "default:" > \n "}" > \n)  ; > means indent

(define-skeleton java-testcase-skeleton
  "Inserts a TestCase class skeleton"
  > "package " (path-to-package (buffer-file-name)) ";" \n§
  "import junit.framework.TestCase;" \n
  \n
  > "public class "
  (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))
  " extends TestCase {" \n
  \n
  > "protected void setUp() {" \n
  > _ \n
  "}" > \n
  \n
  > "protected void tearDown() {" \n
  "}" > \n
  \n
  > "public void testDummy() {" \n
  > "assertTrue(true);" \n
  "}" > \n
  "}" \n
  )


; yasnippet code templates: http://code.google.com/p/yasnippet/
; See video here: http://www.youtube.com/watch?v=76Ygeg9miao
; It is possible to execute while the snippet is executing for
; instance to select from values from a list (see example at the end
; of the video).
(add-to-list 'load-path "C:/emacs/emacs-24.3/site-lisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory "C:/emacs/emacs-24.3/site-lisp/yasnippet-0.6.1c/snippets")
(yas/load-directory yas/root-directory)
(yas/global-mode t)  ; makes no difference
; How to enable yasnippet:
; M-x yas/minor-mode
; M-x yas/global-mode

; This binds newline-and-indent to RET in all modes derived from c-mode:
; C-j always binds to newline-and-indent
(add-hook 'c-mode-common-hook '(lambda ()
                                 (local-set-key (kbd "RET") 'newline-and-indent)))


; Redefintion of c-k according to http://www.emacswiki.org/emacs/AutoIndentation
(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))
(global-set-key "\C-k" 'kill-and-join-forward)

; New commands to learn:
; just-one-space   M-space ; removes all whitespace chars except one space
; (global-set-key [return] 'newline-and-indent) ; do this mode-dependent because it is used in the mini-buffer also...


; LUA mode
(setq load-path (cons (expand-file-name "c:/emacs/emacs-24.3/site-lisp/lua-mode") 
                      load-path))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
; (setq lua-default-application "c:/luabin/lua5.1.exe")

;; (setq lua-mode-map (make-sparse-keymap))
;; (define-key lua-mode-map "\C-c\C-m" 'lua-goto-matching-block)

;(fringe-mode 'none)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;-------- iswitch - wildcards when switching to a buffer ---------
;(iswitchb-mode 1)
;;(setq iswitchb-buffer-ignore '("^ " "*Buffer"))
;(setq iswitchb-buffer-ignore '("^ " "\\*"))

; Redefine iswitch keys
;; (defun iswitchb-local-keys ()
;;       (mapc (lambda (K) 
;; 	      (let* ((key (car K)) (fun (cdr K)))
;;     	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
;; 	    '(("<right>" . iswitchb-next-match)
;; 	      ("<left>"  . iswitchb-prev-match)
;; 	      ("<up>"    . ignore             )
;; 	      ("<down>"  . ignore             ))))
;; (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

(global-set-key [C-tab] 'other-window)

(require 'desktop)
(desktop-save-mode 1)
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))
;;(desktop-read)


;; org-mode
(setq org-todo-keywords
      '((sequence "NOT STARTED" "STARTED" "|" "DONE")))

(winner-mode 't)
