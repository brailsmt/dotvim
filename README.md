This is the contents of my .vim directory.  I have left it almost entirely unmanaged for years.  Time to fix that.

== INSTALLATION
Add a symlink from the clone of this reposoitory to ~/.vim/
Add a symlink from .vimrc in the cloned repo to ~/.vimrc
Add a symlink from .gvimrc in the cloned repo to ~/.gvimrc
```sh
cd ~
git clone https://github.com/brailsmt/dotvim.git ~/dev/dotvim
ln -s ~/dev/dotvim ~/.vim
for rc in ~/.vim/.*vimrc; do
    ln -s $rc ~/$(basename $rc)
done
```
