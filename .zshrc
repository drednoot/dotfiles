# autoload -U colors && colors

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

vifmcd () {
    tmp="$(mktemp)"
    vifm . --choose-dir "$tmp"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'vifmcd\n'

export EDITOR=neovide
export TERM=st

alias ls='ls --color=auto -lth'
alias cp='cp --verbose'
alias mv='mv -vi'
alias rm='rm -i'
alias ln='ln --verbose'
alias cdwm='cd ~/Applications/dwm/ && sudo make clean install'
alias edwm='cd ~/Applications/dwm/ && nvim config.h'
alias gac='git add . && EDITOR=nvim git commit'
alias poweroff='sudo shutdown -P now'
alias smci='sudo make clean install'
alias v='neovide'
alias inst='sudo ./install.sh'
alias untar='tar xpvf'
alias un7z='7z x'
alias reboot='sudo reboot'
alias mntdroid='jmtpfs ~/mnt/android/'
alias hamach='sudo /opt/logmein-hamachi/bin/hamachid && sudo hamachi login && sudo hamachi list'
alias pacclean='sudo paru -Scc && sudo paru -Rns $(paru -Qtdq)'
alias vifm='vifm .'
alias mount='sudo mount'
alias umount='sudo umount'
alias yuzufix='sudo sysctl -w vm.max_map_count=262144'
alias gpom='git push origin master'
alias gpgm='git push github master'
alias cemuhook='python -m ds4drv --hidraw --udp --udp-remap-buttons'
alias scan='scanimage --progress -o'
alias vlist='neovide /home/ns/.config/listmntn/watchables'
alias vgames='neovide /home/ns/.config/listmntn/games'

PS1="%B%F{red}[%f%b%B%~%b%B%F{red}]%f%b$ "
eval $(dircolors -b ~/.dir_colors)

# paleofetch
# echo "$(cat /home/ns/Documents/syncthing/files/games.txt)"
/home/ns/Documents/bash/listmntn/listmntn
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
