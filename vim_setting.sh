
# install necessity
sudo apt-get install vim vim-gtk curl
mkdir -p ~/.vim/undodir
# install bundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install youcompleteme
sudo apt-get install build-essential cmake
sudo apt-get install python3-dev
cd ~/.vim/plugged
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
./install.py
# install ctags
sudo apt-get install exuberant-ctags
# install font
cd ~/.vim
git clone https://github.com/artofrawr/powerline-fonts.git
