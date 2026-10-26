# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH="$PATH:/home/jeremy/.cargo/bin"

eval "$(zoxide init zsh)"

# SSH Manager based on .ssh/config
kssh() {
  local host
  host=$(awk '/^Host / && !/\*/ {print $2}' ~/.ssh/config | fzf --prompt="Connect to > " --height=40% --reverse)
  if [[ -n "$host" ]]; then
    kitten ssh "$host"
  fi
}

alias vim=nvim
alias cd=z # zoxide
alias cdi=zi # zoxide
