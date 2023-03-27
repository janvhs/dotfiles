# Load homebrew on all platforms
set os_name (bode_os_discovery)

if test $os_name = Darwin
    /opt/homebrew/bin/brew shellenv | source
else if test $os_name = WSL || test $os_name = Linux
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
else
    echo "Unsupported OS: $os_name"
    return 1
end

# Activate command-not-found handler for homebrew
set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
if test -f $HB_CNF_HANDLER
    source $HB_CNF_HANDLER
else
    brew tap homebrew/command-not-found
    source $HB_CNF_HANDLER
end
