function refresh_brewfile --description "Refresh the os-specific Brewfile"
    set brewfile $HOME/Brewfile.(bode_os_discovery)

    brew bundle dump --force --file $brewfile
end
