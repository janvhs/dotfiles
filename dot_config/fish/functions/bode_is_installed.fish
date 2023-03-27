# Takes:    $1 - The command to check
# Returns:  0 if the command is installed, 1 if not
# Example:  if bode_is_installed "git"
#               echo "Git is installed"
#           end
function bode_is_installed --description "Checks if a command is installed."
    command -v $argv[1] >/dev/null 2>&1
    return (test $status -eq 0)
end
