-- Bootstrap lazy.nvim
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

require("lazy").setup({
  -- Editor enhancements
  'tpope/vim-commentary',
  'tpope/vim-endwise',
  'tpope/vim-surround',
  { 'andymass/vim-matchup', event = "BufReadPost" },

  -- File type support
  { 'slim-template/vim-slim', ft = 'slim' },
  { 'towolf/vim-helm', ft = 'helm' },

  -- Rails
  { 'tpope/vim-rails', ft = { 'ruby', 'eruby' } },

  -- Linting/Formatting
  {
    'dense-analysis/ale',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.ale_linters_explicit = 1
      vim.g.ale_linters = { ruby = { 'rubocop' } }
      vim.g.ale_ruby_rubocop_executable = 'bundle'
    end,
  },
  {
    'stevearc/conform.nvim',
    event = "BufWritePre",
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          ruby = { 'prettierd', 'prettier', stop_after_first = true },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          hcl = { 'terraform_fmt' },
          terraform = { 'terraform_fmt' },
          ["terraform-vars"] = { 'terraform_fmt' },
          sh = { 'shfmt' },
          bash = { 'shfmt' },
        },
        formatters = {
          prettierd = {
            cwd = require('conform.util').root_file({ 'package.json' }),
          },
          shfmt = {
            prepend_args = { '-i', '2', '-ci' },
          },
        },
        format_on_save = {
          timeout_ms = 5000,
          lsp_format = 'fallback',
        },
      })
    end,
  },

  -- Testing
  {
    'janko-m/vim-test',
    dependencies = { 'preservim/vimux' },
    keys = {
      { '<leader>s', ':TestNearest<CR>', desc = 'Test nearest' },
      { '<leader>t', ':TestFile<CR>', desc = 'Test file' },
    },
    config = function()
      vim.g['test#ruby#rspec#executable'] = 'bundle exec spring rspec'
      vim.g['test#strategy'] = 'vimux'
      vim.g.VimuxRunnerType = 'window'
      vim.g.VimuxRunnerName = 'console'
    end,
  },
  {
    'preservim/vimux',
    lazy = true,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<C-b>', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>ag', function()
        local search = vim.fn.input("Grep > ")
        if search and search ~= "" then
          require('telescope.builtin').grep_string({
            search = search
          })
        end
      end, desc = 'Grep' },
    },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup({
        pickers = {
          find_files = {
            disable_devicons = true,
            hidden = true
          },
          buffers = {
            disable_devicons = true
          },
          live_grep = {
            disable_devicons = true
          }
        },
        defaults = {
          file_ignore_patterns = {
            "spec/cassettes",
            "vendor",
            "public",
            "^%.git/",
            "^%.git$",
            "%.DS_Store$",
            "^node_modules/"
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-a>"] = { "<Home>", type = "command" },
              ["<C-e>"] = { "<End>", type = "command" },
            },
          },
        }
      })
    end,
  },

  -- AI
  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_filetypes = {
        markdown = true,
        gitcommit = true,
      }
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    ft = { 'astro' },
    config = function()
      vim.lsp.config('astro', {})
      vim.lsp.enable('astro')
    end,
  },

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "ruby", "lua", "vim", "markdown", "javascript", "json", "html", "css", "scss", "yaml", "go", "gomod", "gowork", "gosum", "astro" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- Theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
  },

  -- UI
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'HakonHarnes/img-clip.nvim',
    event = "VeryLazy",
  },
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "                                                     ",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "                                                     ",
      }

      dashboard.section.buttons.val = {
        dashboard.button( "f", "✨ | Find File", ":lua require('telescope.builtin').find_files()<CR>"),
        dashboard.button( "s", "🔎 | Fild String", ":lua require('telescope.builtin').live_grep()<CR>"),
        dashboard.button( "q", "👋 | Quit Neovim", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '',
          section_separators = '',
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end,
  },
})

-- File type detection for Helm templates
vim.cmd [[
  autocmd BufRead,BufNewFile *.tpl set filetype=helm
  autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.yml set filetype=helm
]]

-- File type detection for Astro
vim.filetype.add({ extension = { astro = 'astro' } })

require('theme')
require('keymaps')

-- Editor settings
vim.opt.showcmd = false
vim.opt.autoread = true
vim.opt.clipboard = 'unnamed'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.confirm = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.number = true
vim.opt.fillchars:append({ eob = " " })
vim.g.netrw_banner = 0
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.updatetime = 100

-- Strip trailing whitespace on save
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

-- Alternate file creation
vim.cmd [[
  command AC :execute "e " . eval('rails#buffer().alternate()')
]]

vim.cmd [[
  let &t_SI .= "\<Esc>[?2004h"
  let &t_EI .= "\<Esc>[?2004l"
]]

vim.api.nvim_create_augroup("AutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = "AutoReload",
  pattern = "*",
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("silent! checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = "AutoReload",
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})

local watchers = {}

local function refresh_buffer()
  if vim.fn.getcmdwintype() == "" and vim.api.nvim_get_mode().mode ~= "c" then
    vim.cmd("silent! checktime")
  end
end

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  group = "AutoReload",
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local filepath = vim.api.nvim_buf_get_name(bufnr)

    if filepath ~= "" and vim.fn.filereadable(filepath) == 1 then
      if watchers[bufnr] then
        watchers[bufnr]:close()
      end

      watchers[bufnr] = vim.loop.new_fs_event()
      watchers[bufnr]:start(filepath, {}, vim.schedule_wrap(function(err, filename, events)
        if not err and vim.api.nvim_buf_is_valid(bufnr) then
          refresh_buffer()
        end
      end))
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  group = "AutoReload",
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    if watchers[bufnr] then
      watchers[bufnr]:close()
      watchers[bufnr] = nil
    end
  end,
})

local timer = vim.loop.new_timer()
timer:start(200, 200, vim.schedule_wrap(refresh_buffer))
