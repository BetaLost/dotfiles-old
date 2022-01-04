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
		echo "-h, --help	 Show this help message"
		echo "-u, --username	 Mount with a username"
		echo "-m, --mount	 Mount without a username (guest/anonymous)"
		echo "-n, --unmount	 Unmount the NAS"
		echo ""
		echo "Examples:"
		echo "	mns --username myuser 192.168.0.0 homeshare"
		echo "	mns -m homeserver myshare"
		echo "	mns -n"
	elif [ "$1" = "-u" ] || [ "$1" = "--username" ]; then
		mkdir -p $HOME/shared/
		sudo mount -t cifs -o username=$2,dir_mode=0777,file_mode=0777 //$3/$4 $HOME/shared/
	elif [ "$1" = "-m" ] || [ "$1" = "--mount" ]; then
		mkdir -p $HOME/shared/
		sudo mount -t cifs -o guest,dir_mode=0777,file_mode=0777 //$1/$2 $HOME/shared/
	elif [ "$1" = "-n" ] || [ "$1" = "--unmount" ]; then
		sudo umount $HOME/shared/
		rmdir $HOME/shared/
	else
		echo "Usage: mns (--options) SERVER_HOSTNAME SHARE_NAME"
		echo ""
		echo "options:"
		echo "-h, --help	 Show this help message"
		echo "-u, --username	 Mount with a username"
		echo "-m, --mount	 Mount without a username (guest/anonymous)"
		echo "-n, --unmount	 Unmount the NAS"
		echo ""
		echo "Examples:"
		echo "	mns --username myuser 192.168.0.0 homeshare"
		echo "	mns -m homeserver myshare"
		echo "	mns -n"
	fi
}

# Mount Microsoft Windows Partition
mwp() {
	if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		echo "Usage: mwp (--options) /dev/sdXX"
		echo ""
		echo "options:"
		echo "-h, --help	 Show this help message"
		echo "-m, --mount	 Mount partition"
		echo "-n, --unmount	 Unmount the partition"
		echo ""
		echo "Examples:"
		echo "	mwp -m /dev/sda3"
		echo "	mwp --unmount"
	elif [ "$1" = "-m" ] || [ "$1" = "--mount" ]; then
		sudo mkdir -p /mnt/MSW/
		sudo mount $2 /mnt/MSW/
		cd /mnt/MSW/
	elif [ "$1" = "-n" ] || [ "$1" = "--unmount" ]; then
		cd $HOME/
		sudo umount /mnt/MSW/
		sudo rmdir /mnt/MSW/
	else
		echo "Usage: mwp (--options) /dev/sdXX"
		echo ""
		echo "options:"
		echo "-h, --help	 Show this help message"
		echo "-m, --mount	 Mount partition"
		echo "-n, --unmount	 Unmount the partition"
		echo ""
		echo "Examples:"
		echo "	mwp -m /dev/sda3"
		echo "	mwp --unmount"
	fi
}

# Encrypt data
sef() {
	gpg --symmetric --no-symkey-cache --cipher-algo AES256 $1
}

# Decrypt data
sdf() {
	gpg --output ${1%.gpg} --decrypt --no-symkey-cache $1
}

# Compile and run any cpp files in current directory
cr() {
	for file in *.cpp; do g++ $file -o "${file%.cpp}"; done
	./${file%.cpp}
}

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
