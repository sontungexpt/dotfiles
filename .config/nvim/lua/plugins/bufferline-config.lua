local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  gray = "#66615c"
}

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator = {
      -- icon = '▎ ', -- this should be omitted if indicator style is not 'icon'
      icon = '▎ ', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    -- name_formatter can be used to change the buffer's label in the bufferline.
    -- Please note some names can/will break the
    -- bufferline so use this at your discretion knowing that it has
    -- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains:
      -- name                | str        | the basename of the active file
      -- path                | str        | the full path of the active file
      -- bufnr (buffer only) | int        | the number of the active buffer
      -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    end,
    max_name_length = 20,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 15,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   if context.buffer:current() then
    --     return ''
    --   end
    --   return ''
    -- end,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "NvimTree" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "NvimTree" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "directory",
        padding = 0,
        text_align = "center",
        separator = " "
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "thin",
    separator_style = { '|', '|' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 1,
      reveal = { 'close' }
    },
    sort_by = 'insert_after_current',
  }
}