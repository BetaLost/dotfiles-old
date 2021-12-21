# Prompt
NL=$'\n'
PROMPT="%B%F{red}%~${NL}%F{blue}❯ %b%f"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory

# Aliases
alias ls='exa -l'

# Key bindings
bindkey '^[[Z' end-of-line 
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Interacting with packages
upd() { sudo pacman -Syy; }
upg() { sudo pacman -Syu }
sp() { pacman -Ss $*; }
gp() { sudo pacman -S $*; }
rp() { sudo pacman -R $*; }
auri() {
	for aurpkg in $@
	do
		git clone https://aur.archlinux.org/$aurpkg.git
		cd $aurpkg
		makepkg -si
		cd ..
		rm -rf $aurpkg
	done
}

# Downloading files
wg() { wget -O $1 --user-agent="Mozilla" $2; }
wgm() { 
	for arg in $@
	do
		arr=(${(s. .)arg})
		wget -O $arr[1] --user-agent="Mozilla" $arr[2]
	done
}

# Mounting NAS
mns() { 
	if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		echo "Usage: mns (--options) SERVER_HOSTNAME SHARE_NAME"
		echo ""
		echo "options:"
		echo "-h, --help   	Show this help message"
		echo "-u, --username	Specify a username"
		echo ""
		echo "Examples:"
		echo "	mns -u myuser raspberrypi myshare"
		echo "	mns raspberrypi myshare"
	elif [ "$1" = "-u" ] || [ "$1" = "--username" ]; then
		mkdir -p $HOME/shared/
		sudo mount -t cifs -o username=$2,dir_mode=0777,file_mode=0777 //$3/$4 $HOME/shared/
	else
		mkdir -p $HOME/shared/
		sudo mount -t cifs -o guest,dir_mode=0777,file_mode=0777 //$1/$2 $HOME/shared/
	fi
}

# Compile and run any cpp files in current directory
cr() {
	for file in *.cpp; do g++ $file -o "${file%.cpp}"; done
	./${file%.cpp}
}

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
