local prefix = "<leader>x"
return {
  { "ggandor/lightspeed.nvim", event = "User AstroFile", dependencies = { "tpope/vim-repeat" } },
  {
    "nacro90/numb.nvim",
    event = "User AstroFile",
    config = function() require("numb").setup() end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { prefix,        desc = "Trouble" },
      { prefix .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { prefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { prefix .. "l", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
      { prefix .. "q", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    'DanielWeidinger/nvim-sshfs',
    event = "VeryLazy",
    config = function()
      require("sshfs").setup {
        mnt_base_dir = vim.fn.expand("$HOME") .. "/mnt",
        width = 0.6,    -- host window width
        height = 0.5,   -- host window height
        connection_icon = "✓", -- icon for connection indication
      }
    end
  }
}
