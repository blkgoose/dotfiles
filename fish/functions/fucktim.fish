function fucktim --argument pin
    prodenter 'TELECOMITALIA\X1017954' $pin
    sudo systemctl reset-failed tim_juniper
    sudo systemctl restart tim_juniper.service
end
