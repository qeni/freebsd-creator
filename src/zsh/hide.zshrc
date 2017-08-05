export TERM="xterm-256color"

# prompt
setopt PROMPT_SUBST
PROMPT='[%m] %{${fg[blue]}%}::%{$reset_color%} '

# colors
autoload -U colors
colors
setxkbmap -option ctrl:nocaps
# LS_COLORS=$LS_COLORS:'di=31:ex=32:*.tar=blue:*.gz=blue:*.png=35:*.jpg=35:*.mp3=1;33:*.flac=1;33' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'di=34:ex=32:*.tar=blue:*.gz=blue:*.png=35:*.jpg=35:*.mp3=1;33:*.flac=1;33' ; export LS_COLORS

# completion
autoload -U compinit
compinit
setopt correct
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*::::' completer _expand _complete _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# history
HISTFILE=~/.zsh_history
HISTSIZE=2048
SAVEHIST=2048
setopt append_history
setopt hist_ignore_all_dups
unsetopt hist_ignore_space

# various
setopt auto_remove_slash
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

# basic aliases
alias l="clear;ls --color -lh"
alias l.='ls -d .* --color=auto'
alias df='df -kTh'
alias ip='sudo ip addr show'
alias ..="cd ..;clear;ls --color -lh"
alias ...="cd ../..;clear;ls --color -lh"
alias ....="cd ../../..;clear;ls --color -lh"	
alias reb="sudo systemctl reboot"
alias off="sudo systemctl poweroff"
alias sus="sudo systemctl suspend"
alias w="sudo wifi-menu"
alias genpass="apg -a 0 -m 14 -x 14 -M SNCL"
alias n="ncmpcpp -s media_library -S visualizer"
alias news="newsbeuter"
alias um="sudo umount /home/qeni/mnt"
alias pack="tar -zcvf"
alias rr="ranger"
# apt aliases
alias ai="sudo apt install"
alias as="apt search"
alias ash="apt show"
alias au="sudo apt update"
alias aug="sudo apt upgrade"
alias ap="sudo apt purge"
alias ar="sudo apt remove"
# pacman aliases
alias S="sudo pacman -S" # Install package
alias Ss="pacman -Ss" # Search packages
alias Sy="sudo pacman -Sy" # Synchronize the repository databases
alias Syu="sudo pacman -Syu" # Synchronize the repository databases and update the system's packages
alias Syyu="sudo pacman -Syyu" # Update all with forcing
alias Sc="sudo pacman -Sc" # Clear pacman cache
alias Qi="pacman -Qi" # Information about package
alias R="sudo pacman -R" # Remove package
alias Rs="sudo pacman -Rs" # Remove package with depedencies
alias Rns="sudo pacman -Rs" # Remove package with depedencies and config files
alias U="sudo pacman -U" # Upgrade package
alias V="pacman -V" # Version of pacman
# yaourt aliases
alias yS="yaourt -S" # Install package
alias ySs="yaourt -Ss" # Search packages
alias ySy="yaourt -Sy" # Synchronize the repository databases
alias ySyyu="yaourt -Syyu" # Update all with forcing
alias ySc="yaourt -Sc" # Clear pacman cache
alias yQi="yaourt -Qi" # Information about package
alias yR="yaourt -R" # Remove package
alias yRs="yaourt -Rs" # Remove package with depedencies
alias yRns="yaourt -Rs" # Remove package with depedencies and config files
alias yU="yaourt -U" # Upgrade package
alias yV="yaourt -V" # Version of yaourt
# git aliases
alias gs="git status -sb"
alias gd="git diff --word-diff --color"
alias ga="git add"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias gb="git branch"
alias gr="git reset" # e.g. git reset abc.txt
alias grc="git reset --hard HEAD~1" # git reset commit
alias gta="git tag -a -m"
# alias w="nmtui"
alias nm="sudo systemctl start NetworkManager.service"
alias yt="youtube-dl -c -f 22/43/18/best"
alias ytm="youtube-dl --extract-audio --audio-format mp3"
alias p="sudo proxychains"
alias bat='acpi | grep -o "[0-9]*%"'
alias scannet='nmap -sn 192.168.1.0/24'
# tmp aliases
# xrandr alias
alias hdmi1='xrandr --output HDMI1 --mode 1360x768 --right-of LVDS1'
alias vga1='xrandr --output VGA1 --mode 1024x768 --right-of LVDS1'
alias def='xrandr -s 0'

#copy and go to dir
cpg()
{
  if [[ -d "$2" ]]; then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

#move and go to dir
mvg()
{
  if [[ -d "$2" ]]; then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# Extract archives
extract()
{
  if [[ -f $1 ]]; then
    case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

neofetch --gtk2 off --gtk3 off --gpu_brand off --color_blocks off --cpu_temp on --memory_display infobar
