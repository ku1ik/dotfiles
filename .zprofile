# Automatically start X and log out after when logging into vc/1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx >& .myXLog
    logout
fi
