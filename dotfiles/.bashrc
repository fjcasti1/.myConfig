[ -z "$PS1" ] && source ~/.extra;

[ -n "$PS1" ] && source ~/.bash_profile;

# Load fzf bash file:
[ -f ~/.fzf.bash ] && source ~/.fzf.bash;
