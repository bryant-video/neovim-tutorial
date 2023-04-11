return {
  {
    "codota/tabnine-nvim",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<C-a>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 300,
        suggestion_color = { gui = "#808080", cterm = 244 },
        execlude_filetypes = { "TelescopePrompt" },
      })
    end,
  },
}
