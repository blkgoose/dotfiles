# Defined in /tmp/fish.OLe2jg/change-background.fish @ line 2
function change-background --argument file
	cp $file ~/.wallpaper
    # feh --bg-fill ~/.wallpaper
    wal -c
    wal -i ~/.wallpaper -a 85
end
