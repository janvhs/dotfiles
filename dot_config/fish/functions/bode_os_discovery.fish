# Takes:    void
# Stdout:   the operating system name
# Example:
#   if test (bode_os_discovery) != Darwin
#       return
#   end
function bode_os_discovery --description "Detect and print the operating system name"
    set os_name (uname -s)
    set os_type $os_name
    if test "$os_name" = Linux && test -n $WSL_DISTRO_NAME
        set os_type WSL
    end
    echo $os_type
end
