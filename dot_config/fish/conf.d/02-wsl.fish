# Guard to make sure this file is only executed
# on WSL
if test (bode_os_discovery) != WSL
    return
end

# =============================================================================
#
# Environment variables
#

# Choose which JDK to use
# set -Ux JAVA_HOME $HOMEBREW_PREFIX/opt/openjdk@17

# Set GRADLE_HOME because some tools need it
# set -Ux GRADLE_HOME ...


# =============================================================================
#
# Program initialization and configuration
#



# =============================================================================
#
# Theming
#



# =============================================================================
#
# Path
#

set windows_home (wslpath (wslenv USERPROFILE))
fish_add_path "$windows_home/AppData/Local/Programs/Microsoft VS Code/bin"
fish_add_path "$windows_home/scoop/apps/rancher-desktop/current/resources/resources/linux/bin"

# =============================================================================
#
# Interactive
#

if status --is-interactive
    # Commands to run in interactive sessions can go here

    # =========================================================================
    #
    # Program initializations and configuration
    #


    # =========================================================================
    #
    # Aliases
    #

    alias explorer /mnt/c/Windows/explorer.exe

    # TODO: Add alias for trash until Dustman supports Linux
    # Delete files safely
    # https://github.com/bode-fun/Dustman
    # alias trash 

    # TODO: Add ssh keys but use the os keychain
    # alias ssh-add 
end

# =============================================================================
#
# Interactive Login
#

if status --is-login
    # Load ssh keys into the ssh-agent
    #eval (ssh-agent -c | sed 's/^echo/#echo/')
    # TODO: Move to gnome-keyring https://wiki.archlinux.org/title/GNOME/Keyring#SSH_keys
    eval (keychain --eval --agents ssh)
end

# =============================================================================
#
# Exit
#

function bode_on_exit_wsl --on-event fish_exit

end
