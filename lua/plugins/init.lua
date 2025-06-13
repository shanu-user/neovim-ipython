return {

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    end,
  },
  {
    "hkupty/iron.nvim",
    config = function()
      require("iron.core").setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "ipython" },
            },
          },
          repl_open_cmd = "vertical botright 50split",
        },
      })
    end,
  },
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "iron"
    end,
  },
}
