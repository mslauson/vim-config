return {
  updater = {
    channel = "stable",
    remote = "origin",
    version = "latest",
    branch = "main",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = true,
    remotes = {
      -- easily add new remotes to track
      ["Mslauson User Config"] = "https://gitea.slauson.io/mslauson/astro-config.git",
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assumes user/AstroNvim.git
    },
  },
}
