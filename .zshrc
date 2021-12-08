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
sp() { sudo pacman -Ss $*; }
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

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


