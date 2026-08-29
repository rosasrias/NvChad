dofile(vim.g.base46_cache .. "noice")

return {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",

    format = {
      cmdline = {
        pattern = "^:",
        icon = "",
        lang = "vim",
      },

      search_down = {
        kind = "search",
        pattern = "^/",
        icon = " ",
        lang = "regex",
      },

      search_up = {
        kind = "search",
        pattern = "^%?",
        icon = " ",
        lang = "regex",
      },

      filter = {
        pattern = "^:%s*!",
        icon = "$",
        lang = "bash",
      },

      lua = {
        pattern = {
          "^:%s*lua%s+",
          "^:%s*lua%s*=%s*",
          "^:%s*=%s*",
        },
        icon = "",
        lang = "lua",
      },

      help = {
        pattern = "^:%s*he?l?p?%s+",
        icon = "󰞋",
      },
    },
  },

  views = {
    cmdline_popup = {
      position = {
        row = "30%",
        col = "50%",
      },

      size = {
        width = "auto",
        min_width = 60,
        height = "auto",
      },

      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },

    hover = {
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },

      position = {
        row = 2,
        col = 2,
      },
    },
  },

  lsp = {
    progress = {
      enabled = false,
    },

    signature = {
      enabled = false,
    },

    hover = {
      enabled = false,
      silent = true,
    },

    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
  },

  presets = {
    lsp_doc_border = true,
    inc_rename = true,
  },

  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = {
        skip = true,
      },
    },

    {
      filter = {
        event = "msg_show",
        find = "%d+ matches",
      },
      view = "mini",
    },
  },
}
