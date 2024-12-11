require('lualine').setup({
  options = {
    icons_enabled = false,   -- Remove icons for a cleaner look
    theme = 'auto',          -- Auto-detect theme
    component_separators = '',  -- No separators between components
    section_separators = '',     -- No separators between sections
    globalstatus = true,         -- Use a single status line for all windows
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
