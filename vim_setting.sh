
# install necessity
sudo apt-get install vim curl
# install bundle
mkdir -p ~/.vim/bundle && \
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
