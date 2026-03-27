return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    -- install_dir = vim.fn.stdpath("data") .. "/site",
    ensure_installed = { "rust", "toml" },
    auto_install = true,
    -- highlight = {
    -- enable = true,
    -- additional_vim_regex_highlighting = false,
    -- },
    ident = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "rust" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
