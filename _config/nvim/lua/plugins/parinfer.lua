return {
  "gpanders/nvim-parinfer",
  ft = { "lisp", "scheme" },
  init = function()
    vim.cmd([[let g:parinfer_mode='indent']])
  end,
}
