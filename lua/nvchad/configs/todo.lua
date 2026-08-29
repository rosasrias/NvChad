dofile(vim.g.base46_cache .. "todo")

return {
  signs = true,
  sign_priority = 8,

  gui_style = {
    fg = "NONE",
    bg = "NONE",
  },

  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },

    TODO = {
      icon = " ",
      color = "info",
    },

    HACK = {
      icon = " ",
      color = "warning",
    },

    WARN = {
      icon = " ",
      color = "warning",
      alt = { "WARNING", "XXX" },
    },

    PERF = {
      icon = " ",
      color = "default",
      alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
    },

    NOTE = {
      icon = " ",
      color = "hint",
      alt = { "INFO" },
    },

    TEST = {
      icon = "󰙨 ",
      color = "test",
      alt = { "TESTING", "PASSED", "FAILED" },
    },
  },

  highlight = {
    multiline = true,
    multiline_pattern = "^.",
    multiline_context = 10,
    keyword = "wide_bg",
    after = "fg",
    comments_only = true,
    max_line_len = 400,

    exclude = {
      "gitcommit",
      "help",
      "markdown",
    },
  },

  colors = {
    error = { "DiagnosticError" },
    warning = { "DiagnosticWarn" },
    info = { "DiagnosticInfo" },
    hint = { "DiagnosticHint" },
    default = { "Identifier" },
    test = { "Special" },
  },

  search = {
    command = "rg",

    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--glob=!.git/",
    },

    pattern = [[\b(KEYWORDS)(:| )]],
  },
}
