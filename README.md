# Prerequisites
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  ```sh
  sudo apt update -y
  sudo apt install zsh -y
  chsh -s $(which zsh)
  ```
- [Oh My ZSH](https://ohmyz.sh/)
  ```sh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- [thefuck](https://github.com/nvbn/thefuck)
  ```sh
  sudo apt install python3-dev python3-pip python3-setuptools -y
  pip3 install thefuck --user
  sudo apt install thefuck -y
  ```
- [tmux](https://github.com/tmux/tmux)
  ```sh
  sudo apt install tmux -y
  ```
- [tpm](https://github.com/tmux-plugins/tpm)
  ```sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```
- [alacritty](https://alacritty.org/index.html)
  ```sh
  sudo add-apt-repository ppa:aslatter/ppa
  sudo apt update -y
  sudo apt install alacritty -y
  ```
  [alacritty default shortcut](https://alacritty.org/config-alacritty-bindings.html)
- [neovim](https://neovim.io/)
  ```sh
  curl -L -o nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar -vzxf nvim-linux64.tar.gz -C ~/.local/share/
  rm -r nvim-linux64.tar.gz
  ```
- [LunarVim](https://www.lunarvim.org/)
  ```sh
  # Prerequisites
  sudo apt install git build-essential python3-pip python3 npm nodejs ripgrep -y
  echo "export PATH=$PATH:$HOME/.local/share/nvim-linux64/bin" >> ~/.zshrc
  source ~/.zshrc
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  . "$HOME/.cargo/env"   
  # Optional Feature Prerequisites(lazygit)
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  rm -f lazygit lazygit.tar.gz

  # Install LunarVim
  LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
  ```
## Setup
```sh
mv ~/.zshrc ~/.zshrc.bak
stow */
```
