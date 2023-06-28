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
  'github/copilot.vim',
  'jghauser/mkdir.nvim',
  'chrisbra/matchit',
  'ericbn/vim-solarized',
  'junegunn/gv.vim',
  'airblade/vim-rooter',
  'wellle/targets.vim', -- additional text-objects
  'nvim-lua/plenary.nvim',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-abolish',
  'tpope/vim-eunuch',
  'vim-scripts/YankRing.vim',
  'ntpeters/vim-better-whitespace',
  'simnalamburt/vim-mundo', -- Gundo fork
  'godlygeek/tabular',      --filtering and alignment
  'sickill/vim-pasta',      -- better pasting
  'terryma/vim-expand-region',
  'cohama/lexima.vim',      -- parenthesis closing
  'janko/vim-test',
  'dpelle/vim-LanguageTool',
  'sedm0784/vim-you-autocorrect',
  'farmergreg/vim-lastplace',
  'liuchengxu/vim-which-key',
  'mazubieta/gitlink-vim',
  'wsdjeg/vim-fetch', -- jump to file location from stack trace

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'Equilibris/nx.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },

    keys = {
      { "-", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
        sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖", -- this can only be used in the git_status source
              renamed   = "", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        -- A list of functions, each representing a global custom command
        -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
        -- see `:h neo-tree-global-custom-commands`
        commands = {},
        window = {
          position = "current",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["P"] = function(state)
              local node = state.tree:get_node()
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end,
            ["h"] = function(state)
              local node = state.tree:get_node()
              if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                state.commands.toggle_node(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,
            ["l"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" or node:has_children() then
                if not node:is_expanded() then
                  state.commands.toggle_node(state)
                else
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
              end
            end,

          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              --".DS_Store",
              --"thumbs.db"
            },
          },
          follow_current_file = false,            -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = false,               -- when true, empty folders will be grouped together
          hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
          -- in whatever position is specified in window.position
          -- "open_current",  -- netrw disabled, opening a directory opens within the
          -- window like netrw would, regardless of window.position
          -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
          -- instead of relying on nvim autocmd events.
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
              -- ["D"] = "fuzzy_sorter_directory",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
            },
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
              ["<down>"] = "move_cursor_down",
              ["<C-n>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-p>"] = "move_cursor_up",
            },
          },

          commands = {} -- Add a custom command or override a global one using the same function name
        },
        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = true,    -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
    end,

  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  --
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  {
    -- Theme inspired by Atom
    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup({
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
      })
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',
  {
    'mhinz/vim-startify',
    config = function()
      local daystill = vim.fn.systemlist('~/dotfiles/deadline.sh')[0]
      vim.g.startify_custom_header = { daystill }
      vim.g.startify_files_number = 9
      local indicesUpToHundred = {}
      for i = 1, 100 do
        indicesUpToHundred[i] = i
      end
      vim.g.startify_custom_indices = indicesUpToHundred;
      vim.g.startify_session_persistence = 1;

      vim.g.startify_lists = {
        { header = { '   Sessions' },  type = 'sessions' },
        { header = { '   Bookmarks' }, type = 'bookmarks' },
        { header = { '   MRU' },       type = 'files' },
      }
      vim.g.startify_bookmarks = {
        { c = '~/.config/nvim/init.vim' },
        { d = '~/www/jmdocs/docs/' },
        { t = '~/Documents/todo.md' },
        { n = '~/Documents/notes.md' },
      }
    end
  },
  { 'nvim-tree/nvim-tree.lua' },
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
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.history = 10000
vim.o.scrollback = 100000
vim.o.colorcolumn = 80
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

vim.go.netrw_hijack_behavior = "open_split"
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

-- Home & End with capitalized directions
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })
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

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set({ 'n', 'v', 'o' }, '<leader><space>', require('telescope.builtin').find_files)
vim.keymap.set({ 'n', 'v', 'o' }, '<leader>b', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]ile names' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>a', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('v', '<leader>bd', '\"by<Esc>:call system(\'base64 -d\', @b)<CR>')
vim.keymap.set('v', '<leader>be', '\"by<Esc>:call system(\'base64\', @b)<CR>')
vim.keymap.set('n', '<leader>sb', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })


vim.keymap.set('n', '<leader>md', ':MarkdownPreview<cr>', { silent = true })

--  toggle gundo
vim.keymap.set('n', '<leader>u', ':MundoToggle<cr>', { silent = true })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim', 'sql' },

  -- Autoinstall languages that are not installed.
  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
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

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- MACROS
--
-- Refactor js function to fat arrow ES6
vim.fn.setreg('e', 'dwf)a => ')
-- Change to http and switch domain to localhost
vim.fn.setreg('w', 'fsxf/lldt/ilocalhost:3000')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
