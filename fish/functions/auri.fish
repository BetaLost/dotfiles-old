function auri
    git clone https://aur.archlinux.org/$argv[1].git
    cd $argv[1]
    makepkg -si
    cd ..
    rm -rf $argv[1]
end
