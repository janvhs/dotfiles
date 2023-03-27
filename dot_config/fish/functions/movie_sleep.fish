function movie_sleep --wraps "sleep" --description "When I fall asleep the pc should do the same"
    if test (bode_os_discovery) != Darwin
        echo "Currently, this function is only supported on Darwin" 1>&2
        return 1
    end

    if test count argv != 1
        echo "Usage: movie_sleep TIME[s,m,h,d]" 1>&2
        return 1
    end

    set time $argv[1]
    echo "Going to sleep in $time"
    sleep $time
    onascripst -e "tell application \"System Events\" to sleep"
end