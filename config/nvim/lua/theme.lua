require("rose-pine").setup({
	highlight_groups = {
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},
})

vim.opt.guifont = "Liga SFMono Nerd Font:h14"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme "rose-pine"

-- Base

vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 'grey', ctermbg = 'none', bold = false })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#f6c177' })
vim.api.nvim_set_hl(0, 'StatusLine', { bold = false, bg = 'none', fg = 'grey' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bold = false, bg = 'none', fg = 'lightgrey' })
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })

-- Telescope

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

-- Alpha

local dashboard = require("alpha.themes.dashboard")

vim.api.nvim_set_hl(0, "AlphaYellow", { fg = "#f6c177" })
vim.api.nvim_set_hl(0, "AlphaWhite", { fg = "#ffffff" })

dashboard.section.header.opts.hl = "AlphaYellow"

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaWhite"
  button.opts.hl_shortcut = "AlphaWhite"
end
