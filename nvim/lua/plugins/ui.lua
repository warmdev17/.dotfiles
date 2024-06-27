return {
  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    optional = true,
    opts = {
      options = {
        icons_enabled = true,
        icon_only = true,
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { { "mode", icons_enabled = true, icon = "", separator = "" } },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
    },
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  --logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
  ██╗    ██╗ █████╗ ██████╗ ███╗   ███╗██████╗ ███████╗██╗   ██╗
  ██║    ██║██╔══██╗██╔══██╗████╗ ████║██╔══██╗██╔════╝██║   ██║
  ██║ █╗ ██║███████║██████╔╝██╔████╔██║██║  ██║█████╗  ██║   ██║
  ██║███╗██║██╔══██║██╔══██╗██║╚██╔╝██║██║  ██║██╔══╝  ╚██╗ ██╔╝
  ╚███╔███╔╝██║  ██║██║  ██║██║ ╚═╝ ██║██████╔╝███████╗ ╚████╔╝ 
   ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚══════╝  ╚═══╝  
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
