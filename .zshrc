#                                                                                                   
# .zshrc is sourced in interactive shells.                                                          
# It should contain commands to set up aliases,                                                     
# functions, options, key bindings, etc.                                                            
#                                                                                                   

autoload -U compinit                                                                                
compinit                                                                                            
                                                                                                    
#allow tab completion in the middle of a word                                                       
setopt COMPLETE_IN_WORD                                                                             
                                                                                                    
bindkey -e                                                                                          
bindkey "^?"    backward-delete-char                                                                
bindkey "^H"    backward-delete-char                                                                
bindkey "^[[3~" delete-char                                                                         
bindkey "^[[1~" beginning-of-line                                                                   
bindkey "^[[4~" end-of-line                                                                         
                                                                                                    
                                                                                                    
## keep background processes at full speed                                                          
#setopt NOBGNICE                                                                                    
## restart running processes on exit                                                                
#setopt HUP                                                                                         
                                                                                                    
## history                                                                                          
#setopt APPEND_HISTORY                                                                              
## for sharing history between zsh processes                                                        
#setopt INC_APPEND_HISTORY                                                                          
#setopt SHARE_HISTORY                                                                               
HISTFILE=$HOME/.zsh-history                                                                         
HISTSIZE=100000                                                                                     
SAVEHIST=100000                                                                                     
setopt extended_history  

setopt share_history
function history-all { history -E 1 }

# color

local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local WHITE=$'%{\e[1;37m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'

# prompt

# for gentoo
PROMPT='[${USER}@${HOSTNAME}] %(!.#.$) '
RPROMPT='[%~]'


## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# fool ploof
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -aFG'
alias ll='ls -laFG'

setopt PROMPT_SUBST
setopt share_history
setopt auto_pushd
setopt auto_cd
setopt correct
setopt list_packed

bindkey -e


autoload -U colors
colors
