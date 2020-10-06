;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Akarsh Jain"
      user-mail-address "akarsh.1995.02@gmail.com")
(setq doom-theme 'doom-one)

(setq projectile-project-search-path "~/Programming/Python/Projects/")

(setq display-line-numbers-type t)

(setq doom-font (font-spec :family "Fira Code" :size 15))

(require 'evil-multiedit)


(use-package! python-pytest
  :defer t
  :init
  (map! :after python
        :localleader
        :map python-mode-map
        :prefix ("t" . "test")
        "f" #'python-pytest-function-dwim
        "t" #'python-pytest))


;; Poetry keybindings
(map! :after python
        :localleader
        :map python-mode-map
        :prefix ("p" . "poetry")
        "a" #'poetry-venv-workon
        "d" #'poetry-venv-deactivate
        "t" #'poetry-venv-toggle
        )


(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))


(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook (lambda ()
                                 (yas-activate-extra-mode 'fundamental-mode) ))

(setq comint-prompt-read-only nil)


;; treat _ as word belonging so that - def some_function becomes def on pressing `diw'
(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t))



;; org agenda files
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/cloud_drives/mega/Agendas"))))


;; Line numbers hybrid
(setq display-line-numbers-type 'visual)
