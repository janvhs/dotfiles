# TODO: Test this function
function bode_is_ssh --description "Check if the current shell is a SSH shell"
    if test -n "$SSH_CLIENT" -o -n "$SSH_TTY" -o -n "$SSH_CONNECTION"
        return 0
    else
        return 1
    end
end