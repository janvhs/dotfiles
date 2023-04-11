# Creadits to @mattmc3 https://github.com/mattmc3/fishconf/blob/51e43c3887af4e216513938de2bdad2710fa53cd/conf.d/magic-enter.fish
function magic-enter-cmd --description "Print the command to run when no command was given"
    set -l cmd la
    if command git rev-parse --is-inside-work-tree &>/dev/null
        set cmd "git status -sb"
    end
    echo $cmd
end

function magic-enter
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r (magic-enter-cmd)
        commandline -f suppress-autosuggestion
    end
    commandline -f execute
end

bind \r magic-enter
