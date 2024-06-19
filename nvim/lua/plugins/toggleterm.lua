return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
      open_mapping = "<c-t>",
      start_in_insert = true,
      auto_scroll = true,
      shade_terminals = true,
      shell = "fish",
      float_opts = {
        border = "curved",
        title_pos = "left",
      },
    },
  },
}
