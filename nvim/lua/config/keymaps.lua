-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Quick save
map("n", "<C-s>", ":w<Return>")

-- Reload
map("n", "<F5>", ":source%<Return>", { silent = true })

-- Redo
map("n", "r", ":redo<CR>", opts)

-- Movement key
map({ "n", "v" }, "j", "jzz")
map({ "n", "v" }, "k", "kzz")

map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "J", "5jzz")
map({ "n", "v" }, "K", "5kzz")
map({ "n", "v" }, "L", "5l")

-- Do not yank with x
map({ "n", "v" }, "x", '"_x')

-- Delete line
map("n", "<leader>d", "dd")

-- Increment/ decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")
map("i", "<C-a>", "<Esc>gg<S-v>G")

-- Jumplist
map("n", "<C-m>", "<C-i>", opts)

-- Tab control
map("n", "te", ":tabedit<Return>", opts)
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)
-- Buffer control
map("n", "<tab>", ":bnext<Return>", opts)
map("n", "<s-tab>", ":bprev<Return>", opts)

-- Split window
map("n", "ss", ":split<Return><C-w>w", opts)
map("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window
map("", "sh", "<C-w>h")
map("", "sj", "<C-w>j")
map("", "sk", "<C-w>k")
map("", "sl", "<C-w>l")

-- resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

--Buffer
map("n", "bd", ":bd<Return>", opts)

-- Diagnostic
map("n", "<C-d>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Quick quit
map("n", "<C-q>", ":q<Return>", opts)

-- Wrap selected text in single quotes

map("n", "M", vim.lsp.buf.hover, opts)

vim.keymap.del("n", "<c-/>")
map("n", "<C-/>", ":ToggleTerm name=Terminal<Return>", opts)
