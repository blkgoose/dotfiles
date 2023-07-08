# Defined in /tmp/fish.FlR8Bx/clean-arch.fish @ line 2
function clean-arch --wraps='sudo pacman -Rsn (pacman -Qdtq)' --description 'alias clean-arch sudo pacman -Rsn (pacman -Qdtq)'
  sudo pacman -Rsn (pacman -Qdtq) $argv;
end
