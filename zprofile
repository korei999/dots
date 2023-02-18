export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
export EDITOR=nvim

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config

# nnn stuff
export NNN_TRASH=1
export NNN_FIFO=/tmp/nnn.fifo

# swaylock
export LOCK_BG="/home/korei/Pictures/wallpapers/SetupLenovo.png"
export LOCK="swaylock -f -c 121212 -i $LOCK_BG -s fill --font Terminus --font-size 28 --indicator-radius 90 --indicator-thickness 15"

# i don't really use mpd anymore
# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && mpd
