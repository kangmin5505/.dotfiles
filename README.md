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
- stow
  ```sh
  sudo apt install stow -y
  ```
- [fzf](https://github.com/junegunn/fzf)
  ```sh
  sudo apt install fzf -y
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

## Setup
```sh
mv ~/.zshrc ~/.zshrc.bak
stow */
```
