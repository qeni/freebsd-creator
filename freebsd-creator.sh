#!/usr/local/bin/bash

repo="/home/qeni/repo/freebsd-creator"
home="/home/qeni"

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
sudo cp $repo/src/rc.conf /etc/rc.conf

cecho g "Creating dirs :: /$repo\n"
mkdir -p $home/repo
mkdir $home/tmp
mkdir $home/src
mkdir $home/music
mkdir $home/movies
mkdir $home/mnt
mkdir -p $home/pictures/screenshots

cecho r "Updating :: pkg\n"

cecho r "Installing :: \n"
sudo pkg install xorg \
# i3 i3lock i3status dmenu \
awesome rofi \
vlc firefox gimp feh xterm htop inconsolata-ttf xcalib links scrot newsbeuter mc rtorrent zsh vim cmake python3 python curl ctags inconsolata-ttf terminus-ttf wget texmaker texlive-base wifimgr nethack36

cecho r "Installing :: youtube-dl\n"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

cecho g "Modyfying :: i3\n"
# mkdir $home/.i3
# cp $repo/src/i3/hide.i3status.conf $home/.i3status.conf
# cp $repo/src/i3/config $home/.i3/config
# cp $repo/src/wallpapers/freebsd_wallpaper.png $home/.i3/wallpaper.png
# cp $repo/src/xinit/hide.xinitrc $home/.xinitrc

cecho g "Modyfying :: awesome\n"
cp -R $repo/src/awesome $home/.config/awesome

cecho g "Modyfying :: git\n"
cp $repo/src/git/hide.gitconfig /$repo/.gitconfig

cecho g "Modyfying :: links\n"
mkdir -p $home/.links2
cp $repo/src/links/* $home/.links2/

cecho g "Modyfying :: newsbeuter\n"
mkdir -p $home/.config/newsbeuter
cp $repo/src/newsbeuter/urls $home/.config/newsbeuter/urls
cp $repo/src/newsbeuter/config $home/.config/newsbeuter/config

cecho g "Modyfying :: mc\n"
mkdir -p $home/.config/mc
mkdir -p $home/.local/share/mc/skins
cp $repo/src/midnight-commander/mc.ext $home/.config/mc/mc.ext
cp $repo/src/midnight-commander/ini $home/.config/mc/ini
cp $repo/src/midnight-commander/*.ini $home/.local/share/mc/skins/

cecho g "Modyfying :: rtorrent\n"
mkdir -p $home/.rtorrent
cp $repo/src/rtorrent/hide.rtorrent.rc $home/.rtorrent.rc

cecho g "Modyfying :: zsh\n"
cp $repo/src/zsh/hide.zshrc $home/.zshrc
chsh -s /usr/local/bin/zsh qeni

cecho g "Modyfying :: xterm\n"
cp $repo/src/xterm/hide.Xresources $home/.Xresources
xrdb -merge $home/.Xresources 

cecho g "Modyfying :: nethack\n"
cp $repo/src/nethack/hide.nethackrc $home/.nethackrc

cecho g "Copying :: scripts\n"


cecho g "Modyfying :: vim\n"
mkdir -p $home/.vim/autoload
mkdir $home/.vim/bundle 
mkdir $home/.vim/colors

# Pathogen
curl -LSso $home/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Nerdtree
cd $home/.vim/bundle && \
git clone https://github.com/scrooloose/nerdtree.git

# Syntastic
cd $home/.vim/bundle && \
git clone https://github.com/scrooloose/syntastic.git

# Tagbar
cd $home/.vim/bundle && \
git clone https://github.com/majutsushi/tagbar

# Auto-pairs
cd $home/.vim/bundle && \
git clone git://github.com/jiangmiao/auto-pairs.git

# Neosnippet
# cd $home/.vim/bundle && \
# git clone https://github.com/Shougo/neosnippet.vim
# git clone https://github.com/Shougo/neosnippet-snippets
# cp src/vim/python.snip /$repo/.vim/bundle/neosnippet-snippets/neosnippets/python.snip

# Vim-commentary
cd $home/.vim/bundle && \
git clone https://github.com/tpope/vim-commentary.git

# Themes
cp $repo/src/vim/colors/*.vim $home/.vim/colors/

# undotree
cd $home/.vim/bundle && \
git clone https://github.com/mbbill/undotree

# neocomplete
cd $home/.vim/bundle && \
git clone https://github.com/Shougo/neocomplete.vim

# Copying .vimrc
cp /$repo/repo/freebsd-creator/src/vim/hide.vimrc /$repo/.vimrc
cp /$repo/repo/freebsd-creator/src/vim/hide.gvimrc /$repo/.gvimrc
cp /$repo/repo/freebsd-creator/src/vim/hide.vimrc-minimal /$repo/.vimrc-minimal

# Copying NERDTree bookmarks
cp /$repo/repo/freebsd-creator/src/vim/hide.NERDTreeBookmarks /$repo/.NERDTreeBookmarks
