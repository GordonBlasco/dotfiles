return {
  {
    "shortcuts/no-neck-pain.nvim",
    cmd = "NoNeckPain",
    keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
    opts = {},
    event = "VimEnter",
    config = function(_, opts)
      require("no-neck-pain").setup(opts)
      require("no-neck-pain").enable()
    end,
  },
}
