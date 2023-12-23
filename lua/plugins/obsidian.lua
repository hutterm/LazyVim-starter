return {

  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/ObsidianVault/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/ObsidianVault/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        cmd = "PasteImage",
        opts = {
          markdown = {
            dir_path = "Resources/Attachments",
            prompt_for_filename = false,
            template = "![[$FILE_NAME]]",
          },
        },
        keys = {
          -- suggested keymap
          { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
        },
      },
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/ObsidianVault",
        },
      },
    },
  },
}
