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

vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'none', bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 'grey', ctermbg = 'none', bold = false })
vim.api.nvim_set_hl(0, 'PmenuSel', { ctermfg = 11, ctermbg = 'none', bold = false })
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

-- Avante

vim.api.nvim_set_hl(0, "AvanteTitle", { fg = "#1e222a", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteReversedTitle", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteSubtitle", { fg = "#1e222a", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteThirdTitle", { fg = "#1e222a", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { fg = "#5C9897", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { fg = "#E56C8F", bg = "NONE" })
vim.api.nvim_set_hl(0, "AvanteConflictCurrentLabel", { fg = "#ffffff", bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "AvanteConflictIncomingLabel", { fg = "#ffffff", bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "AvanteInlineHint", { fg = "#3E7CD1", bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "AvantePopupHint", { fg = "#3E7CD1", bg = "NONE", bold = false })
