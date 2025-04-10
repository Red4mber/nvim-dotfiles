return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- TODO 
  },
  keys = {
    {
      "<leader>wk",
      function() require("which-key").show({}) end,
      desc = "All Keymaps",
    },
    {
      "<leader>wb",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps",
    },
  },
}
