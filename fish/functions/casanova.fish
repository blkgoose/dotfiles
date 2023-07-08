function casanova
    set stuff "
        export bashelli_prima_apikey='ush7voo0aezooquoosheiYoshao9xeigheidohfe'
        export bashelli_fishtank_key='7cfef5c47656f0d7f669f7fe4931f9900b0a4109fc54799d6f891004b82b826e'
        export AUTH_TOKEN='7cfef5c47656f0d7f669f7fe4931f9900b0a4109fc54799d6f891004b82b826e'

        cd ~/proj/prima/casanova/
        virtualenv3 --quiet venv
        source venv/bin/activate 1>/dev/null 2>/dev/null
        pip install --quiet -r requirements.txt

        export PS1='casanova> '

        importer() {
            python ~/proj/prima/casanova/importer.py
        }
        export -f importer

        cd
    "

    set SSO_ACCOUNT $(aws sts get-caller-identity --query "Account" --profile default 2>/dev/null)
    set SSO_LEN (string length $SSO_ACCOUNT);
    set -q SSO_LEN[1]; or set SSO_LEN 0

    if count ~/.downloads/CSV*.csv ~/.downloads/Csv*.csv 1>/dev/null
        set files (ls -1 ~/.downloads/CSV*.csv ~/.downloads/Csv*.csv | split "\n")
    end

    echo "---"
    echo ""
    echo "      ':.                  "
    echo "         []_____           "
    echo "        /\      \          "
    echo "    ___/  \__/\__\__       "
    echo "---/\___\ |''''''|__\-- ---"
    echo "   ||'''| |''||''|''|      "
    echo "   ``"""`"`""))""`""`      "
    echo "---"
    echo "AWS: check user"
    if [ "$SSO_LEN" -eq 14 ]
        echo "AWS: logged in"
    else
        echo "AWS: logging in"
        aws sso login 1>/dev/null 2>/dev/null
    end
    echo "VPN: connected"
    warp-cli connect 1>/dev/null 2>/dev/null
    echo "FILE: importing"
    if [ (count $files) -eq 0 ];
        echo "  ERROR: nothing to import, did you download the files?"
    end
    for f in $files
        echo "FILE($f): checking for commas"
        if grep -q "," "$f"
            echo "  ERROR: file $f contains a comma, replacing with ''"
            sed -i -e "s/,//g" "$f"
        end
        echo "FILE($f): replacing colons with commas"
        sed -i -e "s/;/,/g" "$f"
        echo "FILE($f): renaming"
            mv "$f" (echo "$f" | sed -Er 's/[^0-9]*([0-9]{2})([^ ]+) ([0-9]{4}) ?([^.]+).*/\1\2\3\4.csv/')
    end

    echo "---"

    bash --init-file (echo "$stuff" | psub)

end
