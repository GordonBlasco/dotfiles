return {
  -- add themes
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      --colorscheme = "gruvbox-material",
    },
  },
}
