# setting environment variables
set -gx EDITOR code

# defining abbr
abbr -a manjaro_usb sudo dd bs=4M if=manjaro.iso of=/dev/sdX status=progress oflag=sync
abbr -a dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME

# automatically start X server at login
if status --is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end

