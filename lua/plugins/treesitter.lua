return {
  {
    -- add more treesitter parsers
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "lua",
        "regex",
        "tsx",
        "vim",
      },
    },
  },
}
