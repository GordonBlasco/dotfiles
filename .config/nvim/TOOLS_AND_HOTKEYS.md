# Neovim tools and primary hotkeys

This guide describes the plugins active in this configuration and the keys
most useful in everyday work. It reflects the resolved LazyVim configuration,
not merely directories present in the plugin download cache.

`<Leader>` is the Space key. `<LocalLeader>` is backslash (`\`). Key names are
case-sensitive: `<Leader>ff` and `<Leader>fF` are different commands.

## How to discover keys from inside Neovim

You do not need to memorize everything at once:

- Press `<Space>` and pause: which-key displays available leader commands.
- Press `<Space>?`: show mappings local to the current buffer.
- Press `<Space>sk`: open a searchable list of all keymaps.
- Run `:Lazy`: view installed plugins and their load state.
- Run `:Mason`, or press `<Space>cm`: view external language tools.
- In a Grug Far window, press `g?`: show Grug Far actions.

## Daily-use cheat sheet

### Files, buffers, and the explorer

| Keys | Action | Tool |
|---|---|---|
| `<Space>ff` | Find files from the project root | Snacks picker |
| `<Space>fF` | Find files from the current working directory | Snacks picker |
| `<Space>fg` | Find Git-tracked files | Snacks picker |
| `<Space>fr` | Open a recent file | Snacks picker |
| `<Space>fb` | Select an open buffer | Snacks picker |
| `<Space>,` | Select an open buffer | Snacks picker |
| `<Space>e` | Toggle file explorer at project root | Snacks explorer |
| `<Space>E` | Toggle file explorer at current directory | Snacks explorer |
| `[b` / `]b` | Previous / next buffer | LazyVim |
| `<Space>bp` | Pin or unpin current buffer | bufferline.nvim |
| `<Space>bd` | Delete current buffer | LazyVim/Snacks |

LazyVim normally detects the project root from Git or project metadata. Use
`:pwd` to see the current working directory.

### Search and replace

| Keys | Action | Tool |
|---|---|---|
| `/text` | Search forward in current buffer | Neovim |
| `?text` | Search backward in current buffer | Neovim |
| `n` / `N` | Next / previous match | Neovim |
| `*` / `#` | Search forward / backward for word under cursor | Neovim |
| `<Space>sg` | Grep text from project root | Snacks picker + ripgrep |
| `<Space>sG` | Grep text from current directory | Snacks picker + ripgrep |
| `<Space>sw` | Search word or visual selection from root | Snacks + ripgrep |
| `<Space>sb` | Search lines in current buffer | Snacks picker |
| `<Space>sB` | Grep all open buffers | Snacks picker |
| `<Space>sr` | Search and replace across files | Grug Far + ripgrep |
| `s` | Jump to visible text | Flash |
| `S` | Treesitter-aware jump | Flash |

Inside Grug Far, press `Esc` and then `\r` to execute **Replace**. This writes
the real files. Close the temporary UI with `\c` or `:q`; do not use `:wq` on
that plugin buffer.

For replacement only in the current file, native Neovim is often quickest:

```vim
:%s/old/new/gc
```

The `c` asks for confirmation. Remove it to replace without confirmation, and
then use `:w` to save the file.

### Editing and completion

| Keys | Action | Tool |
|---|---|---|
| `gcc` | Toggle comment on current line | ts-comments.nvim |
| `gc` after selecting text | Toggle comments on selection | ts-comments.nvim |
| `(`, `[`, `{`, quotes, etc. | Insert matching closing character | mini.pairs |
| `a` / `i` text objects | Additional around/inside text objects | mini.ai |
| `Up` / `Down` or `Ctrl-p` / `Ctrl-n` | Select previous / next completion | blink.cmp |
| `Enter` | Accept selected completion | blink.cmp |
| `Tab` / `Shift-Tab` | Move forward / backward through snippet positions | blink.cmp |
| `Ctrl-Space` | Open completion menu | blink.cmp |
| `Ctrl-e` | Hide completion menu | blink.cmp |
| `Ctrl-Space` in Normal/Visual mode | Expand Treesitter selection | Treesitter |
| `]n` / `[n` in Visual mode | Next / previous Treesitter node | Treesitter |

Completion keys vary with context; when no snippet jump is available, `Tab`
falls back to its normal behavior.

### Code intelligence, formatting, and diagnostics

These mappings become useful when an LSP server supports the current filetype.

| Keys | Action | Tool |
|---|---|---|
| `gd` | Go to definition | Neovim LSP + Snacks picker |
| `grr` | Find references | Neovim LSP + Snacks picker |
| `gri` | Go to implementation | Neovim LSP + Snacks picker |
| `grt` | Go to type definition | Neovim LSP + Snacks picker |
| `grn` | Rename symbol | Neovim LSP |
| `gra` | Code action | Neovim LSP |
| `K` | Show documentation/hover information | Neovim LSP |
| `<Space>cf` | Format buffer or selection | conform.nvim |
| `<Space>cd` | Show diagnostics for current line | Neovim diagnostics |
| `]d` / `[d` | Next / previous diagnostic | Neovim diagnostics |
| `]e` / `[e` | Next / previous error | LazyVim |
| `]w` / `[w` | Next / previous warning | LazyVim |
| `<Space>sd` | Search workspace diagnostics | Snacks picker |
| `<Space>sD` | Search current-buffer diagnostics | Snacks picker |
| `<Space>xx` | Toggle workspace diagnostics list | Trouble |
| `<Space>xX` | Toggle current-buffer diagnostics list | Trouble |
| `<Space>cs` | Toggle document symbols | Trouble |

The LSP client is built into Neovim. `nvim-lspconfig` supplies server
configurations, Mason installs external servers, and `mason-lspconfig.nvim`
connects the two. `nvim-lint` runs external linters. `conform.nvim` runs
formatters. These components cooperate but have different jobs.

### Git

| Keys | Action | Tool |
|---|---|---|
| `]h` / `[h` | Next / previous changed hunk | gitsigns.nvim |
| `<Space>ghp` | Preview hunk inline | gitsigns.nvim |
| `<Space>ghs` | Stage hunk | gitsigns.nvim |
| `<Space>ghr` | Reset hunk | gitsigns.nvim |
| `<Space>ghu` | Undo staged hunk | gitsigns.nvim |
| `<Space>ghb` | Blame current line | gitsigns.nvim |
| `<Space>ghd` | Diff current file | gitsigns.nvim |
| `<Space>gs` | Open Git status picker | Snacks |
| `<Space>gd` | Open Git diff picker | Snacks |

Some hunk mappings are buffer-local and appear only while editing a file in a
Git repository.

### Windows, tabs, sessions, and UI

| Keys | Action | Tool |
|---|---|---|
| `Ctrl-h/j/k/l` | Move to left/down/up/right window | LazyVim |
| `Ctrl-Up/Down/Left/Right` | Resize current window | LazyVim |
| `<Space>-` | Split below | LazyVim |
| `<Space>|` | Split right | LazyVim |
| `<Space>wd` | Delete current window | LazyVim |
| `<Space>qs` | Restore session for current directory | persistence.nvim |
| `<Space>ql` | Restore last session | persistence.nvim |
| `<Space>qd` | Stop saving current session | persistence.nvim |
| `<Space>un` | Dismiss notifications | Snacks |
| `<Space>sn` | Notification/Noice search group | noice.nvim |
| `<Space>uC` | Select colorscheme | Snacks picker |

## Active user-facing plugins

### Snacks (`snacks.nvim`)

A collection of small editor utilities. In this setup it provides the default
picker, file explorer, Git pickers, notifications, scratch buffers, and other
UI features. It is the component behind most `<Space>f...` and `<Space>s...`
lists. It frequently invokes ripgrep for file-content searches.

### Grug Far (`grug-far.nvim`)

Repository-wide search and replace. Open it with `<Space>sr`; run Replace with
`\r`. Its results window is a temporary buffer and cannot itself be written.

### Flash (`flash.nvim`)

Fast labeled jumps within visible text. Use `s` for a normal jump and `S` for
a syntax-tree-aware jump.

### blink.cmp and friendly-snippets

`blink.cmp` supplies the completion menu. `friendly-snippets` supplies a
library of common snippet templates. They appear automatically while typing.

### LSP and Mason

`nvim-lspconfig`, `mason.nvim`, and `mason-lspconfig.nvim` provide language
server integration and installation. They enable definitions, references,
renames, code actions, hover documentation, and diagnostics.

### Treesitter

`nvim-treesitter`, `nvim-treesitter-textobjects`, `nvim-ts-autotag`, and
`ts-comments.nvim` use parsed source structure for highlighting, selections,
text objects, automatic HTML-style tag updates, and comments.

### GitSigns (`gitsigns.nvim`)

Shows added, modified, and deleted lines in the sign column and provides hunk
actions such as preview, stage, reset, blame, and diff.

### Trouble (`trouble.nvim`)

Structured lists for diagnostics, symbols, references, quickfix entries, and
TODOs. Its primary family is `<Space>x...`.

### Formatting and linting

`conform.nvim` handles formatting (`<Space>cf`). `nvim-lint` invokes configured
linters and publishes their findings as Neovim diagnostics.

### Bufferline, lualine, and Noice

- `bufferline.nvim` displays and manages the buffer tabs across the top.
- `lualine.nvim` renders the status line.
- `noice.nvim` improves command-line, message, and notification presentation.

### TODO Comments (`todo-comments.nvim`)

Highlights annotations such as `TODO`, `FIXME`, and `HACK`.

| Keys | Action |
|---|---|
| `]t` / `[t` | Next / previous TODO comment |
| `<Space>st` | Search TODO comments |
| `<Space>xt` | Show TODO comments in Trouble |

### Persistence (`persistence.nvim`)

Saves and restores sessions, including open files and layout. Its main keys are
under `<Space>q...` as shown above.

### Appearance and small editing helpers

- `everforest-nvim` is the selected colorscheme.
- `tokyonight.nvim` and `catppuccin` are also installed as available themes.
- `mini.icons` supplies filetype and UI icons.
- `mini.ai` adds text objects.
- `mini.pairs` inserts matching delimiters.
- `which-key.nvim` displays available mappings after a prefix.

## Infrastructure plugins with few or no direct hotkeys

These are installed and active, but normally work behind the scenes:

| Plugin | Purpose |
|---|---|
| `lazy.nvim` | Plugin installation, loading, updates, and configuration |
| `LazyVim` | Distribution layer that assembles plugins and defaults |
| `plenary.nvim` | Shared Lua utility library used by plugins |
| `nui.nvim` | UI component library used by plugins |
| `lazydev.nvim` | Lua development metadata and completion for Neovim configs |
| `nvim-lspconfig` | Language-server configuration definitions |
| `mason-lspconfig.nvim` | Connects Mason-installed servers to LSP configuration |
| `nvim-treesitter-textobjects` | Syntax-aware movements and selections |
| `nvim-ts-autotag` | Updates paired HTML/XML-style tags |
| `friendly-snippets` | Snippet definitions consumed by completion |

## Tools that are not active plugins

- **Telescope** is not active. It is an alternative to the Snacks picker. Its
  only declaration in this dotfiles repository is in the disabled example
  plugin file.
- **fzf-lua** is not active. It is another picker alternative.
- The standalone **fzf** executable is installed, but it is not the configured
  Neovim picker.
- **ripgrep (`rg`)** is an external executable, not a Neovim plugin. Snacks and
  Grug Far use it as a fast search engine.
- **grep** is another external search executable. It remains available, but
  ripgrep is generally the preferred repository-search engine.

For a deeper explanation of search-related layers, see [SEARCHING.md](SEARCHING.md).
