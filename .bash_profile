export NODE_ENV="development"

# Add branch to prompt
source ~/.git-prompt.sh
PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '
