;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
                                        ;general
     better-defaults
     helm
     (auto-completion :variables
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-minimum-prefix-length 2
                      auto-completion-idle-delay 0.2
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup nil
                      auto-completion-enable-help-tooltip nil)
     treemacs
     themes-megapack
     theming

                                        ; networking
     eww
     gnus

                                        ;programming
     lsp
     syntax-checking
     version-control
     git
     python
     yaml
     markdown
     ;; mermaid &&& not recognized
     shell-scripts
     (shell :variables
            shell-default-height 30
            shell-default-position 'right
            shell-default-shell 'shell)
     (conda :variables
            conda-anaconda-home "~/conda")
     (ess
      :variables ess-r-backend 'lsp)
                                        ; lisp layers
     emacs-lisp
     common-lisp
     parinfer
     ;; (scheme :variables scheme-implementations '(guile))

                                        ; llm layers
     (llm-client :variables
                 llm-client-enable-gptel t)

                                        ; data layers
     csv
     markdown
     finance
     pdf

                                        ; academic layers
                                        ; writing layers
     (org
      :variables
      org-enable-reveal-js-support t)
     ;; (languagetool :variables
     ;;               languagetool-show-error-on-jump t
     ;;               langtool-default-language "en-US")
     multiple-cursors
     spell-checking)

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(citeproc-org
                                      ;; oc-csl ;; package unavailable
                                      citeproc
                                      gptel)


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(zonokai-red
                         white-sand
                         soft-stone
                         smyx
                         modus-operandi-tinted
                         heroku
                         hc-zenburn
                         eziam-dusk
                         ;; ef-arcadia
                         em-melissa-dark
                         doom-zenburn
                         alect-light-alt
                         gruvbox-light-hard
                         anti-zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'all-the-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Make consecutive tab key presses after commands such as
   ;; `spacemacs/alternate-buffer' (SPC TAB) cycle through previous
   ;; buffers/windows/etc. Please see the option's docstring for more information.
   ;; Set the option to t in order to enable cycling for all current and
   ;; future cycling commands. Alternatively, choose a subset of the currently
   ;; supported commands: '(alternate-buffer alternate-window). (default nil)
   dotspacemacs-enable-cycling nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
   ;; (default '("rg" "ag" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-redo', `undo-fu' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system from or to undo-tree. (default `undo-redo')
   dotspacemacs-undo-system 'undo-redo

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))


