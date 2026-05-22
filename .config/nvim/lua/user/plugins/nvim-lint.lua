return {
  "mfussenegger/nvim-lint",
  event = { "VeryLazy" },
  config = function()
    require("lint").linters_by_ft = {
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "InsertLeave", "TextChanged", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
