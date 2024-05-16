local utils = require "core.utils"

local chad_on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  client.server_capabilities.documentOnTypeFormattingProvider = nil

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local chad_capabilities = vim.lsp.protocol.make_client_capabilities()

chad_capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local bundles = {
  vim.fn.glob(
    "/Users/georgegranberry/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",
    1
  ),
}
-- vim.list_extend(
--   bundles,
--   vim.split(vim.fn.glob("/Users/georgegranberry/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n")
-- )

local config = {
  cmd = {
    "/Users/georgegranberry/.local/share/nvim/mason/bin/jdtls",
    "-Declipse.application-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    "/Users/georgegranberry/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/Users/georgegranberry/share/nvim/mason/share/jdtls/config_mac",
  },

  settings = {
    java = {
      format = {
        enabled = false,
      },
    },
  },

   root_dir = require("jdtls.setup").find_root { ".git", "build.xml" },

  on_attach = function(client, bufnr)
    chad_on_attach(client, bufnr)
    -- require("null-ls").setup()
    -- print(vim.inspect(client))
    require("jdtls").setup_dap { hotcodereplace = "auto" }
  end,

  capabilities = chad_capabilities,

  init_options = {
    bundles = bundles,
  },
}
require("jdtls").start_or_attach(config)
