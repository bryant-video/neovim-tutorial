local status_ok, tokyo = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyo.setup({
  style = "storm",
})
vim.cmd("colorscheme tokyonight-storm")
