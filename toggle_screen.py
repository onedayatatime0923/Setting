#!/usr/bin/env python3

import subprocess

cmd1 = "xrandr --verbose"
get = subprocess.check_output(["/bin/bash", "-c", cmd1]).decode("utf-8").split()
brightness = get[get.index("Brightness:")+1]
screens = [get[i-1] for i in range(len(get)) if get[i] == "connected"]

#  print(brightness)
if brightness == "1.0":
    for scr in screens:
        subprocess.Popen(["/bin/bash", "-c", "xrandr --output "+scr+" --brightness 0"])
else:
    for scr in screens:
        subprocess.Popen(["/bin/bash", "-c", "xrandr --output "+scr+" --brightness 1"])
