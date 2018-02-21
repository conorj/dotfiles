:

# add vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

declare -a FILES_TO_SYMLINK=(
.bashrc
.gitconfig
.gitignore
.shell_alias
.tmux.conf
.vimrc
.zshrc
)

dir_backup=~/dotfiles_old
tar_backup=$dir_backup/dotfiles.$(date +%Y%m%d%H%M%S).tar.bz2

echo -n "Creating $dir_backup for backup of any existing dotfiles in ~..."
mkdir -p $dir_backup

echo -n "Backing up existing dotfiles in ~/ to $tar_backup"
tar -cvjf $dir_backup/dotfiles.$(date +%Y%m%d%H%M%S).tar.bz2 ${FILES_TO_SYMLINK[@]}

for i in ${FILES_TO_SYMLINK[@]}; do
  echo "Symlinking $(pwd)/$i to ~/$i"
  ln -fs $(pwd)/$i ~/$i
done

unset FILES_TO_SYMLINK

# set up ZSH first so don't overwrite custom .zshrc with generic one
setUpZsh() {
  sudo dnf install zsh
  wget --no-check-certificate http://install.ohmyz.sh -O - | sh
  sudo dnf install util-linux-user -y
  chsh -s /usr/bin/zsh
}

# set up docker
setUpDocker() {
  # remove any old versions of docker
  sudo dnf remove docker docker-common docker-selinux docker-engine-selinux docker-engine

  # set up registry
  sudo dnf -y install dnf-plugins-core

  sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

  # install docker-ce
  sudo dnf install docker-ce

  # start docker
  sudo systemctl start docker

  # Optional - verify install
  sudo docker run hello-world
}

setUpZsh

setUpDocker
