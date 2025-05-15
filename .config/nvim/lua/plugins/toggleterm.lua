-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<space>tt]],
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
  },
}
