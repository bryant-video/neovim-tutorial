return {
  {
    "simrat39/rust-tools.nvim",
    opts = function(_, _)
      require("rust-tools").setup({})
      require("rust-tools").open_cargo_toml.open_cargo_toml()
      require("rust-tools").hover_actions.hover_actions()
    end,
  },
}
