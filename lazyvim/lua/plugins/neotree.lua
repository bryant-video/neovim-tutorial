return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.mappings.o = "open";
    opts.window.width = 27
  end,
}
