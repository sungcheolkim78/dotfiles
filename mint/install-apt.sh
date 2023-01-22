# install scripts for ubuntu20.04 setup
# sungcheol.kim78@gmail.com
# version: 1.0.0

####################################################
# install cuda

distro=ubuntu2004
arch=x86_64
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt update
sudo apt install cuda
sudo reboot now

echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11/lib64:$LD_LIBRARY_PATH' >> ~/.zshrc

####################################################
# install cudnn
cd $HOME/Download
wget https://developer.nvidia.com/compute/cudnn/secure/8.4.1/local_installers/11.6/cudnn-local-repo-ubuntu2004-8.4.1.50_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-ubuntu2004-8.4.1.50_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2004-8.4.1.50/cudnn-local-E3EC4A60-keyring.gpg /usr/share/keyrings/
sudo apt install libcudnn8-dev

####################################################
# enable ssh
sudo apt install openssh-server
sudo systemctl enable ssh

sudo ufw allow ssh
sudo ufw enable
sudo ufw reload

####################################################
# install pyenv
sudo apt install -y \
    ca-certificates \
    gnupg \
    lsb-release \
	make \
	build-essential \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	wget \
	curl \
	llvm \
	libncurses5-dev \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libffi-dev \
	liblzma-dev \
	python-openssl \
    python-dev \
	git \
	tmux \
	neovim \
    nodejs \
    npm \
    xsel \
    gnome-tweaks \
    nfs-common \
    software-properties-common \
    apt-transport-https

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:/usr/local/cuda-11/bin:$PATH:$HOME/bin"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc

pyenv install 3.10.5
pyenv install 2.7.18
pyenv global 2.7.18 3.10.5

####################################################
# install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

####################################################
# install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
mkdir -p $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
pip2 install neovim
pip3 install neovim
touch $HOME/.vim_runtime/my_configs.vim

####################################################
# install nodejs
sudo npm install -g configurable-http-proxy

####################################################
# install docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

####################################################
# install nvidia docker
sudo apt update
sudo apt install nvidia-docker2
sudo systemctl restart docker
sudo docker run --rm --gpus all nvidia/cuda:11.6.3-base-ubuntu20.04 nvidia-smi

####################################################
# install jaxlib
mkdir -p $HOME/git_clone
cd $HOME/git_clone
git clone https://github.com/google/jax
cd jax
python3 build/build.py --enable_cuda --target_cpu_features native
pip3 install -e .

####################################################
# install noip update
cd $HOME/Downloads
wget https://www.noip.com/client/linux/noip-duc-linux.tar.gz
sudo mv noip-duc-linux.tar.gz /usr/local/src
cd /usr/local/src
sudo tar xzf noip-duc-linux.tar.gz
cd no-ip-2.1.9
sudo make -j8
sudo make install

####################################################
# install powerline fonts
sudo apt install fonts-powerline

####################################################
# install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

####################################################
# install noip2
sudo cp noip2.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start noip2
sudo systemctl status noip2
sudo systemctl enable noip2

