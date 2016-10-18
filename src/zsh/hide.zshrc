#=================================================================
autoload -U colors zsh-mime-setup select-word-style
colors
zsh-mime-setup                  # run if executable 
setxkbmap -option ctrl:nocaps   # disable caps-lock
#=================================================================

#=================================================================
# Prompt
setopt PROMPT_SUBST     # allow funky stuff in prompt
color="white"
# left prompt part
# PROMPT="%{$fg[$color]%}[%{$fg[red]%}%n%{$fg[$color]%}]-%{$reset_color%}[%{$fg[red]%}%~%{$fg[$color]%}]%{$reset_color%}$ "
# right prompt part
# local BAT="$(acpi | grep -o "[0-9]*%")%"
# RPROMPT="%{$fg[$color]%}[%{$fg[red]%}${BAT}%{$fg[$color]%}]-%{$fg[$color]%}[%{$fg[red]%}%m%{$fg[$color]%}]"
# RPROMPT="%{$fg[$color]%}[%{$fg[red]%}${BAT}%{$fg[$color]%}]"
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
PROMPT='%m %{${fg[green]}%}::%{$reset_color%} '
# PROMPT='%m %{${fg[red]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
RPS1="${return_code}"
#=================================================================

#=================================================================
# Completion
autoload -U compinit
compinit
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete aliases
setopt always_to_end            # when completing from the middle, move the cursor to the end
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
#=================================================================

#=================================================================
zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
#=================================================================

#=================================================================
# sections completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
#=================================================================

#=================================================================
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
#=================================================================

#=================================================================
# History
HISTFILE=~/.zsh_history         # where to store zsh_history file
HISTSIZE=2048                   # big history
SAVEHIST=2048                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
#=================================================================

#=================================================================
# Various
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
#=================================================================

#=================================================================
# Bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
#=================================================================

#=================================================================
# Additional files
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/functions

# Autorun commands
# welcomer
#=================================================================
