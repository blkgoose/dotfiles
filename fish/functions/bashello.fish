function bashello
    set bashelli_stuff "
        export PS1='bashello> '

        export bashelli_prima_apikey='ush7voo0aezooquoosheiYoshao9xeigheidohfe'
        export bashelli_fishtank_key='7cfef5c47656f0d7f669f7fe4931f9900b0a4109fc54799d6f891004b82b826e'


        if [ -f ~/proj/prima/bashelli/bash/.bash_account_manager ]; then
            . ~/proj/prima/bashelli/bash/.bash_account_manager
        fi
    "

    set SSO_ACCOUNT $(aws sts get-caller-identity --query "Account" --profile default 2>/dev/null)
    set SSO_LEN (string length $SSO_ACCOUNT);
    set -q SSO_LEN[1]; or set SSO_LEN 0

    echo "----"
    echo "Entering the bashello..."
    echo ""
    echo "             |    |    |               "
    echo "             )_)  )_)  )_)             "
    echo "            )___))___))___)\           "
    echo "           )____)____)_____)\\         "
    echo "         _____|____|____|____\\\__     "
    echo "---------\                   /---------"
    echo "  ^^^^^ ^^^^^^^^^^^^^^^^^^^^^          "
    echo "    ^^^^      ^^^^     ^^^    ^^       "
    echo "         ^^^^      ^^^                 "
    echo "----"
    echo "AWS: check user"
    if [ "$SSO_LEN" -eq 14 ]
        echo "AWS: logged in"
    else
        echo "AWS: logging in"
        aws sso login 1>/dev/null 2>/dev/null
    end
    echo "VPN: connecting"
    warp-cli connect 1>/dev/null 2>/dev/null
    echo "---"
    echo ""

    bash --init-file (echo "$bashelli_stuff" | psub)

end
