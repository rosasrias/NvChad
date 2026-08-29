local api = vim.api
local fn = vim.fn

local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local create_cmd = api.nvim_create_user_command

local groups = {
  file_post = augroup("NvFilePost", { clear = true }),
  yank = augroup("HighlightYank", { clear = true }),
  special_buffers = augroup("SpecialBuffers", { clear = true }),
  python_indent = augroup("PythonIndent", { clear = true }),
  web_indent = augroup("WebIndent", { clear = true }),
}

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = groups.file_post,
  callback = function(args)
    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if not vim.g.ui_entered then
      return
    end

    local buf = args.buf
    local file = api.nvim_buf_get_name(buf)
    local buftype = vim.bo[buf].buftype

    if file == "" or buftype == "nofile" then
      return
    end

    api.nvim_exec_autocmds("User", {
      pattern = "FilePost",
      modeline = false,
    })

    api.nvim_del_augroup_by_name("NvFilePost")

    vim.schedule(function()
      if not api.nvim_buf_is_valid(buf) then
        return
      end

      api.nvim_exec_autocmds("FileType", {})

      if vim.g.editorconfig then
        local ok, editorconfig = pcall(require, "editorconfig")

        if ok then
          editorconfig.config(buf)
        end
      end
    end)
  end,
})

autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

autocmd("TextYankPost", {
  group = groups.yank,
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufWinEnter", {
  group = groups.special_buffers,
  callback = function(args)
    local buftype = vim.bo[args.buf].buftype

    if vim.tbl_contains({
      "help",
      "nofile",
      "quickfix",
    }, buftype) and fn.maparg("q", "n", false, true).lhs == "" then
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        buffer = args.buf,
        silent = true,
        noremap = true,
      })
    end
  end,
})

autocmd("FileType", {
  group = groups.special_buffers,
  pattern = "qf",
  callback = function(args)
    vim.bo[args.buf].buflisted = false
  end,
})

autocmd("FileType", {
  group = groups.python_indent,
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

autocmd("FileType", {
  group = groups.web_indent,
  pattern = {
    "lua",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
    "yaml",
    "html",
    "css",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

autocmd("VimEnter", {
  callback = function(args)
    if fn.isdirectory(args.file) ~= 1 then
      return
    end

    vim.cmd.cd(args.file)

    local ok, tree = pcall(require, "nvim-tree.api")

    if ok then
      tree.tree.open()
    end
  end,
  desc = "Open nvim-tree when entering a directory",
})

autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float({
      scope = "cursor",
      focusable = false,
    })
  end,
  desc = "Show diagnostics on cursor hold",
})

create_cmd("TSInstallAll", function()
  local spec = require("lazy.core.config").plugins["nvim-treesitter"]
  local opts = type(spec.opts) == "table" and spec.opts or {}

  if opts.ensure_installed then
    require("nvim-treesitter").install(opts.ensure_installed)
  end
end, {})
