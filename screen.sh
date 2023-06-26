connected=$(xrandr | grep -w connected | cut -f1 -d' ')
status='on'
for display in $connected; do
    brightness=$(xrandr --verbose | grep -m 1 -w "$display connected" -A8 | grep "Brightness" | cut -f2 -d ' ')
    # echo $brightness
    if [ "$brightness" != '1.0' ]
    then
        status='off'
    fi
done
if [ "$status" == 'off' ]
then
    for display in $connected; do
        xrandr --output $display --brightness 1
    done
else
    for display in $connected; do
        xrandr --output $display --brightness 0
    done
fi
# echo $status
