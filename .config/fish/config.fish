# setting environment variables
set -gx ARCHFLAGS '-arch x86_64'
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PAGER less
set -gx TERMINAL terminator
set -gx VISUAL code
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL
set -gx XDG_CURRENT_DESKTOP GNOME

#turns on 24 bit support
set -gx fish_term24bit 1

set -gx fish_greeting "This is a trap"

# defining third party abbreviations
abbr -a manjaro_usb sudo dd bs=4M if=manjaro.iso of=/dev/sdX status=progress oflag=sync
abbr -a dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
abbr -a fish_config $EDITOR $HOME/.config/fish/config.fish
abbr -a refresh source $HOME/.config/fish/config.fish
abbr -a prompt $EDITOR $HOME/.config/fish/functions/fish_prompt.fish
abbr -a public_ip curl -s icanhazip.com
abbr -a cclip xclip -selection clipboard

# defining unix abbreviations
abbr -a ls ls -lh
abbr -a lsa ls -lah
abbr -a mkdir mkdir -p
abbr -a mv mv -v
abbr -a rm rm -rf
abbr -a cp cp -r
abbr -a scp scp -r


# automatically start X server at login
if status --is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end
