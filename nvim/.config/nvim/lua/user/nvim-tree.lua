-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- disable netrw at the very start of your init.lua
--[[ vim.g.loaded_netrw = 1 ]]
--[[ vim.g.loaded_netrwPlugin = 1 ]]

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
