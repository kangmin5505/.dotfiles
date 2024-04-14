lvim.colorscheme = "github_dark_high_contrast"

-- key mapping to cycle buffer
lvim.keys.normal_mode["<Tab>"] = nil
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = nil
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
-- key mapping to save
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
