vim.g.have_nerd_font = true
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 10
opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.diagnostic.config({ virtual_text = true })

local remove_whitespace_group = vim.api.nvim_create_augroup("remove_whitespace", { clear = true })vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
    group = remove_whitespace_group,
})
