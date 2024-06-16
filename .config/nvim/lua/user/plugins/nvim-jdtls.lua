return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  -- config = function()
  --   local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  --   local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
  --   local config_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
  --   local config = {
  --     cmd = {
  --       "java",
  --       "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  --       "-Dosgi.bundles.defaultStartLevel=4",
  --       "-Declipse.product=org.eclipse.jdt.ls.core.product",
  --       "-Dlog.protocol=true",
  --       "-Dlog.level=ALL",
  --       "-Xmx1g",
  --       "--add-modules=ALL-SYSTEM",
  --       "--add-opens",
  --       "java.base/java.util=ALL-UNNAMED",
  --       "--add-opens",
  --       "java.base/java.lang=ALL-UNNAMED",
  --       "-jar",
  --       "/home/christina/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.1.6.700.v20231214-2017.jar",
  --       -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
  --       -- Must point to the                                                     Change this to
  --       -- eclipse.jdt.ls installation                                           the actual version

  --       -- 💀
  --       "-configuration",
  --       "/home/hydroakri/.local/share/nvim/mason/packages/jdtls/config_linux",
  --       -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
  --       -- Must point to the                      Change to one of `linux`, `win` or `mac`
  --       -- eclipse.jdt.ls installation            Depending on your system.

  --       -- 💀
  --       -- See `data directory configuration` section in the README
  --       "-data",
  --       workspace_dir,
  --     },

  --     -- 💀
  --     -- This is the default if not provided, you can remove it. Or adjust as needed.
  --     -- One dedicated LSP server & client will be started per unique root_dir
  --     root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
  --   }
  --   require("jdtls").start_or_attach(config)
  -- end
}
