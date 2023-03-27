# Takes:    ...$ - The commands to check
# Returns:  0 if all commands are installed, 1 if not
# Example:
#   if suggest_multiple_installed "git" "brew"
#       echo "All commands are installed"
#   end
function bode_suggest_all_installed --description "Checks if one or more commands are installed and suggests to install them if they aren't."
    set all_installed 0
    for command in $argv
        bode_suggest_installed $command
        set all_installed $status
    end

    return $all_installed
end
