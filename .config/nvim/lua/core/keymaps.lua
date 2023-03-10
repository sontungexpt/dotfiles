----------Example mapping----------

-- Map to a Lua function:
--vim.keymap.set('n', 'lhs', function() print("real lua function") end)

-- Map to multiple modes:
--vim.keymap.set({'n', 'v'}, '<leader>lr', vim.lsp.buf.references, { buffer=true })

-- Buffer-local mapping:
--vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { silent = true, buffer = 5 })

-- Expr mapping:
--vim.keymap.set('i', '<Tab>', function()
--return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
--end, { expr = true })

-- <Plug> mapping:
--vim.keymap.set('n', '[%', '<Plug>(MatchitNormalMultiBackward)')

-----------Mappings----------
local opts = { noremap = true, silent = true }
local opts_without_noremap = { noremap = false, silent = true }
local opts_without_silent = { noremap = true, silent = false }
local opts_expr = { expr = true, replace_keycodes = true, noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

--Back to normal mode
map("i", "jj", "<esc>", opts_without_noremap)
map("c", "jj", "<esc>", opts_without_noremap)
map("s", "<C-e>", "<esc>", opts_without_noremap)

--Back to insert mode
map("v", "i", "<esc>i", opts_without_noremap)

--Move  to the commad mode when in visual mode
map("v", ":", "<esc>:", opts_without_noremap)

--Save file as the traditional way
map("n", "<C-s>", ":w<cr>", opts_without_noremap)
map("i", "<C-s>", "<esc>:w<cr>", opts_without_noremap)
map("v", "<C-s>", "<esc>:w<cr>", opts_without_noremap)
map("c", "<C-s>", "<esc>:w<cr>", opts_without_noremap)

--ctrl z to undo and move to normal mode
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-O>u", opts)
map("v", "<C-z>", "<esc>u", opts)

--ctrl a to selected all text in file
map("n", "<C-a>", "<esc>gg0v$G", opts)
map("i", "<C-a>", "<esc>gg0v$G", opts)
map("v", "<C-a>", "<esc>gg0v$G", opts)

--The arrow keys in the insert mode
map("i", "<C-j>", "<Down>", opts_without_noremap)
map("i", "<C-k>", "<Up>", opts_without_noremap)
map("i", "<C-h>", "<Left>", opts_without_noremap)
map("i", "<C-l>", "<Right>", opts_without_noremap)

--Change the buffer
map("n", "gt", ":bnext<cr>", opts)
map("n", "gT", ":bNext<cr>", opts)

--Go to the current path
map("n", "cd", ":cd %:p:h<cr>:pwd<cr>", opts_without_silent)
map("v", "cd", "<esc>:cd %:p:h<cr>:pwd<cr>", opts_without_silent)

--Close Buffer
map("n", "Q", ":bd<cr>", opts)
map("v", "Q", "<esc>:bd<cr>", opts)

--Open the link with default browser
map("n", "gx", ":execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>", opts)
map("v", "gx", "<esc>:execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>", opts)

--Clean searching
map("n", "C", ":noh<cr>:set ignorecase<cr>", opts)
map("v", "C", "<esc>:noh<cr>:set ignorecase<cr>", opts)

--Resize Buffer
map("n", "<A-j>", ":resize +1<cr>", opts)
map("n", "<A-k>", ":resize -1<cr>", opts)
map("n", "<A-l>", ":vertical resize -1<cr>", opts)
map("n", "<A-h>", ":vertical resize +1<cr>", opts)

--Make all windows (almost) equally high and wide
map("n", "=", "<C-W>=", opts)

--Change the layout to horizohkkntal
map("n", "gv", "<C-w>t<C-w>H", opts)

--Change the layout to vertical
map("n", "gh", "<C-w>t<C-w>K", opts)

--Refresh nvim config
map("n", "<leader><cr>", ":luafile $MYVIMRC<CR>:HighlightColorsOn<cr>:lua print('Refresh the neovim configuration')<cr>",
  opts_without_silent)

function IsLastLine()
  local last_line = vim.api.nvim_buf_line_count(0)
  local current_line = vim.api.nvim__buf_stats(0).current_lnum
  return last_line == current_line
end

function IsFirstLine()
  local current_line = vim.api.nvim__buf_stats(0).current_lnum
  return current_line == 1
end

--Swap up one row
vim.keymap.set("", "<A-Up>", function()
  if IsLastLine() then
    return "<esc>ddP"
  elseif IsFirstLine() then
    return "<esc>"
  else
    return "<esc>dd<Up>P"
  end
end, opts_expr)

--Swap down one row
vim.keymap.set("", "<A-Down>", function()
  if IsLastLine() then
    return "<esc>"
  else
    return "<esc>ddp"
  end
end, opts_expr)
