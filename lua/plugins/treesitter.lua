return {
  {
    -- add more treesitter parsers
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "tsx",
        "vim",
      },
    },
  },
}
