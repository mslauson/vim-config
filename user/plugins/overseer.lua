return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {},
    config = function()
      local overseer = require("overseer")
      overseer.setup({
        strategy = {
          "toggleterm",
          direction = "horizontal",
          autoscroll = true,
          open_on_start = true,
          close_on_exit = true,
        },
        templates = { "builtin" }
      })

      -- overseer.new_task({
      --
      -- })
    end
  },
}
