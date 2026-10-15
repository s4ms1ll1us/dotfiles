-- install lazy (keep if you want lazy.nvim for other plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- color scheme
  { "catppuccin/nvim", as = "catppuccin" },

  {
    "tiagovla/tokyodark.nvim",
    opts = {},
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = false -- set to true if you would like to enable transparency

      local coolnight = {
        bg = "#011323",
        bg_dark = "#00111E",
        bg_float = "#00111E",
        bg_highlight = "#012646",
        bg_popup = "#00111E",
        bg_search = "#3E90D7",
        bg_sidebar = "#00111E",
        bg_statusline = "#00111E",
        bg_visual = "#064984",
        fg = "#E3EEF7",
        fg_dark = "#AECBE5",
        fg_float = "#CBDFF0",
        fg_gutter = "#2D4F6C",
        fg_sidebar = "#AECBE5",
        border = "#03447C",
      }

      require("tokyonight").setup({
        style = "storm",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = coolnight.bg
          colors.bg_dark = transparent and colors.none or coolnight.bg_dark
          colors.bg_float = transparent and colors.none or coolnight.bg_float
          colors.bg_highlight = coolnight.bg_highlight
          colors.bg_popup = coolnight.bg_popup
          colors.bg_search = coolnight.bg_search
          colors.bg_sidebar = transparent and colors.none or coolnight.bg_sidebar
          colors.bg_statusline = transparent and colors.none or coolnight.bg_statusline
          colors.bg_visual = coolnight.bg_visual
          colors.border = coolnight.border
          colors.fg = coolnight.fg
          colors.fg_dark = coolnight.fg_dark
          colors.fg_float = coolnight.fg_float
          colors.fg_gutter = coolnight.fg_gutter
          colors.fg_sidebar = coolnight.fg_sidebar
        end,
        lualine_bold = true,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
    
  -- telescope
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup({ view = { adaptive_size = true }}) end,
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = ":call mkdp#util#install()",
    config = function()
      vim.g.mkdp_theme = "light"
    end
  },

  -- session management
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
      }
    end
  },

  -- commenting
  {
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
    end
  },

  -- buffer tabs
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},


  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
          end),
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
          end),
        }),
      })
    end
  },

  -- lsp packages
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      -- optionally auto-install servers
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "stylua", "ts_ls" },
        automatic_installation = true,
      })
    end,
  },

  -- lsp configuration
  {
    "neovim/nvim-lspconfig"
  },

  {
    "Myzel394/easytables.nvim",
    ft = "markdown",
    config = function()
      require("easytables").setup({})
    end,
  },
})

