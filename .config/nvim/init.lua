if vim.g.vscode then
    -- VSCode Neovim
    require "user.vscode_keymaps"
else
    -- bootstrap lazy.nvim, LazyVim and your plugins
    require("config.lazy")
end