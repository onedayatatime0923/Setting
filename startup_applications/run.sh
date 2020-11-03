
# xdotool set_desktop 0
#
# google-chrome-stable --profile-directory="Default" --new-window &
# sleep 1
# google-chrome-stable --profile-directory="Profile 1" --new-window &
# sleep 1
# google-chrome-stable --profile-directory="Profile 2" --new-window &
# gnome-terminal --working-directory=/home/kevin
# xdg-open ~/Github
# xdg-open ~/Downloads
#
# sleep 3
#
# WIN=$(xdotool search --onlyvisible --name --desktop 0 --sync --limit 1 "Chrome")
# xdotool windowactivate --sync $WIN key super+Up
# xdotool set_desktop_for_window $WIN 2
#
# sleep 0.3
#
# WIN=$(xdotool search --onlyvisible --name --desktop 0 --sync --limit 1 "Chrome")
# xdotool windowactivate --sync $WIN key super+Up
# xdotool set_desktop_for_window $WIN 1
#
# sleep 0.3
#
# WIN=$(xdotool search --onlyvisible --name --sync --limit 1 "kevin@kevin-System-Product-Name:~")
# # WIN=$(xwininfo -name "kevin@kevin-System-Product-Name:~" | grep xwininfo | awk '{print $4}')
# xdotool windowactivate --sync $WIN key super+Up
# xdotool set_desktop_for_window $WIN 3
#
# sleep 0.3
#
# WIN=$(xdotool search --onlyvisible --name --sync --limit 1 "Github")
# # WIN=$(xwininfo -name "Github" | grep xwininfo | awk '{print $4}')
# xdotool windowactivate --sync $WIN key super+Right
# xdotool set_desktop_for_window $WIN 4
#
# sleep 0.3
#
# WIN=$(xdotool search --onlyvisible --name --sync --limit 1 "Downloads")
# # WIN=$(xwininfo -name "Downloads" | grep xwininfo | awk '{print $4}')
# xdotool windowactivate --sync $WIN key super+Left
# xdotool set_desktop_for_window $WIN 4
