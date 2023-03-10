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
-- local opts_without_noremap = { noremap = false, silent = true }
-- local opts_without_silent = { noremap = true, silent = false }
-- local opts_expr = { expr = true, replace_keycodes = true, noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

--NvimTree
map("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
map("i", "<C-b>", "<esc>:NvimTreeToggle<cr>", opts)
map("v", "<C-b>", "<esc>:NvimTreeToggle<cr>", opts)
map("c", "<C-b>", "<esc>:NvimTreeToggle<cr>", opts)

--Floaterm
vim.g.floaterm_keymap_toggle = "<C-t>"
vim.g.floaterm_keymap_new = "<C-n><C-t>"

map("t", "<Leader>]", "<C-\\><C-n>:FloatermNext<cr>", opts)

map("t", "<Leader>[", "<C-\\><C-n>:FloatermPrev<cr>", opts)

map("t", "<Leader>k", "<C-\\><C-n>:FloatermKill<cr>:FloatermToggle<cr>", opts)

--Telescope
map("n", "<C-p>", ":Telescope find_files<cr>", opts)
map("i", "<C-p>", "<esc>:Telescope find_files<cr>", opts)
map("v", "<C-p>", "<esc>:Telescope find_files<cr>", opts)
map("n", "<leader>fm", "<esc>:Telescope media_files<cr>", opts)
map("n", "<leader>fg", "<esc>:Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<esc>:Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<esc>:Telescope help_tags<cr>", opts)
map("n", "<leader>fp", "<esc>:Telescope project<cr>", opts)
map("n", "<leader>fc", "<esc>:Telescope neoclip<cr>", opts)

--ccc (Color-picker)
map("n", "<A-c>", ":CccPick<cr>", opts)
map("i", "<A-c>", "<esc>:CccPick<cr>", opts)
map("v", "<A-c>", "<esc>:CccPick<cr>", opts)

--Debugging
map("n", "<Leader>do", ":lua require('dapui').open()<cr>", opts)
map("n", "<Leader>dc", ":lua require('dapui').close()<cr>", opts)
map("n", "<Leader>db", ":lua require('dapui').toggle()<cr>", opts)
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<F5>", ":lua require'dap'.continue()<cr>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<cr>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<cr>", opts)

-- Bufferline
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<Leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
