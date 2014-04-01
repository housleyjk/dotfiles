# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
alias tmux="TERM=xterm-color tmux -2"

export WORKON_HOME=$HOME/.env
export PYTHONSTARTUP=~/.pythonrc
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source ~/.shell_prompt.sh
