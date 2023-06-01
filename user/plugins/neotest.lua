--return {
--    { "nvim-neotest/neotest-go" },
--    { 'haydenmeade/neotest-jest'},
--    { 'sidlatau/neotest-dart' },
--    { 'marilari88/neotest-vitest' },
--    {
--        "nvim-neotest/neotest",
--        requires = {
--            "nvim-neotest/neotest-go",
--            'haydenmeade/neotest-jest',
--            'sidlatau/neotest-dart',
--            'marilari88/neotest-vitest',
--            "nvim-treesitter/nvim-treesitter",
--            "antoinemadec/FixCursorHold.nvim"
--            -- Your other test adapters here
--        },
--        config = function()
--            -- get neotest namespace (api call creates or returns namespace)
--            local neotest_ns = vim.api.nvim_create_namespace("neotest")
--            vim.diagnostic.config({
--                virtual_text = {
--                    format = function(diagnostic)
--                        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
--                        return message
--                    end,
--                },
--            }, neotest_ns)
--            require("neotest").setup({
--                -- your neotest config here
--                adapters = {
--                    require('neotest-dart') {
--                        command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
--                        -- Change it to `fvm flutter` if using FVM
--                        -- change it to `dart` for Dart only tests
--                        use_lsp = true       -- When set Flutter outline information is used when constructing test name.
--                    },
--                    require("neotest-go"),
--                    require('neotest-jest')({
--                        jestCommand = "npm test --",
--                        jestConfigFile = "custom.jest.config.ts",
--                        env = { CI = true },
--                        cwd = function(path)
--                            return vim.fn.getcwd()
--                        end,
--                    }),
--                    require('neotest-vitest') {
--                        command = 'vitest', -- Command being used to run tests. Defaults to `vtest`
--                        use_lsp = true
--                    },
--                },
--            })
--        end,
--    }
--
--}

return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-vim-test",
    {
      "folke/neodev.nvim",
      config = function()
        require("neodev").setup {
          library = { plugins = { "neotest" }, types = true },
        }
      end,
    },

    "sidlatau/neotest-dart",
    "marilari88/neotest-vitest",
    "vim-test/vim-test",
  },
  opts = function()
    return {
      consumers = {
        overseer = require "neotest.consumers.overseer",
      },
      -- overseer = {
      --   enabled = true,
      --   force_default = false,
      -- },
      adapters = {
        require "neotest-dart" {
          command = "flutter", -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
        },
        require "neotest-go",
        require "neotest-vim-test" { allow_file_types = { "java" } },
        require "neotest-jest" {
          jestCommand = "npm test --",
          env = { CI = true },
          cwd = function(_) return vim.fn.getcwd() end,
        },
        require "neotest-vitest" {
          command = "vitest", -- Command being used to run tests. Defaults to `vtest`
          use_lsp = true,
        },
      },
    }
  end,
}
