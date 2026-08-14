# Searching in this Neovim configuration

There are several layers involved in "search," and their names are easy to
mix up. The shortest mental model is:

```text
LazyVim keymap
    -> picker or search/replace UI (Snacks or Grug Far)
        -> search engine (usually ripgrep)
            -> results point to real files on disk
```

Neovim itself also has built-in searches that do not need any of those tools.

## What is active in this configuration

| Component | What it is | Active here? | Main use |
|---|---|---:|---|
| Neovim | The editor | Yes | Edit buffers; search/replace inside a buffer |
| lazy.nvim | Plugin manager | Yes | Downloads and loads plugins; it is not a search tool |
| LazyVim | A configured Neovim distribution | Yes | Chooses plugins and provides keymaps such as `<Space>sg` |
| Snacks picker | Interactive picker UI | Yes | Find files, grep text, search buffers, commands, help, etc. |
| ripgrep (`rg`) | Fast command-line text search engine | Yes | Searches file contents; Snacks and Grug Far can invoke it |
| Grug Far | Project-wide search-and-replace UI | Yes | Preview and write replacements across files |
| Flash | In-window jump/search plugin | Yes | Jump quickly to visible text using labels |
| Telescope | Alternative picker UI/plugin | **No** | Could provide jobs similar to the Snacks picker |
| `fzf` | General-purpose command-line fuzzy selector | Installed | Filters a list interactively; not the active LazyVim picker |
| fzf-lua | Neovim picker built around fzf | No | Alternative to Snacks or Telescope |
| `grep` | Traditional command-line text search program | Yes | Searches file contents, but `rg` is generally faster and friendlier |

The Telescope declaration in `lua/plugins/example.lua` is not active. That
file returns an empty plugin specification near the top. In this version of
LazyVim, the default picker is Snacks. Seeing a floating list of matches does
not necessarily mean that Telescope is involved.

## The important distinction: engine versus interface

`rg` and `grep` are **search engines**. Given a pattern and paths, they print
matching lines. They work in a terminal and do not provide a Neovim picker.

Snacks, Telescope, and fzf-lua are **picker interfaces**. They display an
interactive list, let you narrow it, preview results, and open a selection.
For searching file contents, a picker will commonly run `rg` underneath.

`fzf` is slightly different: it is a generic **fuzzy list filter**. It selects
from items it is given. It does not recursively search file contents by
itself, although another command such as `rg` can feed results into it.

Grug Far is a specialized **search-and-replace interface**. It also uses a
search engine underneath, but unlike a normal picker it can modify matching
files.

## Common tasks in the current configuration

`<Space>` is the leader key.

| Task | Keys | Provided by |
|---|---|---|
| Find files from project root | `<Space>ff` | LazyVim mapping -> Snacks picker |
| Find files from current working directory | `<Space>fF` | LazyVim mapping -> Snacks picker |
| Find Git-tracked files | `<Space>fg` | LazyVim mapping -> Snacks picker |
| Search text from project root | `<Space>sg` | LazyVim mapping -> Snacks picker -> `rg` |
| Search text from current working directory | `<Space>sG` | LazyVim mapping -> Snacks picker -> `rg` |
| Search word under cursor or visual selection | `<Space>sw` | LazyVim mapping -> Snacks picker -> `rg` |
| Search open buffers | `<Space>sB` | LazyVim mapping -> Snacks picker |
| Search lines in current buffer | `<Space>sb` | LazyVim mapping -> Snacks picker |
| Project-wide search and replace | `<Space>sr` | LazyVim mapping -> Grug Far -> `rg` |
| Jump to visible text | `s` | Flash |
| Show relevant keymaps | start with `<Space>` and pause | which-key |

### Root directory versus current working directory

LazyVim often determines a **project root** from Git or project metadata. A
lowercase final key such as `<Space>ff` or `<Space>sg` searches that root.
The uppercase variants `<Space>fF` and `<Space>sG` use Neovim's current
working directory instead. Check the latter with:

```vim
:pwd
```

## Native Neovim searching

These work without LazyVim, Snacks, Telescope, fzf, or ripgrep.

### Search within the current buffer

| Keys | Meaning |
|---|---|
| `/text` | Search forward for `text` |
| `?text` | Search backward for `text` |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search forward for the word under the cursor |
| `#` | Search backward for the word under the cursor |

### Replace within the current buffer

```vim
:%s/prod-common/prod-sida/g
```

- `%` means every line in the current buffer.
- `s` means substitute.
- `g` means every match on each line, rather than only the first.
- Add `c` (`gc`) to confirm each replacement.
- Use `:w` afterward to write that buffer to its file.

Neovim also has native `:vimgrep`, `:grep`, quickfix lists, location lists,
and argument lists. They remain useful building blocks, but the configured
picker and Grug Far provide friendlier interfaces for most repository-wide
work.

## Project-wide replacement with Grug Far

1. Open Neovim in the repository and press `<Space>sr`.
2. Enter the search text and replacement text.
3. Review the result preview.
4. Press `Esc` to enter Normal mode.
5. Press `\r` (backslash, then `r`) to run **Replace**.
6. Close the Grug Far window with `\c` or `:q`.

The Replace action writes the changed files. The Grug Far window itself is a
temporary plugin buffer, not a file. Therefore `:wq` in that window produces:

```text
E382: Cannot write, 'buftype' option is set
```

That error does not mean the replacements failed. It means Neovim was asked
to write the UI buffer. Use `:q` to close that window. Press `g?` inside Grug
Far to display its available actions.

## Terminal equivalents

Search recursively with ripgrep:

```sh
rg 'prod-common'
```

List only matching filenames:

```sh
rg -l 'prod-common'
```

Traditional grep can do a similar recursive search:

```sh
grep -R 'prod-common' .
```

In normal development, prefer `rg`: it is fast, respects `.gitignore` by
default, and produces output that editor integrations understand well.

## A practical way to remember it

- Searching the current file: native Neovim `/`.
- Replacing in the current file: native Neovim `:s`.
- Finding a file: `<Space>ff`, shown by Snacks.
- Searching text across a repository: `<Space>sg`, shown by Snacks and powered
  by ripgrep.
- Replacing text across a repository: `<Space>sr`, handled by Grug Far and
  powered by ripgrep.
- lazy.nvim manages the plugins; LazyVim wires the whole experience together.
- Telescope and fzf-lua are alternative picker implementations, not additional
  steps required by the current setup.