(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


  ;;;; mermaid executable
  ;; (setq ob-mermaid-cli-path "/home/user/.var/app/org.gnu.emacs/data/node/bin/mmdc")

  ;;;; structural editing and parentheses management
  ;; enable evil-cleverparens structural editing
  ;; https://practical.li/spacemacs/structural-editing/cleverparens/
  ;; (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
  ;; smartparens above should be on and strict
  ;; https://smartparens.readthedocs.io/en/latest/
  ;; &&&parinfer
  ;; https://shaunlebron.github.io/parinfer/
  ;; highlight parentheses by scope
  (remove-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode)

  ;; turn on editorconfig
  (editorconfig-mode 1)

  ;;;; default browser
  ;; (setq browse-url-browser-function 'browse-url-generic)
  ;; (setq browse-url-generic-program "nyxt")

  ;;;; auto update changed buffers
  ;; (global-auto-revert-mode) ; keep buffers up to date with disks
  ;; (setq auto-revert-use-notify nil) ; poll disk dont wait for os
  ;; (auto-save-visited-mode) ; make auto save same as explicit save

  ;;;; orgmode agenda files
  ;; set all after opening any *.org
  (with-eval-after-load 'org
    (setq org-agenda-files
          (directory-files-recursively
           (expand-file-name "~/org/") "\\.org$")))

  ;;;; refiling
  (setq org-refile-targets '((nil :maxlevel . 5)
                             (org-agenda-files :maxlevel . 5))) ;; target depths
  (setq org-refile-use-outline-path 'file) ;; breadcrumb-style outline paths
  (setq org-outline-path-complete-in-steps nil) ;; nil to show the full path in a single completion prompt
  (setq org-refile-allow-creating-parent-nodes 'confirm) ;; create new parent nodes on the fly

  ;;;; Org Tree Slide presentation
  ;; https://github.com/takaxp/org-tree-slide

  (add-hook 'org-mode-hook (lambda () (variable-pitch-mode -1))) ; &&& temp force org to fixed pitch

  (use-package org-tree-slide
    :ensure t
    :after org

    :hook (;; org-tree-slide-play-hook
           (org-tree-slide-play . my/presentation-start)
           ;; org-tree-slide-stop-hook
           (org-tree-slide-stop . my/presentation-end))
    ;; org-tree-slide-after-narrow-hook
    ;; (org-tree-slide-after-narrow . my/presentation-prepare-slide)
    ;; org-tree-slide-before-narrow-hook
    ;; org-tree-slide-before-move-next-hook
    ;; org-tree-slide-before-move-previous-hook

    :custom
    ;; init
    (org-tree-slide-cursor-init nil) ;; nil: start at cursor
    (org-image-actual-width nil)
    (org-tree-slide-activate-message "Presentation started!")
    (org-tree-slide-deactivate-message "Presentation finished!")
    ;; header
    (org-tree-slide-header t)
    (org-tree-slide-breadcrumbs " > ")
    (org-tree-slide-breadcrumbs-hide-todo-state t)
    (org-tree-slide-indicator '(:next "Next >>" :previous "<< Previous" :content "<< CONTENT >>"))
    ;; slide
    (org-tree-slide-slide-in-effect nil)
    (org-tree-slide-slide-in-waiting 0.02 Float)
    (org-tree-slide-slide-in-blank-lines 10)
    ;; folding
    (org-tree-slide-fold-subtrees-skipped nil)
    ;; appearance
    (org-tree-slide-heading-emphasis t)
    (org-tree-slide-never-touch-face t)
    (org-tree-slide-modeline-display 'outside)
    ;; skips
    (org-tree-slide-skip-outline-level 0)
    (org-tree-slide-skip-done nil)
    (org-tree-slide-skip-comments t)
    :config
    ;;fonts
    (defun my/find-first-font (candidates)
      "Return the first font from CANDIDATES available on this system."
      (cl-find-if (lambda (f) (member f (font-family-list))) candidates))

    (defvar my/presentation-fixed-font
      (my/find-first-font '("JetBrains Mono" "Fira Code" "Source Code Pro" "Consolas"))
      "Monospaced font for presentation code blocks.")

    (defvar my/presentation-variable-font
      (my/find-first-font '("Iosevka Aile" "Libre Baskerville" "Georgia" "DejaVu Serif" "DejaVu Sans"))
      "Variable-pitch font for presentation body text.")

    (defun my/presentation-setup-faces ()
      "Apply org face styling locally for the duration of the presentation."

      (require 'org-faces)

      (setq-local face-remapping-alist
                  `(;; root faces
                    (default (:family ,my/presentation-variable-font :weight light :height 190))
                    (variable-pitch (:height 1.0))
                    (fixed-pitch (:family ,my/presentation-fixed-font :height 1.1))
                    ;; variable children
                    (header-line (:height 2.0 :inherit variable-pitch))
                    (org-document-title (:height 1.75 :inherit variable-pitch))
                    (org-verbatim (:height 1.55 :inherit (shadow variable-pitch)))
                    ;; fixed children
                    (org-table (:inherit fixed-pitch))
                    (org-formula (:inherit fixed-pitch))
                    (org-checkbox (:inherit fixed-pitch))
                    (org-block            (:height 1.25 :inherit fixed-pitch))
                    (org-block-begin-line (:height 0.7 :inherit fixed-pitch))
                    (org-code             (:height 1.55 :inherit (shadow fixed-pitch)))
                    (org-special-keyword (:inherit (font-lock-comment-face fixed-pitch)))
                    (org-meta-line (:foreground ,(face-attribute 'default :background) :inherit (font-lock-comment-face fixed-pitch)))
                    ;; levels
                    (org-level-1 (:height 1.2 :weight medium :inherit variable-pitch))
                    (org-level-2 (:height 1.1 :weight medium :inherit variable-pitch))
                    (org-level-3 (:height 1.1 :weight medium :inherit variable-pitch))
                    (org-level-4 (:height 1.0 :weight medium :inherit variable-pitch))
                    (org-level-5 (:height 1.0 :weight medium :inherit variable-pitch))
                    (org-level-6 (:height 1.0 :weight medium :inherit variable-pitch))
                    (org-level-7 (:height 1.0 :weight medium :inherit variable-pitch))
                    (org-level-8 (:height 1.0 :weight medium :inherit variable-pitch)))))
    ;; events
    (defun my/presentation-start ()
      ;; save original state
      (setq-local my/presentation-original-alpha (frame-parameter (selected-frame) 'alpha))
      (setq-local my/presentation-original-face-remapping-alist face-remapping-alist)
      (setq-local my/presentation-original-org-hide-emphasis-markers (default-value 'org-hide-emphasis-markers))
      (setq-local my/presentation-original-header-line-format header-line-format)

      ;; Let the desktop background show through
      (set-frame-parameter (selected-frame) 'alpha '(95 . 100))

      ;; Apply face remappings
      (variable-pitch-mode 1)
      (my/presentation-setup-faces)

      (setq-local org-hide-emphasis-markers t)
      (setq-local header-line-format " ")

      (setq-local visual-fill-column-center-text t)
      (setq-local visual-fill-column-width 90)

      ;; set modes
      (display-line-numbers-mode -1)
      (visual-fill-column-mode 1)
      (visual-line-mode 1)
      (org-display-inline-images)
      (hide-mode-line-mode 1)
      ;; force redisplay
      (redraw-display))

    (defun my/presentation-prepare-slide ()
      "Collapse buffer to overview, then reveal only the current slide.")
    ;; ;; Show only top-level headlines
    ;; (org-overview)
    ;; ;; Unfold the current entry
    ;; (org-show-entry)
    ;; ;; Show only direct subheadings of the slide but don't expand them
    ;; (org-show-children)
    ;;(print "placeholder&&&"))

    (defun my/presentation-end ()
      ;; restore settings
      (set-frame-parameter (selected-frame) 'alpha my/presentation-original-alpha)
      (setq-local face-remapping-alist my/presentation-original-face-remapping-alist)
      (setq-local org-hide-emphasis-markers my/presentation-original-org-hide-emphasis-markers)
      (setq-local header-line-format my/presentation-original-header-line-format)

      ;; Clear all buffer-local variables set during presentation
      (kill-local-variable my/presentation-original-alpha)
      (kill-local-variable 'my/presentation-original-face-remapping-alist)
      (kill-local-variable 'my/presentation-original-org-hide-emphasis-markers)
      (kill-local-variable 'my/presentation-original-header-line-format)

      (kill-local-variable 'visual-fill-column-center-text)
      (kill-local-variable 'visual-fill-column-width)

      ;; Turn off modes
      (display-line-numbers-mode 1)
      (variable-pitch-mode 0)
      (visual-fill-column-mode 0)
      (visual-line-mode 0)
      (org-remove-inline-images)
      (hide-mode-line-mode 0)
      ;; force refresh
      (redraw-display))

    :bind
    (:map org-tree-slide-mode-map
          ("<S-left>" . org-tree-slide-content)
          ("<M-up>" . beginning-of-buffer)
          ("<M-down>" . end-of-buffer)
          ("<M-right>" . org-tree-slide-move-next-tree)
          ("<M-left>" . org-tree-slide-move-previous-tree)
          ("M-q" . org-tree-slide-mode)))
  ;;;; end presentation

  ;;;; org agenda
  (setq org-todo-keywords
        ;; #+TODO: TODO ready-to-start ACTIVE waiting-on | needs-review DONE
        '((sequence "TODO(t)" "ready-to-start(!)" "ACTIVE(a!)" "waiting-on(w@/!)" "|" "needs-review" "DONE(d!)")))

  (setq org-clock-in-switch-to-state "ACTIVE")

  (setq org-clock-out-when-done '("TODO" "ready-to-start" "waiting-on" "DONE" "needs-review"))

  (setq org-agenda-custom-commands
        '(;;
          ("t" "tagging"
           (;;
            (tags-todo "+@james"
                       ((org-agenda-overriding-header "James Tasks")))
            ;;
            (tags-todo "+@ana"
                       ((org-agenda-overriding-header "Ana Tasks")))
            ;;
            (tags-todo "-{.*}"
                       ((org-agenda-overriding-header "Untagged Tasks")))))
          ;;
          ("d" "Daily Agenda"
           ((agenda "" ((org-agenda-span 'day)
                        (org-deadline-warning-days 7)))
            (tags-todo "+PRIORITY=\"A\""
                       ((org-agenda-overriding-header "High Priority Tasks")))))
          ;;
          ("r" "Weekly Review"
           ((agenda ""
                    ((org-agenda-overriding-header "Completed Tasks")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'done))
                     (org-agenda-span 'week)))

            (agenda ""
                    ((org-agenda-overriding-header "Unfinished Scheduled Tasks")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                     (org-agenda-span 'week)))))
          ;;
          ("w" "whats important now"
           ;; DONE
           ((todo "DONE"
                  ((org-agenda-overriding-header "Completed (cutoff 12d)")
                   (org-agenda-skip-function
                    '(when (closed-old-p 12)
                       (org-end-of-subtree t)))
                   (org-agenda-sorting-strategy '(priority-down))))
            ;; needs-review
            (todo "needs-review"
                  ((org-agenda-overriding-header "Completed (pending review)")
                   (org-agenda-sorting-strategy '(priority-down))))
            ;; waiting-on
            (todo "waiting-on"
                  ((org-agenda-overriding-header "Blocked")
                   (org-agenda-sorting-strategy '(priority-down))))
            ;; ACTIVE
            (todo "ACTIVE"
                  ((org-agenda-overriding-header "Whats Important Now")
                   (org-agenda-sorting-strategy '(priority-down))))
            ;; ready-to-start
            (todo "ready-to-start"
                  ((org-agenda-overriding-header "Soon")
                   (org-agenda-sorting-strategy '(priority-down))))
            ;; TODO
            (todo "TODO"
                  ((org-agenda-overriding-header "Later")
                   (org-agenda-sorting-strategy '(priority-down))))))))

  (setq org-agenda-tag-filter-preset '("-noexport"))

  (defun closed-old-p (days)
    "t if current entry is closed and older than days"
    (let ((closed (org-entry-get (point) "CLOSED")))
      (when closed
        (let* ((closed-time (org-time-string-to-time closed))
               (days-seconds (* days 24 60 60))
               (cutoff-time (time-subtract (current-time) days-seconds))
               (ret-value (time-less-p closed-time cutoff-time)))
          ret-value))))

  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (timeline . "  % s")
          ;; (todo   . " %i %-12:c %b") ;; default
          (todo   . " %i %b")
          (tags   . " %i %-12:c")
          (search . " %i %-12:c")))

  (setq org-tag-alist
        '(;; Places
          ;; ("@main" . ?M)
          ;; ("@barley" . ?B)
          ;; Devices
          ;; ("@gpsc" . ?g)
          ;; ("@lablinux" . ?l)
          ;; document control
          ("noexport" . ?X)
          ("nofinalexport" . ?x)
          ;; People
          ("@james" . ?J)
          ("@ana" . ?A)
          ("@tayab" . ?T)
          ("@danny" . ?D)
          ("@bryan" . ?B)
          ("@nevya" . ?N)
          ;; Activities
          ("@architecture" . ?a)
          ("@janitorial" . ?j)
          ("@on-fire" . ?f)
          ("@wizardry" . ?w)
          ("@programming" . ?p)
          ("@communication" . ?c)
          ("@repeats" . ?r)
          ("@learning" . ?l)))
  ;;;; end org agenda

  ;;;; allow slime/common lisp to talk to emacs
  ;; (setq slime-enable-evaluate-in-emacs t) ;; enables lisp to execute arbitrary code in emacs. dangerously cool

  ;;;; lisp implementations
  ;; start the first found in the list: M-x slime
  ;; select an implementation from the list: M-- M-x slime &&&
  (setq slime-lisp-implementations
        '((sbcl ("sbcl") :coding-system utf-8-unix)
          (sbcl-32G-heap ("sbcl""--dynamic-space-size" "32768") :coding-system utf-8-unix)
          ;; (qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix)
          ;; (qlot-32G-heap ("qlot" "exec" "sbcl" "--dynamic-space-size" "32768") :coding-system utf-8-unix)
          ;; (cmucl ("cmucl" "-quiet"))
          ;; (ccl  ("ccl64" "-K" "utf-8"))
          ;; (ecl  ("ecl"))
          ;; (abcl ("abcl"))
          (sbcl ("sbcl") :coding-system utf-8-unix)))

  ;;;; calfw calendar
  (spacemacs/set-leader-keys "aov" 'calfw-open-calendar-buffer)

  ;;;; gnus
  ;;                                       ; set variables
  ;; (setq user-full-name "user"
  ;;       user-mail-address "user@gmail.com")

  ;; (setq auth-sources '("~/.authinfo.gpg"))
  ;;                                       ; get email store in nnml
  ;; (setq gnus-secondary-select-methods
  ;;       '((nnimap "gmail"
  ;;                 (nnimap-address "imap.gmail.com")
  ;;                 (nnimap-server-port 993)
  ;;                 (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash") ;move expired to
  ;;                 (nnmail-expiry-wait immediate) ;marked expired, process now
  ;;                 (nnimap-stream ssl))))
  ;;                                       ;send email via gmail
  ;; (setq message-send-mail-function 'smtpmail-send-it
  ;;       smtpmail-default-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-service 587);set sending SMTP service port
  ;;                                       ;make gnus NOT ignore [Gmail] mailboxes
  ;; (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

  ;;                                       ;archive outgoing email in sent folder on imap.gmail.com
  ;; (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
  ;;       gnus-message-archive-group "[Gmail]/Sent Mail")
  ;;                                       ;set posting styles
  ;; (setq gnus-posting-styles
  ;;       '(
  ;;         ((header "to" "user@gmail.com") ;set return email address
  ;;          (address "user@gmail.com"))))
  ;;                                       ;store email in a directory
  ;; (setq nnml-directory "~/email")
  ;; (setq message-directory "~/email")
  ;;;; end gnus

  ;; ;;;; gptel
  ;; ;; make a default model
  ;; (setq gptel-model "claude-sonnet-4-5"
  ;;       gptel-backend (gptel-make-anthropic "claude"
  ;;                       :stream t
  ;;                       :key "key&&&"))

  ;; ;; register a backend
  ;; ;; (gptel-make-ollama "ollama" ; Any name of your choosing
  ;; ;;   :host "localhost:11434" ; Where it's running
  ;; ;;   :stream t ;Stream responses
  ;; ;;   :models '("zephyr" "ollama3" ; List of models
  ;; ;;             default))

  ;; ;; default format
  ;; (setq gptel-default-mode "org-mode")

  ;; ;; keybindings
  ;; (spacemacs/set-leader-keys "$s" 'gptel-send)

  (defun absorb-weird-parens-at-the-end-of-user-config ()
    (print "auto generated stuff below was messing up my user config parens.")))




;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
