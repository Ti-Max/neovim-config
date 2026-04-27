require("telescope").setup({
  defaults = {
    preview = {
      treesitter = false,  -- disables ts highlighting in previewer
    },
  },
})

require("telescope").load_extension("fzf")
