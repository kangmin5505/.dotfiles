local options = {
  timeoutlen = 250,
  colorcolumn = "80",
  scrolloff = 25,
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 8,                          -- the number of spaces inserted for each indentation
  tabstop = 8,                             -- insert 2 spaces for a tab
  smartindent = true,                      -- make indenting smarter again
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- TODO: change colorcolumn color
-- vim.api.nvim_set_option_value("colorcolumn", "80", {})
-- vim.cmd [[
--   highlight ColorColumn guibg=darkgrey
-- ]]

-- jump last position
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{callback = function()
			local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
			if {row, col} ~= {0, 0} then
				vim.api.nvim_win_set_cursor(0, {row, 0})
			end
		end,
	group = group
	}
)
