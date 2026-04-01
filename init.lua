------------------------------------------------
-- Options
------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.confirm = true
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", space = "·", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.showmatch = true

vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.opt.spell = true
vim.opt.spelllang = "en_gb"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.cmd.colorscheme("catppuccin")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

------------------------------------------------
-- Keymaps (Vanilla)
------------------------------------------------
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic quickfix" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwrite" })
vim.keymap.set("n", "<leader>d", [["_d]], { desc = "Delete without overwrite" })

vim.keymap.set("n", "grf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "grt", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- center up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center next prev search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true })

------------------------------------------------
-- Autocommands
------------------------------------------------
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function()
		vim.opt.formatoptions:remove("o")
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd("BufRead", {
	callback = function(opts)
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			buffer = opts.buf,
			callback = function()
				local ft = vim.bo[opts.buf].filetype
				local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
				if
					not (ft:match("commit") and ft:match("rebase"))
					and last_known_line > 1
					and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
				then
					vim.api.nvim_feedkeys([[g`"]], "nx", false)
				end
			end,
		})
	end,
})

------------------------------------------------
-- Plugins
------------------------------------------------
vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/oil.nvim",
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = vim.version.range("2.*"),
	},
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

require("which-key").setup({ delay = 0 })

require("todo-comments").setup({ signs = false })

require("mini.cursorword").setup()
local hl = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = hl.bg, underline = false })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = hl.bg, underline = false })

require("mini.ai").setup()
require("mini.align").setup() -- Use ga or gA
require("mini.icons").setup()
require("mini.move").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()

require("oil").setup({
	columns = { "icon" },
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "<leader><leader>", ":Oil<CR>", { silent = true })

require("treesitter-context").setup({ enabled = true, trim_scope = "inner", max_lines = 3 })

require("luasnip").setup({ cut_selection_keys = "<C-k>" })
require("luasnip.loaders.from_vscode").lazy_load()
require("snippets")

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-k>"] = { "snippet_forward", "fallback" },
		["<C-j>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	snippets = { preset = "luasnip" },
	signature = { enabled = true },
})

vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", { silent = true, desc = "Next change" })
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { silent = true, desc = "Prev change" })
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { silent = true, desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hb", ":Gitsigns blame<CR>", { silent = true, desc = "Blame" })
vim.keymap.set("n", "<leader>hd", ":Gitsigns toggle_deleted<CR>", { silent = true, desc = "Deleted hunks" })
vim.keymap.set(
	"n",
	"<leader>htb",
	":Gitsigns toggle_current_line_blame<CR>",
	{ silent = true, desc = "Toggle current line blame" }
)

require("fzf-lua").setup()
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { silent = true, desc = "Find files (fd)" })
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>", { silent = true, desc = "Find buffers" })
vim.keymap.set("n", "<leader>fi", ":FzfLua git_status<CR>", { silent = true, desc = "Find Git index" })
vim.keymap.set("n", "<leader>fr", ":FzfLua resume<CR>", { silent = true, desc = "Find resume" })
vim.keymap.set("n", "<leader>fk", ":FzfLua keymaps<CR>", { silent = true, desc = "Find keymap" })
vim.keymap.set("n", "<leader>fg", ":FzfLua grep_project<CR>", { silent = true, desc = "Find grep" })
vim.keymap.set("n", "<leader>fl", ":FzfLua live_grep_native<CR>", { silent = true, desc = "Find grep (live)" })
vim.keymap.set("n", "<leader>fc", ":FzfLua git_commits<CR>", { silent = true, desc = "Find commits" })
vim.keymap.set("n", "<leader>fh", ":FzfLua git_bcommits<CR>", { silent = true, desc = "Find file history" })
vim.keymap.set("n", "<leader>fs", ":FzfLua spell_suggest<CR>", { silent = true, desc = "Find spelling" })

vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				preloadFileSize = 10000,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
})

vim.keymap.set("n", "grh", ":LspClangdSwitchSourceHeader<CR>", { silent = true })
vim.keymap.set("n", "grs", ":LspClangdShowSymbolInfo<CR>", { silent = true })
