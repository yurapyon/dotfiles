return {
  { "rust-lang/rust.vim" },
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.lsp.enable("rust_analyzer")
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "gpanders/nvim-parinfer",
    init = function()
      vim.cmd([[let g:parinfer_mode='indent']])
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = true,
      formatters_by_ft = {
        lua = { "stylua" },
        ocaml = { "ocamlformat" },
        rust = { "rustfmt" },
        glsl = { "clang-format" },
      },
      formatters = {
        ocamlformat = {
          prepend_args = {
            "-p",
            "janestreet",
            "-m",
            "80",
          },
        },
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--column-width",
            "80",
          },
        },
        ["clang-format"] = {
          prepend_args = {
            "--style",
            "{IndentWidth: 4, BasedOnStyle: Chromium}",
          },
        },
      },
    },
    init = function()
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line =
            vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end

        require("conform").format({
          async = true,
          lsp_format = "fallback",
          range = range,
        })
      end, { range = true })
    end,
  },
}
