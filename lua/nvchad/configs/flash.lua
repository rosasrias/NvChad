dofile(vim.g.base46_cache .. "flash")

return {
  labels = "asdfghjklqwertyuiopzxcvbnm",

  modes = {
    search = {
      enabled = true,
    },

    char = {
      enabled = true,
      jump_labels = true,
      multi_line = true,
    },
  },

  highlight = {
    backdrop = true,
  },

  jump = {
    nohlsearch = true,
    autojump = false,
    inclusive = nil,
  },

  label = {
    min_pattern_length = 0,
    rainbow = {
      enabled = false,
    },
  },

  search = {
    multi_window = true,
    forward = true,
    wrap = true,
  },
}
