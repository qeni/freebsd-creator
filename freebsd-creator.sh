#!/usr/local/bin/bash

cecho() {
  local code="\033["
  case "$1" in
    black  | bk) color="${code}0;30m";;
    red    |  r) color="${code}1;31m";;
    green  |  g) color="${code}1;32m";;
    yellow |  y) color="${code}1;33m";;
    blue   |  b) color="${code}1;34m";;
    purple |  p) color="${code}1;35m";;
    cyan   |  c) color="${code}1;36m";;
    gray   | gr) color="${code}0;37m";;
    *) local text="$1"
  esac
  [ -z "$text" ] && local text="$color$2${code}0m"
  printf "$text"
}

# /etc/rc.conf
# visudo
cecho r "Copying :: rc.conf\n"
sudo cp src/rc.conf /etc/rc.conf

cecho g "Creating dirs :: /home/qeni\n"
mkdir -p /home/qeni/repo
mkdir -p /home/qeni/tmp
mkdir -p /home/qeni/src
mkdir -p /home/qeni/music
mkdir -p /home/qeni/movies
mkdir -p /home/qeni/mountpoint
mkdir -p /home/qeni/pictures/screenshots

cecho r "Updating :: pkg\n"

cecho r "Installing :: \n"
sudo pkg install xorg i3 i3lock i3status dmenu vlc firefox gimp feh xterm htop inconsolata-ttf xcalib links scrot newsbeuter mc rtorrent zsh vim cmake python3 python curl ctags inconsolata-ttf terminus-ttf wget texmaker texlive-base wifimgr nethack

cecho r "Installing :: youtube-dl\n"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

cecho g "Modyfying :: i3\n"
mkdir -p /home/qeni/.i3
mkdir -p /home/qeni/pictures/screenshots
cp src/i3/hide.i3status.conf /home/qeni/.i3status.conf
cp src/i3/config /home/qeni/.i3/config
cp src/wallpapers/freebsd_wallpaper.png /home/qeni/.i3/wallpaper.png
cp src/xinit/hide.xinitrc /home/qeni/.xinitrc

cecho g "Modyfying :: git\n"
cp src/git/hide.gitconfig /home/qeni/.gitconfig

cecho g "Modyfying :: links\n"
mkdir -p /home/qeni/.links2
cp src/links/* /home/qeni/.links2/

cecho g "Modyfying :: newsbeuter\n"
mkdir -p /home/qeni/.config/newsbeuter
cp src/newsbeuter/urls /home/qeni/.config/newsbeuter/urls
cp src/newsbeuter/config /home/qeni/.config/newsbeuter/config

cecho g "Modyfying :: mc\n"
mkdir -p /home/qeni/.config/mc
mkdir -p /home/qeni/.local/share/mc/skins
cp src/midnight-commander/mc.ext /home/qeni/.config/mc/mc.ext
cp src/midnight-commander/ini /home/qeni/.config/mc/ini
cp src/midnight-commander/*.ini /home/qeni/.local/share/mc/skins/

cecho g "Modyfying :: rtorrent\n"
mkdir -p /home/qeni/.rtorrent
cp src/rtorrent/hide.rtorrent.rc /home/qeni/.rtorrent.rc

cecho g "Modyfying :: zsh\n"
cp src/zsh/hide.zshrc /home/qeni/.zshrc
chsh -s /usr/local/bin/zsh qeni

cecho g "Modyfying :: xterm\n"
cp src/xterm/hide.Xresources /home/qeni/.Xresources
xrdb -merge /home/qeni/.Xresources 

cecho g "Modyfying :: nethack\n"
cp src/nethack/hide.nethackrc/home/qeni/.nethackrc

cecho g "Copying :: scripts\n"


cecho g "Modyfying :: vim\n"
# Making dirs
mkdir -p /home/qeni/.vim/autoload
mkdir -p /home/qeni/.vim/bundle 
mkdir -p /home/qeni/.vim/colors

# Pathogen
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Nerdtree
cd /home/qeni/.vim/bundle && \
git clone https://github.com/scrooloose/nerdtree.git

# Syntastic
cd /home/qeni/.vim/bundle && \
git clone https://github.com/scrooloose/syntastic.git

# Tagbar
cd /home/qeni/.vim/bundle && \
git clone https://github.com/majutsushi/tagbar

# Auto-pairs
cd /home/qeni/.vim/bundle && \
git clone git://github.com/jiangmiao/auto-pairs.git

# Neosnippet
# cd /home/qeni/.vim/bundle
# git clone https://github.com/Shougo/neosnippet.vim
# git clone https://github.com/Shougo/neosnippet-snippets
# cp src/vim/python.snip /home/qeni/.vim/bundle/neosnippet-snippets/neosnippets/python.snip

# Vim-commentary
cd /home/qeni/.vim/bundle
git clone https://github.com/tpope/vim-commentary.git

# Themes
cp src/vim/colors/*.vim /home/qeni/.vim/colors/

# undotree
cd /home/qeni/.vim/bundle && \
git clone https://github.com/mbbill/undotree

# neocomplete
cd /home/qeni/.vim/bundle/
git clone https://github.com/Shougo/neocomplete.vim

# Copying .vimrc
cp src/vim/hide.vimrc /home/qeni/.vimrc
cp src/vim/hide.gvimrc /home/qeni/.gvimrc
cp src/vim/hide.vimrc-minimal /home/qeni/.vimrc-minimal

# Copying NERDTree bookmarks
cp src/vim/hide.NERDTreeBookmarks /home/qeni/.NERDTreeBookmarks
