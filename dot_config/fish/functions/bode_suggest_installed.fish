# Takes:    $1 - The command to check
#           $2 (optional) - The program to install
# Returns:  0 if the command is installed, 1 if not
# Example:  suggest_installed "git"
function bode_suggest_installed --description "Checks if a command is installed and suggests to install it if it isn't."
    set program_cmd $argv[1]
    set program_name $argv[2]

    if ! bode_is_installed $program_cmd
        echo "Command '$program_cmd' not found. Please install it." 1>&2
        if [ "$program_name" != "" ]
            echo "It gets installed with $program_name." 1>&2
        end
        return 1
    end
    return 0
end
