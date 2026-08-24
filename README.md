# Arch Linux Dotfiles

Personal dotfiles for Arch Linux, managed with GNU Stow and Pacman. Configs follow the XDG Base Directory layout under `~/.config`.

## Contents

| Package | Target | Description |
| :--- | :--- | :--- |
| `zsh` | `~` | Shell startup (`.zshenv`, `.zprofile`, `.zshrc`) |
| `git` | `~/.config/git` | Git config with per-host identity via `includeIf` |
| `mise` | `~/.config/mise` | Runtime versions (Ruby, Node, Python) |
| `nvim` | `~/.config/nvim` | LazyVim Neovim setup |
| `starship` | `~/.config/starship` | Minimal shell prompt (256-color, no Nerd Fonts) |
| `tmux` | `~/.config/tmux` | Terminal multiplexer |
| `ssh` | `~/.ssh` | SSH client config |
| `pacman` | — | Package lists and installation manifests (not stowed) |

## Prerequisites

- Arch Linux
- GNU Stow (`sudo pacman -S stow`)

## Setup

### 1. Clone the repo

```bash
git clone git@github.com:br3tts1r4/dotfile.git ~/Workshop/me/dotfile
cd ~/Workshop/me/dotfile
git checkout arch
```

### 2. Install packages

```bash
sudo pacman -Syu --needed - < pacman/pkglist.txt
```

### 3. Configure secrets and identity

These files are gitignored and must be created locally:

- **Git identities** — copy the examples in `git/` and fill in your details:
  ```bash
  cp git/gitdefault.example.inc git/gitdefault.inc
  cp git/github.example.inc     git/github.inc
  cp git/gitlab.example.inc     git/gitlab.inc
  cp git/bitbucket.example.inc  git/bitbucket.inc
  ```
  Edit each `.inc` file with your name, email, and optional GPG signing key. Git picks the right identity automatically based on `remote.origin.url` (GitHub, GitLab, or Bitbucket).

- **SSH** — edit `ssh/.ssh/config` and replace `<HOST>` / `<KEY>` placeholders. The GitHub entry uses port 443 for networks that block port 22.

### 4. Symlink configs with Stow

From the repo root:

```bash
stow -t ~/.config git mise nvim starship tmux
stow -t ~ zsh ssh
```

To remove symlinks later:

```bash
stow -D -t ~/.config git mise nvim starship tmux
stow -D -t ~ zsh ssh
```

### 5. Install `mise` runtimes

```bash
mise install
```

Pinned versions (see `mise/config.toml`):
- Ruby `3.3.5`
- Node `24.17.0`
- Python `latest`

### 6. Set `zsh` as your login shell

```bash
chsh -s "$(which zsh)"
```

Open a new terminal session for everything to take effect.

## Tooling Overview

### Zsh
- `.zshenv` — XDG paths and Starship config/cache locations
- `.zprofile` — Path exports and `mise` activation
- `.zshrc` — Aliases (`vim` → `nvim`, colorized `ls`), Starship init
