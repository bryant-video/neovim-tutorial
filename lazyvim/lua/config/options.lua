-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g = vim.g
local opt = vim.opt
opt.wildmenu = true
opt.wildmode = "longest:list,full"
g.rust_recommended_style = 0
g.tmux_navigator_no_mappings = 1
opt.relativenumber = false
