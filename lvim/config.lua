-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "monokai_pro"
vim.opt.cmdheight = 1
vim.opt.clipboard = ""
lvim.transparent_window = true
lvim.leader = "space"


-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "black",
  --   extra_args = { "--line-length=120", "--exclude=E402"},
  --   filetypes = { "python" } },
  { command = "autopep8",
    extra_args = { "--max-line-length","140", "--ignore","E402"},
    filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },

  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8",
    extra_args = { "--max-line-length=130", "--ignore=E402", "--inline-quotes='\"'" },
    filetypes = { "python" } },

  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

lvim.plugins = {
    {"github/copilot.vim"},
    {"ohsirawat/monokai.nvim"},
    {"lunarvim/bigfile.nvim"},
    {"lunarvim/darkplus.nvim"},
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
    "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            RRGGBBAA = true, -- #RRGGBBAA hex codes
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
    end,
    },
}
lvim.builtin.bufferline.indicator_icon = "▎"
lvim.builtin.bufferline.options.enforce_regular_tabs = true
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.highlights.indicator_selected = {
      fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      bg = { attribute = "bg", highlight = "Normal" },
}
lvim.builtin.treesitter.highlight.enable = true

local components = require "lvim.core.lualine.components"
local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}
lvim.builtin.lualine.sections.lualine_a = { components.branch, mode }
lvim.builtin.lualine.sections.lualine_b = { components.diagnostics, components.diff }
lvim.builtin.lualine.sections.lualine_c = { components.python_env }
lvim.builtin.lualine.sections.lualine_x = { components.treesitter, components.lsp, components.filetype }
lvim.builtin.lualine.options.theme = "darkplus"
vim.api.nvim_command([[
    augroup ChangeBackgroudColor
        autocmd colorscheme * :hi linenr guibg=#
    augroup END
]])

