# Dotfiles for macOS and Linux

Trying to stick to the everforest theme as much as possible.

Keyboard layout: [Custom ZSA Voyager](https://configure.zsa.io/voyager/layouts/Gq3P3/latest/0)

## Install

These dotfiles are managed with [chezmoi](https://www.chezmoi.io/).

```s
chezmoi init --apply GordonBlasco
```

Workflow:

```sh
chezmoi diff
chezmoi apply
chezmoi update
```
