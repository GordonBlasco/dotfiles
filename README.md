# Dotfiles for macOS and Linux

Trying to stick to the everforest theme as much as possible.

Keyboard layout: https://configure.zsa.io/voyager/layouts/Gq3P3/latest/0

## Install

These dotfiles are managed with [chezmoi](https://www.chezmoi.io/).

```sh
chezmoi init --apply GordonBlasco
```

For an existing checkout of this repository:

```sh
chezmoi apply --source "$HOME/dotfiles"
```

Chezmoi manages selected files inside `~/.config`; it does not manage the
directory itself. Application-owned state such as `~/.config/AWSVPNClient`
is therefore left alone.

Useful commands:

```sh
chezmoi diff
chezmoi apply
chezmoi update
```
