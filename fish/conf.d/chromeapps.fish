if set -q CHROME_APPS_GEN
    return
end

set apps \
    "amazon|https://amazon.it|--profile-directory='Default'" \
    "books|https://play.google.com/books|--profile-directory='Default'" \
    "calendar|https://calendar.google.com/calendar" \
    "chess|https://www.chess.com" \
    "coggle|https://coggle.it" \
    "coronavisual|https://blkgoose.github.io/coronavisual" \
    "cruciverba|https://isbooth.com/cross.php?lg=it" \
    "disney|https://disneyplus.com|--profile-directory='Default'" \
    "duo|https://duo.google.com|--profile-directory='Default'" \
    "facebook|https://www.facebook.com|--profile-directory='Default'" \
    "gmail|https://mail.google.com" \
    "instagram|https://instagram.com|--profile-directory='Default'" \
    "keep|https://keep.google.com|--profile-directory='Default'" \
    "meet|https://meet.google.com" \
    "netflix|https://www.netflix.com|--profile-directory='Default'" \
    "news|https://news.google.it|--profile-directory='Default'" \
    "octopi|http://octopi.local|--profile-directory='Default'" \
    "onshape|https://cad.onshape.com|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "personio|https://prima-assicurazioni.personio.de" \
    "photos|https://photos.google.com|--profile-directory='Default'" \
    "primevideo|https://www.primevideo.com|--profile-directory='Default'" \
    "printables|https://www.printables.com|--profile-directory='Default'" \
    "reddit|https://reddit.com|--profile-directory='Default'" \
    "slack|https://prima.slack.com" \
    "stadia|https://stadia.google.com|--disable-extensions --disable-plugins" \
    "trello|https://www.trello.com|--profile-directory='Default'" \
    "tvshowtime|https://www.tvtime.com/en/to-watch|--profile-directory='Default'" \
    "whatsapp|https://web.whatsapp.com|--profile-directory='Default'" \
    "youtrack|https://prima-assicurazioni-spa.myjetbrains.com/youtrack/agiles" \
    "youtube|https://youtube.com|--profile-directory='Default'" \
    "github|https://github.com" \
    "drone_ci|https://drone-1.prima.it" \
    "notion|https://www.notion.so" \
    "miro|https://miro.com/app/dashboard" \
    "datadog|https://app.datadoghq.eu/" \
    "kibana|https://kibana-k8s.prima.it/app/discover#" \
    "nibol|https://app.nibol.co" \
    "sheets|https://docs.google.com/spreadsheets" \
    "maps|https://www.google.it/maps/preview|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "xbox|https://xbox.com/play|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "youtrack-backlog|https://prima-assicurazioni-spa.myjetbrains.com/youtrack/search/Team%20Intermediaries%20Experience%20(CMAEN)%20Backlog-967" \
    "n2f|https://www.n2f.com/app/#" \
    "wallet|https://web.budgetbakers.com/dashboard|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "messages|https://messages.google.com/web/conversations|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "telegram|https://web.telegram.org/z/|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "paint|https://jspaint.app/|" \
    "crunchyroll|https://www.crunchyroll.com/it|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "swarmia|https://app.swarmia.com/insights|" \
    "pyxis-doc|https://elm.prima.design" \
    "elm-search|https://klaftertief.github.io/elm-search/|--disable-extensions --disable-plugins --profile-directory='Default'" \
    "codescene|https://codescene.io/projects/35921/jobs/978159/results/code/hotspots/system-map" \

rm -rf ~/.local/bin/chromeapps/
mkdir -p ~/.local/bin/chromeapps/

for app in $apps
    set appname (string split '|' $app)[1]
    set applink (string split '|' $app)[2]
    set appopts (string split '|' $app)[3]

    echo """\
        #!/usr/bin/env bash

        chrome --app='$applink' --new-window $appopts
    """ \
    | awk '{$1=$1; print}' \
    | sed '$ d' \
    > ~/.local/bin/chromeapps/$appname

    chmod +x ~/.local/bin/chromeapps/$appname
end

set -Ux CHROME_APPS_GEN (date)
