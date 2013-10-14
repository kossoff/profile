;;;;;;;;; Little Help ;;;;;;;;;
; КОПИРОВАТЬ                         M-w
; ВЫРЕЗАТЬ                           C-w
; ВСТАВИТЬ                           C-y
; ВЫДЕЛИТЬ ВСЁ                       C-x h
; ПЕРЕЙТИ НА НАЧАЛО СТРОКИ           C-a
; ПЕРЕЙТИ НА КОНЕЦ СТРОКИ            C-e
; ПЕРЕЙТИ В НАЧАЛО ФАЙЛА             M-<
; ПЕРЕЙТИ В КОНЕЦ ФАЙЛА              M->
; ПОИСК ВПЕРЁД                       C-s
; ПОИСК НАЗАД                        C-r
; ОТКРЫТЬ ФАЙЛ                       C-x C-f
; СОХРАНИТЬ ФАЙЛ                     C-x C-s
; СОХРАНИТЬ КАК                      C-x C-w
; ЗАКРЫТЬ ФАЙЛ
; РАЗДЕЛИТЬ ОКНО ПО ВЕРТИКАЛИ        C-x 3
; РАЗДЕЛИТЬ ОКНО ПО ГОРИЗОНТАЛИ      C-x 2
; ЗАКРЫТЬ ТЕКУЩИЙ БУФЕР              C-x 0
; ЗАКРЫТЬ ВСЕ БУФЕРЫ, КРОМЕ ТЕКУЩЕГО C-x 1
; СПИСОК БУФЕРОВ                     C-x C-b
; http://www.drpaulcarter.com/cs/emacs.php

(add-to-list 'load-path "~/.emacs.d/")

;; Устанавливаем горячие клавиши для всякого
(global-set-key [f2] 'save-buffer)
(global-set-key [f5] 'copy-region-as-kill)   ;; copy,  also M-w
(global-set-key [f6] 'kill-region)           ;; cut,   also C-w
(global-set-key [f7] 'yank)                  ;; paste, also C-ny

;; Переключение между буферами. C-, - предыдущий, C-. - следующий
(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)

;; навигация между окнами при помощи M-`Arrow keys`
(windmove-default-keybindings 'meta)

;; Не надо набирать 'yes' или 'no'. Теперь 'y' либо 'n'
(fset 'yes-or-no-p 'y-or-n-p)

;; Замещаем выделенный текст вводом
(delete-selection-mode t)

;; Показывать номера строк
(global-linum-mode t)

;; Подсвечивание текущего столбца, с задержкой 8 сек. после редактирования
;; http://www.emacswiki.org/emacs/HighlightCurrentColumn
(require 'col-highlight)
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 8) ; Wait 8 idle secs.

;; Показывать номер колонки
(column-number-mode t)

;; подсветка строки с курсором
(global-hl-line-mode 1)

;; Blank-mode - показывать пробелы, табы, переводы строки и др.
;; http://www.emacswiki.org/emacs/BlankMode
(require 'blank-mode)
(global-blank-mode 0)

;; Умное автодополнение имён файлов
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; Автодополнение набираемого текста
(add-to-list 'load-path "~/.emacs.d/autocomplete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(ac-config-default)

;; Подсвечивать парные скобки
(show-paren-mode t)

;; Подсвечивать блок в скобках
(setq show-paren-style 'expression)

;; Автоматическое закрытие скобок/кавычек
;; https://github.com/capitaomorte/autopair
;; http://emacs-fu.blogspot.com/2010/06/automatic-pairing-of-brackets-and.html
(add-to-list 'load-path "~/.emacs.d/autopair")
(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers
;(setq autopair-autowrap t) ;;  I select a word, press ", and automatically it's turned into "word"

;; Обрамление выделенного блока кавычками, скобками и т.д.
;; https://github.com/rejeep/wrap-region
(add-to-list 'load-path "~/.emacs.d/wrap-region")
(require 'wrap-region)
(wrap-region-mode 1)

;; Цвета и шрифты
;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;(add-to-list 'load-path "~/.emacs.d/solarized")
;(require 'color-theme)
;(require 'color-theme-solarized)
;(color-theme-solarized-dark)
(set-face-font 'default "7x14")

(custom-set-faces
'(default ((t (:inherit nil
                        :stipple nil
                        :background "#073642"
                        :foreground "#93a1a1"
                        :inverse-video nil
                        :box nil
                        :strike-through nil
                        :overline nil
                        :underline nil
                        :slant normal
                        :weight normal
                        :height 120
                        :width normal
                        :foundry "outline"
                        :family "Helvetica Neue"))))
'(cursor ((t (:background "peach puff"))))
'(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 16)) (:background "darkgreen"))))
'(font-lock-comment-face ((nil nil)))
'(font-lock-doc-face ((t (:inherit font-lock-string-face :background "black"))))
)

;; убираем панель с кнопками
(scroll-bar-mode 0)
(tool-bar-mode 0)
;(menu-bar-mode 0)
(mouse-wheel-mode 1)

;; Старый способ переключения между буферами - через открытие iswitchb-buffer
(iswitchb-mode 1)

;; setting up tramp-mode - mode for editing files via root-privelegies
;; and editing files on sever's via ftp/ssh/smb etc
(require 'tramp)

;; SHELL=sh is required for editing files in tramp-mode if current shell is zsh
(setenv "SHELL" "/bin/sh")

(set-language-environment "Russian")
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)

;; copy/paste to X buffer
(setq x-select-enable-clipboard t)
;; дружимся с буфером обмена
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Пробелы вместо табов
(setq c-basic-indent 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)

;; Настройки скроллинга
(setq scroll-step 1                 ;; шаг скроллинга == 1
 scroll-conservatively 50           ;; не прыгать на середину страницы при скроллинге
 scroll-margin 8                    ;; начинать промотку страницы за 8 сток до края
 scroll-preserve-screen-position 't ;; без этого не будет нормально работать страница вниз/вверх
)

;; сохранять буфера после закрытия
(desktop-save-mode t)

;; Восстанавливаем размеры окна при запуске
(load (concat user-emacs-directory "restore-window-on-startup.el"))

;; эта хитрая заточка, включает разум имакса для подсветки синтаксиса
(global-font-lock-mode 1)

;; Убеждаемся что .emacs редактируется в elisp-mode'е
(setq auto-mode-alist (cons '("~/.emacs" . lisp-mode) auto-mode-alist))

;; "I always compile my .emacs, saves me about two seconds
;; startuptime. But that only helps if the .emacs.elc is newer
;; than the .emacs. So compile .emacs if it's not."
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat
                                                     default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'autocompile)

;; Change backup behavior to save in a directory, not in a miscellany
;; of files all over the place.
(setq
 backup-by-copying t                                        ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/saves"))                              ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                                         ; use versioned backups

;;;;;;; SCSS/SASS ;;;;;;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))


;;;;;;; DRUPAL ;;;;;;;

;; Start Drupal IDE with `drupal-ide' command:
(setq drupal-ide-load-path (concat user-emacs-directory "drupal/drupal-init.el"))
(autoload 'drupal-ide drupal-ide-load-path "Start IDE for PHP & Drupal development" t)

;; Drupal IDE
(load (concat user-emacs-directory "drupal/drupal-init.el"))
