. "$HOME/.cargo/env"
[[ -o login ]] && export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

if [ -e /home/price/.nix-profile/etc/profile.d/nix.sh ]; then . /home/price/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
