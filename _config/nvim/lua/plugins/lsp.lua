return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    -- { "ms-jpq/coq_nvim", branch = "coq" },
  },
  init = function()
    -- vim.g.coq_settings = {
    -- auto_start = "shut-up",
    -- }
  end,
  config = function()
    vim.lsp.enable("rust_analyzer")
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    })

    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [severity.ERROR] = "E>",
          [severity.WARN] = "W>",
          [severity.INFO] = "i ",
          [severity.HINT] = "h ",
        },
      },
      -- update_in_insert = true,
      underline = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Hide semantic highlights for functions
    vim.api.nvim_set_hl(0, "@lsp.type.function", {})
    -- Hide all semantic highlights
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end

    vim.cmd([[
      set signcolumn=yes
      " set ut=2000
      " autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    ]])
  end,
}
