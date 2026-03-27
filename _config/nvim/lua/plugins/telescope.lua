return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      layout_config = { preview_width = 0.5 },
    },
  },
  init = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>tf",
      builtin.git_files,
      { desc = "Telescope find files" }
    )
    vim.keymap.set(
      "n",
      "<leader>t/",
      builtin.live_grep,
      { desc = "Telescope live grep" }
    )
    vim.keymap.set(
      "n",
      "<leader>tb",
      builtin.buffers,
      { desc = "Telescope buffers" }
    )
    vim.keymap.set(
      "n",
      "<leader>td",
      builtin.diagnostics,
      { desc = "Telescope diagnostic" }
    )
    vim.keymap.set(
      "n",
      "<leader>ts",
      builtin.lsp_workspace_symbols,
      { desc = "Telescope workspace symbols" }
    )
  end,
}
