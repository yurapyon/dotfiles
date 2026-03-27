return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  init = function()
    --[[
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "rust" },
      callback = function()
        -- vim.treesitter.start()
      end,
    })
    --]]
  end,
}
