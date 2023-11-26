return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    "BufReadPre D:/ObsidianVault/**.md",
    "BufNewFile D:/ObsidianVault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "D:/ObsidianVault",
      },
    },
  },
}
