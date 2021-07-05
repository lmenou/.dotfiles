# TODO
# ----

# Sourcing py-phasesep to use package, ugly method
PYTHONPATH="${PYTHONPATH}:$HOME/Documents/Python_code/PrivateModule/py-phasesep.git"
export PYTHONPATH

# To use subl command line for sublime
# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Changing prompt command at the beginning
# ORIGIN : PS1='%n@%m %1~ %# ' i.e remove the directory printed in tmux
# PS1='%B%F{124}[%f%F{76}l%f%F{39}@%f%F{76}z%f%F{124}]%f %1~ >> %b'
# PS1='%B[%bl@z%B]%b %B%1~ >>%b '
# PS1='%B[%bl@z%B] >>%b '
PS1='[l@z] >> '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
				eval "$__conda_setup"
else
				if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
				. "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
				else
				export PATH="$HOME/opt/anaconda3/bin:$PATH"
				fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Deactivate conda at the entrance of the shell
# conda deactivate at startup in the conda config below
# run true in the shell to activate at the beginning
# COMMAND : conda config --set auto_activate_base false

# Default env for vi mode in zsh
set -o vi
# Set escape as in vim
# bindkey jk vi-cmd-mode

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit check if files are not owned by root or by the current user, or
# files in directories that are world- or group-writable or that are not owned
# by root or by the current user.  -u disable this check might lead to problem
# !!
compinit -u
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# To use fzf in the shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To use aliases
source $HOME/.dotfiles/zsh/aliases/alias-syntax.zsh
