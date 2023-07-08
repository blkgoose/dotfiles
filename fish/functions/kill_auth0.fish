function kill_auth0 --wraps='docker ps | grep "auth0" | cut -d" " -f1 | foreach "docker kill {}"' --description 'alias kill_auth0 docker ps | grep "auth0" | cut -d" " -f1 | foreach "docker kill {}"'
  docker ps | grep "auth0" | cut -d" " -f1 | foreach "docker kill {}" $argv
        
end
