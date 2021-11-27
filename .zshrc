NL=$'\n'
PROMPT="%B%F{red}%~${NL}%F{blue}❯ %b%f"

alias ls='exa -l'

bindkey '^ ' end-of-line
bindkey ";5C" forward-word
bindkey ";5D" backward-word

ai() { sudo pacman -S $*; }
rp() { sudo pacman -R $*; }
auri() {
	git clone https://aur.archlinux.org/$1.git
	cd $1
	makepkg -si
	cd ..
	rm -rf $1
}

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

