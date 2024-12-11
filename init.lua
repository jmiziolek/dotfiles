vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-rhubarb',
  'jghauser/mkdir.nvim',
  'chrisbra/matchit',
  'ericbn/vim-solarized',
  'airblade/vim-rooter',
  'wellle/targets.vim', -- additional text-objects
  'nvim-lua/plenary.nvim',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-abolish',
  'tpope/vim-eunuch',
  'vim-scripts/YankRing.vim',
  'ntpeters/vim-better-whitespace',
  'sickill/vim-pasta',      -- better pasting
  'terryma/vim-expand-region',
  'janko/vim-test',
  'farmergreg/vim-lastplace',
  'liuchengxu/vim-which-key',
  'mazubieta/gitlink-vim',
  'wsdjeg/vim-fetch', -- jump to file location from stack trace
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true
vim.o.gdefault = true
vim.o.showmatch = false
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ruler = true
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.laststatus = 2
vim.o.linespace = 2
vim.o.incsearch = true
vim.o.wrap = false
vim.o.title = true
vim.o.scrolloff = 8             -- Number of lines from vertical edge to start scrolling
vim.o.sidescrolloff = 15        -- Number of cols from horizontal edge to start scrolling
vim.o.sidescroll = 5            -- Number of cols to scroll at a time
vim.o.modelines = 0             -- prevents some security exploits
vim.wo.number = true            -- Make line numbers default
vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true        -- Enable break indent
vim.o.undofile = true           -- Save undo history
vim.o.undolevels = 10000
vim.o.undoreload = 10000
vim.o.history = 10000
vim.o.scrollback = 100000
vim.o.colorcolumn = "80"
vim.o.winheight = 30
vim.o.winwidth = 80
vim.o.ignorecase = true   -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250    -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true
vim.o.autoread = true
vim.o.spell = true
vim.o.spelllang = 'pl'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autochdir = true
vim.g.lexima_enable_space_rules = 0 -- Lexima does not double spaces

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
--
vim.keymap.set({ 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- edit and source vimrc file
vim.keymap.set('n', '<leader>ev', ':e $MYVIMRC<CR>', { silent = true });
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { silent = true });

-- move between buffers with arrows
vim.keymap.set('n', '<C-right>', ' :bn<cr>', {})
vim.keymap.set('n', '<C-left>', ' :bp<cr>', {})


-- stop highlight of search
vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', { silent = true });

vim.keymap.set({ 'n', 'v', 'o' }, 'Q', '<Nop>', { silent = true })


-- Map escape key to smash jk -- much faster
vim.keymap.set('i', 'jk', '<Esc>', { silent = true });
vim.keymap.set('i', 'kj', '<Esc>', { silent = true });

-- Map space to command mode :
vim.keymap.set('n', '<Space>', ':', { silent = false });


-- easy split movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

vim.keymap.set('n', 'D', 'd$', { silent = true })

-- Home & End replacement with capitalized directions
vim.keymap.set({ 'n', 'v' }, 'H', '^', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { silent = true })

--  Make Y behave like other capitals
vim.keymap.set('n', 'Y', 'y$', { silent = true })

-- Open last/alternate buffer
vim.keymap.set('n', '<leader><leader>', '<C-^>', { silent = true })

-- Fast saving
vim.keymap.set('n', '<leader>w', ':w!<cr>', { silent = true })

-- change directory to current file
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { silent = true, noremap = true })

-- better block indent
vim.keymap.set('v', '<', '<gv', { silent = true, noremap = true })
vim.keymap.set('v', '>', '>gv', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>s', ':Git<CR>', {})
vim.keymap.set('n', '<leader>d', ':Gdiff<CR>', {})
vim.keymap.set('n', '<leader>c', ':Git commit<CR>', {})
vim.keymap.set('n', '<leader>p', ':Git push<CR>', {})

vim.keymap.set('n', '<leader>F', ':!open %:p:h<CR>', {})
vim.keymap.set('n', '<leader>t', ':!open -a iTerm.app %:p:h<CR>', {})
vim.keymap.set('n', '<leader>ch', ':!open -a "Google Chrome" %<CR>', {})

vim.keymap.set('n', '<leader>q', '<Plug>(prettier-format)', {}) -- formatting in normal mode
vim.keymap.set('x', '<leader>q', '<Plug>(prettier-format)', {}) -- range_formatting in visual mode

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('n', '<leader>md', ':MarkdownPreview<cr>', { silent = true })

--  toggle gundo
vim.keymap.set('n', '<leader>u', ':MundoToggle<cr>', { silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>tr', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>td', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('<leader>ti', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>ty', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>tD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction') -- fixes and refactors
  nmap('<leader>tf', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  sqlls = {},
  yamlls = {},
  terraformls = {},
  marksman = {},
  jsonls = {},
  eslint = {},
  dockerls = {},
  -- denols = {}, https://stackoverflow.com/a/74892021 tsserver and deno cant work together
  bashls = {},
  docker_compose_language_service = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- MACROS
--
-- Refactor js function to fat arrow ES6
vim.fn.setreg('e', 'dwf)a => ')
-- Change to http and switch domain to localhost
vim.fn.setreg('w', 'fsxf/lldt/ilocalhost:3000')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
