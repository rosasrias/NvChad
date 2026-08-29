dofile(vim.g.base46_cache .. "dressing")

return {
  input = {
    enabled = true,
    default_prompt = "Input:",
    trim_prompt = true,
    title_pos = "left",
    insert_only = true,
    start_in_insert = true,
    anchor = "SW",
    border = "solid",
    relative = "cursor",
    prefer_width = 40,
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
    win_options = {
      winblend = 0,
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  },

  select = {
    enabled = true,
    backend = { "telescope", "builtin" },
    trim_prompt = true,
    telescope = nil,
    builtin = {
      show_numbers = true,
      border = "rounded",
      relative = "editor",
      win_options = {
        winblend = 0,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}
