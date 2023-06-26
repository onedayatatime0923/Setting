# the gnome desktop entry to be updated
key="org.gnome.desktop.a11y.magnifier mag-factor"

step=0.2
maxValue=4.0

currentValue=$(gsettings get $key)

if [ "$1" = "--add" -o "$1" = "-a" ]; then
    newValue=$(python3 -c "print(min($maxValue, $currentValue + $step))")
    gsettings set $key $newValue
fi

if [ "$1" = "--sub" -o "$1" = "-s" ]; then
    newValue=$(python3 -c "print(max(1.0, $currentValue - $step))")
    gsettings set $key $newValue
fi
