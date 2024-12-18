return  { 
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", 
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "php", "lua", "vim", "javascript", "html", "yaml", "twig", "vimdoc", "markdown", "markdown_inline" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

