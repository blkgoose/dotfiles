# Defined in /tmp/fish.F5w2q7/screencast.fish @ line 2
function screencast --argument screenname
    set screen (xrandr --query | grep "^$screenname")

    set size  (echo "$screen" | grep -ioP "\d+x\d+")
    set shift (echo "$screen" | grep -ioP "\+\d+\+\d+")

    if test -z "$size"
        echo "ERROR: monitor not found"
        return 1
    end

    sudo ffmpeg -f x11grab -r 60 -s "$size" -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 -vf 'scale=1280:720' /dev/video2
end
