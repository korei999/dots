CurrWS=$(swaymsg -t get_workspaces | jq '.[] | select(.focused).num')
case "$CurrWS" in
    1) sway workspace $((CurrWS+9))
    ;;
    *) sway workspace $((CurrWS-1))
    ;;
esac
