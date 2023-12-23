return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<C-Enter>",
      },
      layout = {
        position = "right", -- | top | left | right
        ratio = 0.4,
      },
    },
  },
  keys = {
    {
      "<C-Enter>",
      function()
        require("copilot.panel").open({ "right", 0.4 })
      end,
      "open copilot panel",
    },
    {
      "]]",
      function()
        require("copilot.panel").jump_next()
      end,
      "jump to next snippet",
    },
    {
      "[[",
      function()
        require("copilot.panel").jump_prev()
      end,
      "jump to previous snippet",
    },
  },
}
