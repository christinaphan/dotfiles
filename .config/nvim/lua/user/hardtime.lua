local hardtime_status, hardtime = pcall(require, "hardtime")
if not hardtime_status then
  return
end

hardtime.setup({
  disable_mouse = false,
  disabled_filetypes = { "NvimTree", "mason", "help", "lazy" },
})
