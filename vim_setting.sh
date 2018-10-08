# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
# install molokai
git clone https://github.com/tomasr/molokai.git
# install nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git
# install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# install syntastic
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
# install tagbar
git clone https://github.com/majutsushi/tagbar.git
# install vim-airline
git clone https://github.com/vim-airline/vim-airline.git
# install vim-airline-themes
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
# install vim-devicons
git clone https://github.com/ryanoasis/vim-devicons.git
# install vim-easymotion
git clone https://github.com/easymotion/vim-easymotion.git
# install vim-gutentags
git clone https://github.com/ludovicchabant/vim-gutentags.git
# install vim-nerdtree-syntax-hightlight
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git
# install vim-nerdtree-tabs
git clone https://github.com/jistr/vim-nerdtree-tabs.git
# install youcompleteme
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
./install.py
# install ctags
sudo apt-get install ctags
# install font
cd ~/.vim
git clone https://github.com/artofrawr/powerline-fonts.git
