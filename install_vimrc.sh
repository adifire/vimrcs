cd ~/.vim_runtime
mkdir -p temp_dirs/undodir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/first.vim
' > ~/.vimrc

echo 'source ~/.vim_runtime/tmux.conf' > ~/.tmux.conf
