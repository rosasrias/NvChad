dofile(vim.g.base46_cache .. "rainbow")
local rainbow = require("rainbow-delimiters")

return {
  strategy = {
    [""] = rainbow.strategy["global"],
    vim = rainbow.strategy["local"],
  },

  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
    python = "rainbow-parens",
    javascript = "rainbow-delimiters-react",
  },

  priority = {
    [""] = 110,
    lua = 210,
    python = 200,
  },

  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },

  max_file_lines = 3000,
}
