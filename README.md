# MCOS Dotfiles

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Homebrew](https://brew.sh/). Configs follow the [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) layout under `~/.config`.

## Contents

| Package | Target | Description |
|---------|--------|-------------|
| `zsh/` | `~` | Shell startup (`.zshenv`, `.zprofile`, `.zshrc`) |
| `git/` | `~/.config/git` | Git config with per-host identity via `includeIf` |
| `mise/` | `~/.config/mise` | Runtime versions (Ruby, Node, Python) |
| `nvim/` | `~/.config/nvim` | [LazyVim](https://www.lazyvim.org/) Neovim setup |
| `starship/` | `~/.config/starship` | Minimal shell prompt (256-color, no Nerd Fonts) |
| `tmux/` | `~/.config/tmux` | Terminal multiplexer |
| `ssh/` | `~/.ssh` | SSH client config |
| `homebrew/` | — | `Brewfile` for system packages (not stowed) |

## Prerequisites

- macOS with Apple Silicon (`/opt/homebrew`)
- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/) (`brew install stow`)

## Setup

### 1. Clone the repo

```bash
git clone git@github.com:br3tts1r4/dotfile.git ~/Workshop/me/dotfile
cd ~/Workshop/me/dotfile
git checkout macos
```

### 2. Install packages

```bash
brew bundle --file=homebrew/Brewfile
```

### 3. Configure secrets and identity

These files are gitignored and must be created locally:

**Git identities** — copy the examples in `git/` and fill in your details:

```bash
cp git/gitdefault.example.inc git/gitdefault.inc
cp git/github.example.inc     git/github.inc
cp git/gitlab.example.inc     git/gitlab.inc
cp git/bitbucket.example.inc  git/bitbucket.inc
```

Edit each `.inc` file with your name, email, and optional GPG signing key. Git picks the right identity automatically based on `remote.origin.url` (GitHub, GitLab, or Bitbucket).

**SSH** — edit `ssh/.ssh/config` and replace `<HOST>` / `<KEY>` placeholders. The GitHub entry uses port 443 for networks that block port 22.

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

### 5. Install mise runtimes

```bash
mise install
```

Pinned versions (see `mise/config.toml`):

- Ruby `3.3.5`
- Node `24.17.0`
- Python `latest`

### 6. Set zsh as your login shell

```bash
chsh -s "$(brew --prefix)/bin/zsh"
```

Open a new terminal session for everything to take effect.

## Tooling overview

### Zsh

- **`.zshenv`** — XDG paths and Starship config/cache locations
- **`.zprofile`** — Homebrew and mise activation
- **`.zshrc`** — aliases (`vim` → `nvim`, colorized `ls`), Starship init

### Git

Shared settings in `git/config`: `nvim` as editor, rebase pulls, useful aliases (`lg`, `wip`, `pub`), and colored output. Per-host identity files are loaded via `includeIf` when a repo's `origin` URL matches.

### Neovim

LazyVim starter with local overrides in `nvim/lua/config/` and `nvim/lua/plugins/`. First launch downloads plugins automatically. See the [LazyVim docs](https://www.lazyvim.org/) for customization.

### Starship

Custom "Minimal Arc" prompt in `starship/starship.toml` — ASCII symbols, 256-color ANSI, language version modules for Python, Node, Ruby, Go, and Rust. A default upstream-style config is kept in `starship/starship.default.toml` for reference.

### tmux

256-color terminal, splits and new windows open in the current path, styled status bar with session/window info and clock.

## Branch layout

| Branch | Platform |
|--------|----------|
| `macos` | macOS (current) |
| `master` | Legacy / other configs |
