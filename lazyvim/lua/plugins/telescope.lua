return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      local telescope = require("telescope");
      telescope.load_extension("fzf");
    end,
    keys = {
      {
        "<leader>sm",
        function ()
          require("telescope.builtin").marks({ hidden = true })
        end
      }
    }
  },
}
