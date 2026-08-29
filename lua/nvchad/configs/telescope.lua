dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    layout_strategy = "horizontal",
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.55,
      },
      width = 0.90,
      height = 0.55,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}
