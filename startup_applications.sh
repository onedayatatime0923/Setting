xdotool set_desktop 0
google-chrome --profile-directory="Profile 2" --new-window &
sleep 0.5
xdotool key super+Up

xdotool set_desktop 1
google-chrome --profile-directory="Profile 1" --new-window &
sleep 0.5
xdotool key super+Up

xdotool set_desktop 2
google-chrome --profile-directory="Default" --new-window &
sleep 0.5
xdotool key super+Up

xdotool set_desktop 3
gnome-terminal --working-directory=/home/kevin
sleep 0.5
xdotool key super+Up

xdotool set_desktop 4
xdg-open ~/Downloads
sleep 0.5
xdotool key super+Left
xdg-open ~/Github
sleep 0.5
xdotool key super+Right

