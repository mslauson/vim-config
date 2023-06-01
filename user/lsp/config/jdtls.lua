--return function()
--
--    local capabilities = require("user.lsp.handlers").capabilities
--
--    local status, jdtls = pcall(require, "jdtls")
--    if not status then
--        return
--    end
--
--    local home = os.getenv("HOME")
--    local jdk8 = os.getenv("JAVA_HOME_8")
--    local jdk17 = os.getenv("JAVA_HOME_17")
--
--    -- get the current OS
--    if vim.fn.has("mac") == 1 then
--        WORKSPACE_PATH = home .. "/workspace/"
--        CONFIG = "mac"
--    elseif vim.fn.has("unix") == 1 then
--        WORKSPACE_PATH = home .. "/workspace/"
--        CONFIG = "linux"
--    else
--        print("Unsupported system")
--    end
--
--    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
--    local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
--    if root_dir == "" then
--        return
--    end
--
--
--    local extendedClientCapabilities = jdtls.extendedClientCapabilities
--    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
--
--    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
--
--    local workspace_dir = WORKSPACE_PATH .. project_name
--
--    local bundles = {}
--
--    -- get the mason install path
-- local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
--    vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
--    vim.list_extend(
--            bundles,
--            vim.split(
--                    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
--                    "\n"
--            )
--    )
--
--
--
--    return {
--        cmd = {
--
--            -- 💀
--            "java", -- or '/path/to/java11_or_newer/bin/java'
--            -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--            "-Dosgi.bundles.defaultStartLevel=4",
--            "-Declipse.product=org.eclipse.jdt.ls.core.product",
--            "-Dlog.protocol=true",
--            "-Dlog.level=ALL",
--            "-javaagent:" .. home .. "/installs/lombok.jar",
--            "-Xms1g",
--            "--add-modules=ALL-SYSTEM",
--            "--add-opens",
--            "java.base/java.util=ALL-UNNAMED",
--            "--add-opens",
--            "java.base/java.lang=ALL-UNNAMED",
--
--            -- 💀
--            "-jar",
--            vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
--            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--            -- Must point to the                                                     Change this to
--            -- eclipse.jdt.ls installation                                           the actual version
--
--            -- 💀
--            "-configuration",
--            home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
--            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--            -- Must point to the                      Change to one of `linux`, `win` or `mac`
--            -- eclipse.jdt.ls installation            Depending on your system.
--
--            -- 💀
--            -- See `data directory configuration` section in the README
--            "-data",
--            workspace_dir,
--        },
--        capabilities = capabilities,
--        root_dir = root_dir,
--        init_options = {
--            bundles = bundles,
--        },
--        settings = {
--            java = {
--                signatureHelp = {
--                    enabled = true,
--                },
--                eclipse = {
--                    downloadSources = true,
--                },
--                configuration = {
--
--                    updateBuildConfiguration = "interactive",
--                    {
--                        name = "JavaSE-1.8",
--                        path = jdk8,
--                    },
--                    {
--                        name = "JavaSE-17",
--                        path = jdk17,
--                    },
--                },
--            },
--            maven = {
--                autoUpdate = true,
--                downloadSources = true,
--            },
--            implementationsCodeLens = {
--                enabled = true,
--            },
--
--            referencesCodeLens = {
--                enabled = false,
--            },
--            references = {
--                includeDecompiledSources = false,
--            },
--            inlayHints = {
--                parameterNames = {
--                    enabled = "all", -- literals, all, none
--                },
--            },
--            completion = {
--                guessMethodArguments = true,
--                favoriteStaticMembers = {
--                    "java.util.Objects.requireNonNull",
--                    "java.util.Objects.requireNonNullElse",
--                    "org.assertj.core.api.Assertions.*",
--                    "org.hamcrest.CoreMatchers.*",
--                    "org.hamcrest.Matchers.*",
--                    "org.junit.jupiter.api.Assertions.*",
--                    "org.mockito.Mockito.*",
--                },
--            },
--            contentProvider = {
--                preferred = "fernflower",
--            },
--            extendedClientCapabilities = extendedClientCapabilities,
--            sources = {
--                organizeImports = {
--                    starThreshold = 9999,
--                    staticStartThreshold = 9999,
--                },
--            },
--            flags = {
--                allow_incremental_sync = true,
--            },
--        },
--
--    }
--end