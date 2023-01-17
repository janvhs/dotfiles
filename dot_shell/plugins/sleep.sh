#! /bin/sh

movie_sleep() {
    if ! is_darwin; then
        echo 'This script is only for Darwin'
        return 1
    fi


    if [ -z "$1" ]; then
        echo "Usage: movie_sleep <time>{,m,h,d}"
        return 1
    fi
}

movie_sleep_darwin() {
    echo "Going to sleep after $1"
    sleep "$1"
    osascript -e 'tell app "System Events" to sleep'
}