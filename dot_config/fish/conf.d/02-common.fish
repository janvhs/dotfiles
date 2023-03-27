# Shared configuration for all operating systems
# The os-dependent configurations are stored under their respective names
# in the conf.d directory

# =============================================================================
#
# Environment variables
#

# XDG Base Directory Specification
# Only for convenience, because I don't know Darwin well enough
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_DATA_HOME || set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_CONFIG_HOME || set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_STATE_HOME || set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME || set -Ux XDG_CACHE_HOME $HOME/.cache
# This sould poperly not be set and is just here for completeness
# set -q XDG_RUNTIME_DIR || set -Ux XDG_RUNTIME_DIR /run/user/(id -u)

# Possible directories which are referenced by the xdg-user-dirs manpage
# https://cgit.freedesktop.org/xdg/xdg-user-dirs/tree/man/xdg-user-dir.xml
# https://wiki.archlinux.org/title/XDG_user_directories#Creating_custom_directories

# set -q XDG_DESKTOP_DIR || set -Ux XDG_DESKTOP_DIR $HOME/Desktop
# set -q XDG_DOCUMENTS_DIR || set -Ux XDG_DOCUMENTS_DIR $HOME/Documents
# set -q XDG_DOWNLOAD_DIR || set -Ux XDG_DOWNLOAD_DIR $HOME/Downloads
# set -q XDG_MUSIC_DIR || set -Ux XDG_MUSIC_DIR $HOME/Music
# set -q XDG_PICTURES_DIR || set -Ux XDG_PICTURES_DIR $HOME/Pictures
# set -q XDG_PUBLICSHARE_DIR || set -Ux XDG_PUBLICSHARE_DIR $HOME/Public
# set -q XDG_TEMPLATES_DIR || set -Ux XDG_TEMPLATES_DIR $HOME/Templates
# set -q XDG_VIDEOS_DIR || set -Ux XDG_VIDEOS_DIR $HOME/Videos

# Not part of the xdg-users-dirs manpage
# but I've seen it a few times
# set -q XDG_PROJECTS_DIR || set -Ux XDG_PROJECTS_DIR $HOME/Projects

# For git signing with gpg
set -Ux GPG_TTY (tty)

# Use nvim as the default editor
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Set the default pager to less
set -Ux PAGER less

# =============================================================================
#
# Program initialization
#

# Deactivate the fish greeting message
set fish_greeting

# TODO: Setup bat
# https://github.com/sharkdp/bat#integration-with-other-tools

# =============================================================================
#
# Theming
#

set -Ux BAT_THEME Catppuccin-macchiato
set -Ux FZF_DEFAULT_OPTS " \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# =============================================================================
#
# Path
#

# INFO: If you do not use the fish binary provided by brew, you will need to
#       uncomment the following lines to get completions to work

# if test -d (brew --prefix)"/share/fish/completions"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
# end

# if test -d (brew --prefix)"/share/fish/vendor_completions.d"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
# end

# END

# User specific executables according to the XDG Base Directory Specification
fish_add_path $HOME/.local/bin

# Folder for SDKs e.g. graalvm and golang versions
# Clone SDKs into $HOME/sdk and symlink them into the bin folder
fish_add_path $HOME/sdk/bin

# Go executables
fish_add_path $HOME/go/bin

# Rust executables
fish_add_path $HOME/.cargo/bin

# PHP executables
fish_add_path $HOME/.config/composer/vendor/bin

# Deno executables
fish_add_path $HOME/.deno/bin

# =============================================================================
#
# Interactive
#

if status is-interactive
    # Commands to run in interactive sessions can go here
    # These commands are run after the os-specific configuration

    # =========================================================================
    #
    # Program initializations and configuration
    #

    # Fix filepermissions for ssh
    bode_fix_ssh_permissions

    # Prompt
    # starship init fish | source

    # Smart cd with history
    zoxide init fish | source

    # Loading local environment variables from .envrc
    # direnv hook fish | source

    # Force pip to use virtualenvs to prevent polluting the system
    # These are all currently maintained python versions as well as python2
    # https://endoflife.date/python
    # TODO: I just put this here. Find out if this breaks anything
    # TODO: Create them dinamically and move this into a function
    alias pip "pip --require-virtualenv"
    alias pip3 "pip3 --require-virtualenv"
    alias pip3.7 "pip3.7 --require-virtualenv"
    alias pip3.8 "pip3.8 --require-virtualenv"
    alias pip3.9 "pip3.9 --require-virtualenv"
    alias pip3.10 "pip3.10 --require-virtualenv"
    alias pip3.11 "pip3.11 --require-virtualenv"

    # =========================================================================
    #
    # Aliases
    #

    alias cd z

    alias ls "exa -G --icons --group-directories-first"
    alias ll "ls -lgh --git"
    alias la "ll -a"
    alias lg "la --git-ignore"
    alias ld "la -D"

    alias vi nvim
    alias vim nvim

    alias brewup "brew update && brew upgrade"

    if test $TERM = xterm-kitty
        alias ssh "kitty +kitten ssh"
    end
end

# =============================================================================
#
# Exit
#

function bode_on_exit_common --on-event fish_exit

end
