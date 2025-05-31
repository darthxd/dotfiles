-- Left column / sidebar settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.g.terminal_emulator='kitty'

-- Tab spacing
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- General settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.writebackup = false

-- Searching settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keymaps
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", "<A-d>", ":nohlsearch<CR>", {silent = true})
vim.keymap.set("n", "<leader>gm", ":!go mod tidy<CR>", {})
vim.keymap.set("n", "<leader>lr", ":LspRestart <CR>", {silent = true})
vim.keymap.set("n", "gl", "$", {silent = true})
vim.keymap.set("n", "gh", "0", {silent = true})
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w>l", {silent = true})
vim.keymap.set("n", "<C-q>", ":q<CR>", {silent = true})
vim.keymap.set("n", "<A-l>", ":bn<CR>", {silent = true})
vim.keymap.set("n", "<A-h>", ":bp<CR>", {silent = true})
vim.keymap.set("n", "<A-q>", ":Bd<CR>", {silent = true})
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {silent = true})
vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
	if vim.g.diagnostics_active then
		vim.g.diagnostics_active = false
		vim.diagnostic.disable()
	else
		vim.g.diagnostics_active = true
		vim.diagnostic.enable()
	end
end

vim.keymap.set(
	"n",
	"<leader>tt",
	Toggle_diagnostics,
	{ noremap = true, silent = true, desc = "Toggle vim diagnostics" }
)
