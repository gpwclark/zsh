# Environment variables.
export EDITOR='vim'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PAGER='less -R'
# Other exported environment variables here.

# Add paths to PATH.
if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  export NIX_PATH="$HOME/.nix-defexpr"
fi
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Added by Toolbox App
export PATH="$PATH:/Users/price/Library/Application Support/JetBrains/Toolbox/scripts"

