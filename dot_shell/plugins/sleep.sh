#! /bin/sh

movie_sleep() {
    # Check if the system is Darwin
    if ! is_darwin; then
        movie_sleep_darwin "$@"
    fi


    if [ -z "$1" ]; then
        echo "Usage: movie_sleep <time>{,m,h,d}"
        return 1
    fi

    echo "Going to sleep after $1"
    sleep "$1"
    osascript -e 'tell app "System Events" to sleep'
}