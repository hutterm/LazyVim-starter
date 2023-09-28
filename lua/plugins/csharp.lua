return {
  -- {
  --   "williamboman/mason.nvim",
    -- opts = function(_, opts)
    --   if type(opts.ensure_installed) == "table" then
    --     vim.list_extend(opts.ensure_installed, { "netcoredbg" })
    --   end
    -- end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        omnisharp = {
          keys = {
            { "<leader>;", "mqA;<Esc>`q", desc = "; at end of line" },
          },
        },
        -- csharp_ls = {},
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "coreclr" },
    },
  },
  -- generate c# xml doc
  {
    "danymat/neogen",
    cmd = { "Neogen" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      languages = {
        cs = {
          template = {
            annotation_convention = "xmldoc",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(plugin, ...)
      plugin._.super.config(...)
      local dap = require("dap")
      dap.adapters.netcoredbg = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }
      require("dap.ext.vscode").load_launchjs(nil, { coreclr = { "cs" } })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      opts.adapters = {
        ["neotest-dotnet"] = {
          discovery_root = "solution",
        },
      }
    end,
  },
}
