---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-k>"] = { "<Nop>", "Don't let me delete scrollback" },
    ["<leader>jr"] = {
      function()
        require("dap").repl.open()
      end,
      "open jdtls repl",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "debug continue",
    },
    ["<F7>"] = {
      function()
        require("dap").step_over()
      end,
      "debug step over",
    },
    ["<F8>"] = {
      function()
        require("dap").step_into()
      end,
      "debug step into",
    },
    ["<F9>"] = {
      function()
        require("dap").step_out()
      end,
      "debug step out",
    },
    ["<Leader>jb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "debug toggle break",
    },
    ["<Leader>jB"] = {
      function()
        require("dap").set_breakpoint()
      end,
      "debug set break",
    },
    ["<Leader>jh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "debug hover",
    },
    ["<Leader>jp"] = {
      function()
        require("dap.ui.widgets").preview()
      end,
      "debug preview",
    },
  },

  i = {
    ["<D-k>"] = { "<Nop>", "Don't let me delete scrollback" },
  },
  v = {
    ["<D-k>"] = { "<Nop>", "Don't let me delete scrollback" },
  },

  t = {
    ["<D-k>"] = { "<Nop>", "Don't let me delete scrollback" },
  },
}

M.harpoon = {
  n = {
    ["<leader>i"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "add mark",
    },
    ["<leader>u"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "harpoon menu",
    },
    ["<leader>k"] = {
      function()
        require("harpoon.mark").rm_file()
      end,
      "rm mark",
    },
    ["<leader>8"] = {
      function()
        require("harpoon.mark").clear_all()
      end,
      "clear marks",
    },
  },
}

M.nvterm = {
  n = {
    ["<leader>ft"] = {
      function()
        require("nvterm.terminal").new "float"
      end,
      "New floating terminal",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>m"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "open diagnostic",
    },
  },
}

M.nvimdappython = {
  n = {
    ["<leader>pd"] = {
      function()
        require("dap-python").test_method()
      end,
      "test method",
    },
    ["<leader>dc"] = {
      function()
        require("dap-python").test_class()
      end,
      "test class",
    },
  },
}

M.jdtls = {
  n = {
    ["<leader>jd"] = {
      function()
        require("jdtls").test_class()
      end,
      "test class",
    },
    ["<leader>jm"] = {
      function()
        require("jdtls").test_nearest_method()
      end,
      "test nearest method",
    },
  },
}

M.navbuddy = {
  n = {
    ["<leader>nb"] = {
      function()
        require("nvim-navbuddy").open()
      end,
      "open nav buddy window",
    },
  },
}

-- more keybinds!

return M
