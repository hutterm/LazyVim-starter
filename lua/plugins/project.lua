return {
  -- {
  --   "ahmedkhalf/project.nvim",
  --   opts = {
  --     silent_chdir = false,
  --     detection_methods = {
  --       "pattern",
  --       -- "lsp"
  --     },
  --     patterns = {
  --       ".sln",
  --       -- ".git",
  --       "_darcs",
  --       ".hg",
  --       ".bzr",
  --       ".svn",
  --       "Makefile",
  --       "package.json",
  --     },
  --   },
  -- },
  {
    "telescope.nvim",
    dependencies = {
      -- test https://github.com/GnikDroy/projections.nvim instead
      --
      {
        "coffebar/neovim-project",
        event = "VeryLazy",
        opts = {
          projects = { -- define project roots
            "~/source/Repos/*",
            "V:/Repos/*",
            "~/AppData/Local/nvim",
            "~/Documents/Visual Studio 2012/Projects/*",
            "~/ObsidianVault",
            -- "~/.config/*",
          },
        },
        keys = {
          { "<leader>fp", "<Cmd>Telescope neovim-project history<CR>", desc = "Projects" },
        },
        init = function()
          -- enable saving the state of plugins in the session
          vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = {
          { "nvim-lua/plenary.nvim" },
          { "Shatur/neovim-session-manager" },
        },
        priority = 100,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local button =
        { key = "p", icon = " ", desc = " Recent Projects", action = "Telescope neovim-project history" }
      button.key_format = "  %s"
      table.insert(opts.config.center, 4, button)
      local button2 = { key = "o", icon = " ", desc = " Projects", action = "Telescope neovim-project discover" }
      button2.key_format = "  %s"
      table.insert(opts.config.center, 5, button2)
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Recent Projects", ":Telescope neovim-project history <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
      local button2 = dashboard.button("o", " " .. " Projects", ":Telescope neovim-project discover <CR>")
      button2.opts.hl = "AlphaButtons"
      button2.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button2)
    end,
  },
}
