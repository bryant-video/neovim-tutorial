-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, tn = pcall(require, "tokyonight")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

tn.setup({
  style = "storm",
})

vim.cmd("colorscheme tokyonight-storm")
