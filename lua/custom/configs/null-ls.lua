local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  b.formatting.black.with { filetypes = { "python" } },

  -- cpp
  b.formatting.clang_format.with{
    filetypes = { "cpp", "c", "cuda", "objc", "objcpp" },
    extra_args = { "-assume-filename=$FILENAME" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
