local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup {
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            numbers = "none",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 30,
            max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
            tab_size = 21,
            diagnostics = false,
            diagnostics_update_in_insert = false,
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = "thin",
            enforce_regular_tabs = true,
            always_show_bufferline = false,
        }
    }
