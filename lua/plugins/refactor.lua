return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<C-S-r>",
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      mode = { "n", "x" },
      desc = "refactor",
    },
    {
      "<leader>rm",
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = { "n", "x" },
      desc = "extract function",
    },
  },
  config = function()
    require("refactoring").setup()
    require("telescope").load_extension("refactoring")
  end,
}
