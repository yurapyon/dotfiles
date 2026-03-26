function lsp()
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
    underline = true,
    -- severity_sort = false,
    float = {
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.cmd([[
set signcolumn=yes
set ut=1000
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
end

return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
      local cmp = require("cmp")

      vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
      vim.opt.shortmess = vim.opt.shortmess + { c = true }

      -- Register nvim-cmp lsp capabilities
      vim.lsp.config(
        "*",
        { capabilities = require("cmp_nvim_lsp").default_capabilities() }
      )
      return {
        -- Enable LSP snippets
        -- snippet = {
        -- expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body)
        -- end,
        -- },
        mapping = {
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          -- ["<A-Space>"] = cmp.mapping.complete(),
          -- ["<A-e>"] = cmp.mapping.close(),
          --[[
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Add tab support
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          --]]
        },
        -- Installed sources:
        sources = {
          -- { name = "path" }, -- file paths
          { name = "nvim_lsp", keyword_length = 3 }, -- from language server
          -- { name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
          -- { name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
          -- { name = "buffer", keyword_length = 2 }, -- source current buffer
          -- { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          -- { name = "calc" }, -- source for math calculation
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = ">",
              -- vsnip = "⋗",
              -- buffer = "Ω",
              -- path = "p",
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      }

      --[[
      vim.api.nvim_set_hl(
        0,
        "CmpGhostText",
        { link = "Comment", default = true }
      )
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert"
            .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item
          or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ["<C-p>"] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<tab>"] = function(fallback)
            return LazyVim.cmp.map(
              { "snippet_forward", "ai_nes", "ai_accept" },
              fallback
            )()
          end,
        }),
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, item)
            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
        experimental = {
          -- only show ghost text when we show ai completions
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        sorting = defaults.sorting,
      }
      --]]
    end,
    -- main = "lazyvim.util.cmp",
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
  },
  {
    "gpanders/nvim-parinfer",
    ft = { "lisp", "scheme" },
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
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      -- install_dir = vim.fn.stdpath("data") .. "/site",
      ensure_installed = { "rust", "toml" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
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
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    init = function()
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
      lsp()
    end,
  },
  -- { "rust-lang/rust.vim", ft = "rust" },
  --[[
  {
    "mrcjkb/rustaceanvim",
    version = "^8", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
    --]]
  --[[
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  --]]
}
