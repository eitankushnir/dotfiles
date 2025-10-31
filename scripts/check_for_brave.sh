if pgrep -x brave > /dev/null; then
    echo "1" > /tmp/brave_was_running
    pkill brave
else
    echo "0" > /tmp/brave_was_running
fi

