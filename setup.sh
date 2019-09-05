!/bin/bash

ln -s .bash_completion ~/.bash_completion
ln -s .bash_profile ~/.bash_profile
ln -s .bashrc ~/.bashrc
ln -s .fzf.bash ~/.fzf.bash
ln -s .git ~/.git
ln -s .gitconfig ~/.gitconfig
ln -s .vimrc ~/.vimrc

echo "Changing your default shell to a newer version of bash. You will be prompted for your macOS password twice."

sudo sh -c "echo /usr/local/bin/bash >> /etc/shells"
chsh -s /usr/local/bin/bash

echo "Done! Start a new shell for settings to take effect."
