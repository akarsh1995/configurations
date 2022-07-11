-- general
lvim.log.level = "warn"
lvim.format_on_save = true

lvim.colorscheme = "tokyonight"
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

vim.g.tokyonight_style = "storm" --	The theme comes in three styles, storm, a darker variant night and day.
vim.g.tokyonight_terminal_colors = true --	Configure the colors used when opening a :terminal in Neovim
vim.g.tokyonight_italic_comments = true --	Make comments italic
vim.g.tokyonight_italic_keywords = true --	Make keywords italic
vim.g.tokyonight_italic_functions = true --	Make functions italic
vim.g.tokyonight_italic_variables = false --	Make variables and identifiers italic
vim.g.tokyonight_transparent = false --	Enable this to disable setting the background color
vim.g.tokyonight_hide_inactive_statusline = false --	Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
vim.g.tokyonight_sidebars = {} --	Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
vim.g.tokyonight_transparent_sidebar = false --	Sidebar like windows like NvimTree get a transparent background
vim.g.tokyonight_dark_sidebar = true --	Sidebar like windows like NvimTree get a darker background
vim.g.tokyonight_dark_float = true --	Float windows like the lsp diagnostics windows get a darker background.
vim.g.tokyonight_colors = {} --	You can override specific color groups to use other groups or a hex color
vim.g.tokyonight_day_brightness = 0.3 --	Adjusts the brightness of the colors of the Day style. Number between 0 and 1, from dull to vibrant colors
vim.g.tokyonight_lualine_bold = false --	When true, section headers in the lualine theme will be bold

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml"
}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings


-- Additional Plugins
lvim.plugins = {
  {'nickeb96/fish.vim'},
  {'neovim/nvim-lspconfig'},
  {'simrat39/rust-tools.nvim'},
  {"folke/tokyonight.nvim"},
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    "folke/trouble.nvim"
  },
  {
    "tpope/vim-surround",
  }
}

-- Hop mappings
require('hop').setup()
require('rust-tools').setup({})


vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})


-- Trouble mappings
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    t = {"<cmd>Trouble document_diagnostics<cr>", "Diagnostics"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    w = {"<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics"}
}


lvim.builtin.which_key.mappings["lR"] = {
    name = "+Rust",
    r = {"<cmd>RustRunnables<cr>", "Runnables"},
    i = {"<cmd>RustSetInlayHints<cr>", "RustSetInlayHints"},
    t = {"<cmd>RustToggleInlayHints<cr>", "RustToggleInlayHints"},
    e = {"<cmd>RustExpandMacro<cr>", "RustExpandMacro"},
    o = {"<cmd>RustOpenCargo <cr>", "RustOpenCargo"},
    p = {"<cmd>RustParentModule<cr>", "RustParentModule"},
    j = {"<cmd>RustJoinLines<cr>", "RustJoinLines"},
    h = {"<cmd>RustHoverActions<cr>", "RustHoverActions"},
    d = {"<cmd>RustMoveItemDown<cr>", "RustMoveItemDown"},
    u = {"<cmd>RustMoveItemUp<cr>", "RustMoveItemUp"},
    g = {"<cmd>RustViewCrateGraph<cr>", "RustViewCrateGraph"}
}

vim.api.nvim_set_keymap('', ';', "<cmd>RustHoverActions<cr>", {})

