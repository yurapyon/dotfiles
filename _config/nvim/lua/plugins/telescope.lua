return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      layout_config = { width = 0.9, height = 0.95, preview_width = 0.5 },
    },
  },
  init = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>F",
      builtin.git_files,
      { desc = "Telescope find files" }
    )
    vim.keymap.set(
      "n",
      "<leader>/",
      builtin.live_grep,
      { desc = "Telescope live grep" }
    )
    vim.keymap.set(
      "n",
      "<leader>b",
      builtin.buffers,
      { desc = "Telescope buffers" }
    )
    vim.keymap.set(
      "n",
      "<leader>d",
      builtin.diagnostics,
      { desc = "Telescope diagnostic" }
    )
    vim.keymap.set(
      "n",
      "<leader>s",
      builtin.lsp_document_symbols,
      { desc = "Telescope document symbols" }
    )
    vim.keymap.set(
      "n",
      "<leader>S",
      builtin.lsp_workspace_symbols,
      { desc = "Telescope workspace symbols" }
    )
  end,
}
