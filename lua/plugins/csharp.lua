return {

  { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true },
  -- { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp", "xml" })
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.csharpier)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "csharpier")
      -- table.insert(opts.ensure_installed, "netcoredbg")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        csharp_ls = {
          root_dir = function(fname)
            local util = require("lspconfig/util")

            return util.root_pattern("*.sln")(fname)
              or util.root_pattern("*.csproj")(fname)
              or util.root_pattern("*.fsproj")(fname)
              or util.root_pattern(".git")(fname)
              or util.find_git_ancestor(fname)
              or util.path.dirname(fname)
          end,

          keys = {
            -- {
            --   "gd",
            --   function()
            --     require("omnisharp_extended").telescope_lsp_definitions()
            --   end,
            --   desc = "Goto Definition",
            -- },
            { "<leader>;", "mqA;<Esc>`q", desc = "; at end of line" },
          },
          --   handlers = {
          --     ["textDocument/definition"] = function(...)
          --       return require("omnisharp_extended").handler(...)
          --     end,
          --   },
        },
        -- omnisharp = {
        --   handlers = {
        --     ["textDocument/definition"] = function(...)
        --       return require("omnisharp_extended").handler(...)
        --     end,
        --   },
        --   keys = {
        --     {
        --       "gd",
        --       function()
        --         require("omnisharp_extended").telescope_lsp_definitions()
        --       end,
        --       desc = "Goto Definition",
        --     },
        --     { "<leader>;", "mqA;<Esc>`q", desc = "; at end of line" },
        --   },
        --   enable_roslyn_analyzers = true,
        --   organize_imports_on_format = true,
        --   enable_import_completion = true,
        -- },
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
    "Issafalcon/neotest-dotnet",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      opts.log_level = "debug"
      opts.adapters = {
        ["neotest-dotnet"] = {
          -- dotnet_additional_args = {
          --   "--verbosity detailed",
          -- },
          discovery_root = "solution",
        },
      }
    end,
  },
}
