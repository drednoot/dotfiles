if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session Hyprland
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

export EDITOR=nvim
export VUSUAL=nvim
export MAKEFLAGS=-j$(nproc)
export PATH="/home/ns/.local/bin:/home/ns/.cargo/bin:$PATH"
export LD_LIBRARY_PATH="/home/ns/.local/lib64:$LD_LIBRARY_PATH"

bindkey -e

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

yy () {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
			cd -- "$cwd"
		fi
		rm -f -- "$tmp"
}
bindkey -s '^o' 'yy\n'

alias ls='ls --color=auto -lth'
alias cp='cp --verbose'
alias mv='mv -vi'
alias rm='rm -i'
alias ln='ln --verbose'
alias cdwm='cd ~/Applications/dwm/ && sudo make clean install'
alias edwm='cd ~/Applications/dwm/ && nvim config.h'
alias cdwl='cd ~/Applications/dwl/ && sudo make clean install'
alias edwl='cd ~/Applications/dwl/ && nvim config.h'
alias gac='git add . && EDITOR=nvim git commit'
alias poweroff='loginctl poweroff'
alias smci='sudo make clean install'
alias v='nvim'
alias nv='/home/ns/Applications/neovide.AppImage'
alias inst='sudo ./install.sh'
alias untar='tar xpvf'
alias un7z='7z x'
alias reboot='sudo reboot'
alias mntdroid='jmtpfs ~/mnt/android/'
alias hamach='sudo /opt/logmein-hamachi/bin/hamachid && sudo hamachi login && sudo hamachi list'
alias pacclean='sudo paru -Scc && sudo paru -Rns $(paru -Qtdq)'
alias mount='sudo mount'
alias umount='sudo umount'
alias yuzufix='sudo sysctl -w vm.max_map_count=262144'
alias gpom='git push origin master'
alias gpgm='git push github master'
alias ds4linux='python -m ds4drv --hidraw --udp --udp-remap-buttons'
alias scan='scanimage --progress -o'
alias vifm='vifm .'
alias asm='nasm -f elf32 -g -F dwarf'
alias lk='ld -m elf_i386'
alias src='source ~/.zshrc'
alias ideaunlock='rm -rf /home/ns/.var/app/com.jetbrains.IntelliJ-IDEA-Community/config/JetBrains/IdeaIC2024.1/.lock'
alias braveunlock='rm -rf /home/ns/.config/BraveSoftware/Brave-Browser/SingletonLock'
alias conf='git --git-dir=$HOME/Applications/dotfiles/ --work-tree=$HOME/'
alias nixconf='git --git-dir=$HOME/Applications/nixconfig/ --work-tree=/etc/nixos/'
alias rup='rclone bisync /home/ns/Documents/neorg yadisk:neorg --resync-mode newer'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/Applications/powerlevel10k/powerlevel10k.zsh-theme

# eval "$(zoxide init zsh)"
