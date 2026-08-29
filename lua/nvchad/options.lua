local opt = vim.opt
local o = vim.o
local g = vim.g

o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.fileformat = "unix"
opt.fileformats = { "unix", "dos" }

o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
o.wrap = false
o.mouse = "a"
o.termguicolors = true
o.ttyfast = true

o.guicursor = {
  "n:block",
  "v:block",
  "i:ver25",
  "c:ver25",
  "ci:ver25",
  "cr:ver25",
  "o:block",
  "r:hor20",
  "sm:block",
}

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = {
  eob = " ",
}

o.ignorecase = true
o.smartcase = true

o.number = true
o.numberwidth = 2
o.ruler = false

opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

o.swapfile = false
o.backup = false
o.writebackup = false

o.updatetime = 250

opt.whichwrap:append("<>[]hl")

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

if vim.fn.has("win32") == 1 then
  local nu = vim.fn.exepath("nu")

  if nu ~= "" then
    o.shell = nu
    o.shellcmdflag = "-c"
  else
    local pwsh = vim.fn.exepath("pwsh")

    if pwsh ~= "" then
      o.shell = pwsh
      o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    else
      o.shell = "cmd.exe"
      o.shellcmdflag = "/c"
    end
  end

  o.shellquote = ""
  o.shellxquote = ""
else
  o.shell = "/bin/zsh"
  o.shellcmdflag = "-lc"
  o.shellquote = ""
  o.shellxquote = ""
end

local is_windows = vim.fn.has("win32") == 1
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"

vim.env.PATH = table.concat({
  vim.fn.stdpath("data"),
  "mason",
  "bin",
}, sep) .. delim .. vim.env.PATH
