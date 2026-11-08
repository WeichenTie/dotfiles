# dotfiles

Sway on Fedora. Should also work on Arch and Ubuntu 24.04/26.04.

## Setup

```sh
cd ~/dotfiles
stow -n -v -t ~ sway waybar rofi kitty mise kanshi dunst nvim tmux zsh xdg thunar   # dry run
stow -v -t ~ sway waybar rofi kitty mise kanshi dunst nvim tmux zsh xdg thunar
stow -v --no-folding -t ~ bin
```

If stow complains about a conflict, move the existing file and rerun. Never
use `--adopt`.

## Packages

Arch:

```sh
sudo pacman -S sway swaylock swayidle kanshi brightnessctl playerctl \
    libpulse pavucontrol dunst libnotify lxqt-policykit xdg-user-dirs \
    waybar power-profiles-daemon rofi kitty \
    ttf-jetbrains-mono-nerd grim slurp sway-contrib jq satty imv imagemagick \
    wl-clipboard wf-recorder python-gobject python-cairo gtk-layer-shell \
    zsh zoxide mise stow git tmux neovim gcc make unzip curl tree-sitter-cli \
    thunar mpv xarchiver
```

Fedora:

```sh
sudo dnf copr enable jdxcode/mise
sudo dnf copr enable mineiro/hyprland   # satty
sudo dnf install sway sway-systemd swaylock swayidle kanshi brightnessctl \
    playerctl pulseaudio-utils pavucontrol dunst libnotify lxqt-policykit \
    xdg-user-dirs waybar rofi kitty grim slurp grimshot jq satty imv \
    ImageMagick wl-clipboard wf-recorder python3-gobject python3-cairo \
    gtk-layer-shell \
    zsh zoxide mise stow git tmux neovim python3-neovim \
    gcc make unzip curl tree-sitter-cli Thunar mpv xarchiver
```

Ubuntu 24.04 / 26.04:

```sh
sudo apt install -y extrepo
sudo extrepo enable mise
sudo apt update
sudo apt install sway swaylock swayidle kanshi brightnessctl playerctl \
    pulseaudio-utils pavucontrol dunst libnotify-bin lxqt-policykit \
    xdg-user-dirs waybar power-profiles-daemon rofi kitty grim slurp \
    grimshot jq imv imagemagick wl-clipboard wf-recorder python3-gi \
    python3-gi-cairo gir1.2-gtklayershell-0.1 zsh zoxide mise stow git tmux \
    build-essential unzip curl thunar mpv xarchiver
```

Ubuntu's neovim and tree-sitter are too old for the nvim plugins, so get them
from upstream:

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

mkdir -p ~/.local/bin
curl -L https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz \
    | gunzip > ~/.local/bin/tree-sitter && chmod +x ~/.local/bin/tree-sitter
```

And [satty](https://github.com/gabm/Satty/releases) (the binary, not the
Flatpak).

On 24.04 waybar is older: no power profile module and the temperature may
show a different sensor. rofi runs through XWayland. Everything else works.

Nerd Font, if your distro doesn't package it:

```sh
mkdir -p ~/.local/share/fonts/JetBrainsMono && cd $_
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar xf JetBrainsMono.tar.xz && rm JetBrainsMono.tar.xz
fc-cache -f
```

oh-my-zsh and plugins (move the `.zshrc` it creates before stowing):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then `mise install` before opening nvim, since mason needs its npm.

tmux plugins aren't in the repo. Get tpm, then press prefix + I in tmux:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Notes

- Fedora-only bits in the sway config skip themselves on other distros.
- Wallpaper: put `wallpaper.png` or `wallpaper.jpg` in
  `sway/.config/sway/wallpapers/`. Without one you get Fedora's default or a
  plain background.
- kanshi profiles are for my monitors. Elsewhere they just don't match.
- tmux prefix is Ctrl+A.
- Default apps are in `xdg/.config/mimeapps.list`: Thunar for folders, nvim
  for text, imv for images, mpv for video, Firefox for links and PDFs.
  `xdg-mime default` overwrites the symlink with a plain file, so edit that
  file instead.

## Keys

| | |
| --- | --- |
| Super+Enter | kitty |
| Super+D | rofi (apps) |
| Super+Shift+D | rofi (any command) |
| Super+P | freeze screen, pick region, draw in satty |
| Super+Shift+P | screenshot window |
| Super+Ctrl+P | screenshot monitor |
| Super+O | record region (again to stop) |
| Super+Shift+O | record monitor (again to stop) |

Screenshots go to `~/Pictures`, recordings to `~/Videos`.

## Links

[sway](https://swaywm.org) ·
[waybar](https://github.com/Alexays/Waybar) ·
[rofi](https://github.com/davatorium/rofi) ·
[kitty](https://sw.kovidgoyal.net/kitty/) ·
[kanshi](https://gitlab.freedesktop.org/emersion/kanshi) ·
[dunst](https://dunst-project.org) ·
[grim](https://gitlab.freedesktop.org/emersion/grim) ·
[slurp](https://github.com/emersion/slurp) ·
[grimshot](https://github.com/OctopusET/sway-contrib) ·
[satty](https://github.com/gabm/Satty) ·
[imv](https://sr.ht/~exec64/imv/) ·
[wf-recorder](https://github.com/ammen99/wf-recorder) ·
[Nerd Fonts](https://www.nerdfonts.com) ·
[zoxide](https://github.com/ajeetdsouza/zoxide) ·
[mise](https://mise.jdx.dev) ·
[tmux](https://github.com/tmux/tmux) ·
[tpm](https://github.com/tmux-plugins/tpm) ·
[neovim](https://neovim.io) ·
[stow](https://www.gnu.org/software/stow/)
