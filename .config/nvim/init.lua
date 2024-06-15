-- LOCALS
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local b = vim.b
local opt = vim.opt
local api = vim.api

-- GENERAL SETTINGS
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = true
opt.history = 1000
opt.wildmenu = true
opt.autochdir = false
opt.spelllang = { 'en_us', 'ru_ru' }
opt.showmatch = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.backup = false
opt.writebackup = false
opt.cursorline = true
-- opt.updatetime = 300
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"

-- INDENTATION
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.scrolloff = 5

-- COLORS
-- opt.termguicolors = true
-- cmd [[
-- let &t_ZH="\e[3m"
-- let &t_ZR="\e[23m"
-- syntax enable
-- ]]
-- g.sonokai_enable_italic = 1
require("catppuccin").setup({
	flavour = "mocha",
	no_italic = false,
	no_bold = false,
	no_underline = false,
	styles = {
		comments = { "italic" },
	}
})
cmd'colorscheme catppuccin'


-- KEYMAPS/SHORTCUTS/HOTKEYS
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<SPACE>', '<Nop>');
g.mapleader = " "
map('n', '<C-T>', ':Ranger<CR>')
-- i hate reloading vim every single time
map('', '<C-M><C-M>', ':luafile $MYVIMRC<CR>')
-- i hate jumping lines
map('n', 'k', 'gk')
map('n', 'j', 'gj')
map('v', 'k', 'gk')
map('v', 'j', 'gj')
--tabs and stuff
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-s>', '<C-w>s')
map('n', '<C-v>', '<C-w>v')
map('n', '<C-q>', '<C-w>q')
map('n', '<C-,>', '3<C-w><')
map('n', '<C-.>', '3<C-w>>')
map('n', '<C-=>', '3<C-w>+')
map('n', '<C-->', '3<C-w>-')
-- nvim-dap maps monstrocity (even though I will be using mouse probably lmao)
map('n', '<F3>', ':set spell!<CR>')
map('n', '<F4>', ':DapTerminate<CR>')
map('n', '<F5>', ':DapContinue<CR>')
map('n', '<F6>', '<CMD>lua require(\'dap\').run_last()<CR>')
map('n', '<F7>', '<CMD>make<CR>')
map('n', '<F8>', '<CMD>luafile nvim-dap.lua<CR>') -- fuck nvim-dap-projects
map('n', '<C-b>', ':DapToggleBreakpoint<CR>')
map('n', '<C-d>', '<CMD>lua require(\'dapui\').toggle()<CR>')
map('n', '<F10>', ':DapStepOver<CR>')
map('n', '<F11>', ':DapStepInto<CR>')
map('n', '<F12>', ':DapStepOut<CR>')
map('v', '<C-k>', '<CMD>lua require("dapui").eval()<CR>')
-- termninal mappings
map('t', '<c-\\><c-\\>', '<c-\\><c-n>')
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
-- ctrl backspace
map('i', '<c-bs>', '<c-w>')

-- LUALINE
require('lualine').setup {
	sections = {
		lualine_x = {'filetype'},
	},
	options = {
		theme = 'auto',
	},
}

-- NVIM-DAP
-- require("neodev").setup()
require("dapui").setup()
require("nvim-dap-projects").search_project_config()

-- NULL-LS
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
    sources = { 
        null_ls.builtins.formatting.clang_format,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

-- MASON
-- require("mason").setup()

-- NEOVIDE-SPECIFIC
if vim.g.neovide then
  vim.o.guifont = "Fira Code:h10"
	vim.g.neovide_scale_factor = 0.70
  vim.g.neovide_transparency = 0.95
else 
	cmd'hi Normal guibg=NONE ctermbg=NONE'
end

-- COMPLETION
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- LATEX
g.vimtex_view_method = 'mupdf'
local maplocalleader = ','
g.vimtex_view_general_options = '-reuse-instance u/pdf'
cmd'au User VimtexEventCompileSuccess silent :exe "!pkill -HUP mupdf"'

-- tfm.nvim
vim.api.nvim_set_keymap("n", "<C-t>", "", {
	noremap = true,
	callback = require("tfm").open,
})

-- startup.nvim
require("startup").setup({theme = "startify"})

-- COMMENTS
cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]

-- QUICKSCOPE
g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- MARKDOWN
g.mkdp_auto_start = 0
g.mkdp_refresh_slow = 1

-- VISUAL-WHITESPACE
require("visual-whitespace").setup({
     highlight = { link = 'Visual' },
     space_char = '·',
     tab_char = '→',
     nl_char = '↲',
     cr_char = '←'
})

-- PACKER
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'sainnhe/sonokai'
    use 'morhetz/gruvbox'
		use { "catppuccin/nvim", as = "catppuccin" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'rstacruz/vim-closer'
    use 'tpope/vim-endwise'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'michaeljsmith/vim-indent-object'

    -- use {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     requires = { 'nvim-lua/plenary.nvim' }
    -- }

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'folke/neodev.nvim'
    use 'ldelossa/nvim-dap-projects'

		use 'Rolv-Apneseth/tfm.nvim'

    use { 
        'neoclide/coc.nvim',
        branch = 'release'
    }

		use {
			'jose-elias-alvarez/null-ls.nvim',
			requires = { 'https://github.com/nvim-lua/plenary.nvim' }
		}

    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	}

	use {
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		}
	}

	use 'tikhomirov/vim-glsl'
	use 'NLKNguyen/vim-maven-syntax'

	use 'unblevable/quick-scope'

	use({
			"iamcco/markdown-preview.nvim",
			run = function() vim.fn["mkdp#util#install"]() end,
	})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	use 'mcauley-penney/visual-whitespace.nvim'

	use 'neovim/nvim-lspconfig'
end)
