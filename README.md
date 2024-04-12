### Prerequisites
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
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
  ```sh
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  # Install recommended powerlevel10k fonts
  # https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k
  # mv /font/downloaded/path/*ttf ~/.local/share/fonts
  # fc-cache -v -f
  ```
- [fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin)
  ```sh
  git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```
- [thefuck](https://github.com/nvbn/thefuck)
  ```sh
  sudo apt install python3-dev python3-pip python3-setuptools -y
  pip3 install thefuck --user
  sudo apt install thefuck -y
  ```
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/tree/master)
  ```sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/master)
  ```sh
  sudo apt install zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
- [fd](https://github.com/sharkdp/fd)
  ```sh
  sudo apt install fd-find -y
  git clone https://github.com/ptavares/zsh-exa.git ~/.oh-my-zsh/custom/plugins/zsh-exa
  ```
- [tmux](https://github.com/tmux/tmux)
  ```sh
  sudo apt install tmux -y
  ```
- [alacritty](https://alacritty.org/index.html)
  ```sh
  sudo add-apt-repository ppa:aslatter/ppa
  sudo apt update -y
  sudo apt install alacritty -y
  ```
  - [theme](https://github.com/alacritty/alacritty-theme?tab=readme-ov-file)
    ```sh
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
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
  echo "export PATH=$PATH:$HOME/nvim-linux64/bin" >> ~/.zshrc
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
### Getting started
```sh
sh -c "$HOME/dotfiles/setup.sh"
```
