dofile(vim.g.base46_cache .. "notify")

return {
  minimum_width = 50,
  max_width = 70,
  max_height = 8,

  render = "wrapped-compact",
  stages = "slide",

  timeout = 3000,
  fps = 30,
  top_down = true,

  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "󱑆",
  },

  on_open = function(win)
    if not vim.api.nvim_win_is_valid(win) then
      return
    end

    vim.wo[win].winhl = table.concat({
      "Normal:NotifyBackground",
      "FloatBorder:NotifyINFOBorder",
    }, ",")
  end,
}
