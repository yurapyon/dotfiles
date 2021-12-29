xset r rate 360 30
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Inertia" 15
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 150
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.85
# xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Adaptive Deceleration" 1.5
xinput set-prop "Logitech Wireless Mouse" "Accel Speed" -0.5
xrdb ~/.Xresources
# export _JAVA_AWT_WM_NONREPARENTING=1
