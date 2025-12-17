return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ensure_installed = {
      "bash",
      "lua",
      "c",
      "cpp",
      "vim",
      "vimdoc",
      "python",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "diff",
      "jq",
      "json",
      "typescript",
      "javascript",
      "tsx",
      "java",
    }
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        local is_file_too_large = ok and stats and stats.size > max_filesize
        if is_file_too_large then
          return
        end

        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        local already_installed = require("nvim-treesitter.config").get_installed()
        local is_parser_installed = lang and vim.tbl_contains(already_installed, lang)
        if is_parser_installed then
          -- syntax highlighting
          vim.treesitter.start()
          -- folds
          vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.opt.foldmethod = "expr"
          -- indents
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
