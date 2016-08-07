# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
alias tmux="TERM=xterm-color tmux -2"
alias history="history 0"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib
export PATH=$PATH:/usr/pgsql-9.4/bin:/home/housl/.gem/ruby/2.3.0/bin:$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin:$HOME/.bin
export WORKON_HOME=$HOME/.env
export PYTHONSTARTUP=~/.pythonrc
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source ~/.shell_prompt.sh
source ~/.uwsgi_completion.sh
compctl -g '~/.teamocil/*(:t:r)' teamocil
stty icrnl
stty inlcr

# added by travis gem
[ -f /home/housl/.travis/travis.sh ] && source /home/housl/.travis/travis.sh

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx

# Use neovim for now
# alias vim="nvim"

source /usr/share/nvm/init-nvm.sh
