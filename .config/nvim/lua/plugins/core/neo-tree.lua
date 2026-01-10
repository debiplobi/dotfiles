return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
    },
    "MunifTanjim/nui.nvim",
  },

  keys = {
    { "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },

  opts = {
    window = {
      position = "left",
      width = 30,
    },

    filesystem = {
      use_trash = true,
      trash_command = "trash",
      use_libuv_file_watcher = true,

      commands = {
        delete = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local name = node.name or path

          local choice = vim.fn.confirm(
            "Are you sure you want to delete '" .. name .. "'?",
            "&Yes\n&No",
            2
          )

          if choice ~= 1 then
            return
          end

          vim.fn.system({ "trash", path })
          require("neo-tree.sources.manager").refresh(state.name)
        end,
      },
    },
  },

  config = function(_, opts)
    -- diagnostics signs (global, belongs in config)
    vim.diagnostic.config({
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError" },
          { name = "DiagnosticSignWarn",  text = "", texthl = "DiagnosticSignWarn"  },
          { name = "DiagnosticSignInfo",  text = "", texthl = "DiagnosticSignInfo"  },
          { name = "DiagnosticSignHint",  text = "󰌵", texthl = "DiagnosticSignHint"  },
        },
      },
    })

    require("neo-tree").setup(opts)
  end,
}
