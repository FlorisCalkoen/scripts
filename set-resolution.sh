xrandr | grep maximum &
sleep 2
gtf 2560 1440 60.0 &
sleep 2
xrandr --newmode "2560x1440_60.00" 311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync &
sleep 2
xrandr --addmode DP1 2560x1440_60.00 &
sleep 2
xrandr --output DP1 --mode 2560x1440_60.00 &
exit 0
