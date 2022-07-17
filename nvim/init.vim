:set number
:set autoindent
:set tabstop=4
:set mouse=a
:set smarttab
:set softtabstop=4
:set shiftwidth=4
:set noswapfile
:set hlsearch
:set ignorecase
:set incsearch
syntax on
" hiding tilde
highlight EndOfBuffer ctermfg=black ctermbg=black

" Keybindings
"" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-c> :NERDTreeClose<CR>
"" Telescope
nnoremap <C-t> :Telescope<CR>

:inoremap jj <ESC>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged') 

" Declare the list of plugins. 
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ms-jpq/coq_nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'preservim/NERDTree'
Plug 'shaunsingh/moonlight.nvim'

" Visual Settings
Plug 'kyazdani42/nvim-web-devicons'

" Lists ends here. Plugins become visible to Vim after this call.
call plug#end()

" Theme 
" https://github.com/SoyBison/moonlight.nvim
" require('moonlight').set()

" LSPconfig/coq_nvim 
" https://github.com/neovim/nvim-lspconfig

" Lualine
" https://github.com/nvim-lualine/lualine.nvim
lua << EOF
require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
  options = {
	icons_enabled = true,
    theme = 'moonlight',
    disabled_types = {}
  },
  sections = {
    lualine_x = {},
	-- lualine_a = {'mode'}, 
	-- lualine_b = {'branch', 'diff', 'diagnostics'},
	-- lualine_c = {'filename'}, 
	-- lualine_x = {'encoding', 'fileformat', 'filetype'},
	-- lualine_y = {'progress'},
	-- lualine_z = {'location'},
  }
})
EOF

" Treesitter
" https://github.com/nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "java", "javascript", "typescript", "html", "css", "sql", "lua", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Telescope
" https://github.com/nvim-telescope/telescope.nvim 
lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
EOF
