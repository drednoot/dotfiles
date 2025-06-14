if status is-interactive
  if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" -eq 1
    dbus-run-session Hyprland
  end

  function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
  end

  bind -M insert ctrl-o y repaint
  bind -M visual ctrl-o y repaint
  bind -M insert ctrl-backspace backward-kill-word
  bind -M insert alt-backspace backward-kill-word
  bind -M insert ctrl-l accept-autosuggestion

  set EDITOR nvim
  set VISUAL nvim
  set MAKEFLAGS -j$(nproc)
  set -gx PATH $PATH ~/.local/bin ~/.cargo/bin
  set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH ~/.local/lib64
  set CXX clang++
  set http_proxy "http://localhost:12334"
  set COPILOT_PROXY_URL "http://localhost:12334"
  set -U fish_greeting "hey there"

  fish_vi_key_bindings

  abbr --add ls 'ls --color=auto -lth'
  abbr --add cp 'cp --verbose'
  abbr --add mv 'mv -vi'
  abbr --add rm 'rm -i'
  abbr --add ln 'ln --verbose'
  abbr --add untar 'tar xpvf'
  abbr --add un7z '7z x'
  abbr --add scan 'scanimage --progress -o'
  abbr --add conf 'git --git-dir=$HOME/Applications/dotfiles/ --work-tree=$HOME/'
end
