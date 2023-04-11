# Takes:    $1 - The name of the environment variable
# Returns:  1 if it doesn't exist or if not on WSL
# Stdout:   The value of the environment variable
function wslenv --description "Get the value of an environment variable from the Windows environment."
    if test (bode_os_discovery) = WSL
        set cmd $argv[1]
        /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "echo \$env:$cmd" | tr -d '\r'
        return $status
    else
        echo "This function is only available on WSL." 1>&2
        return 1
    end
end
