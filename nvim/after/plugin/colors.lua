-- tundra
-- require('nvim-tundra').setup({
--   transparent_background = true,
--   dim_inactive_windows = {
--     enabled = false,
--     color = nil,
--   },
--   sidebars = {
--     enabled = true,
--     color = nil,
--   },
--   editor = {
--     search = {},
--     substitute = {},
--   },
--   syntax = {
--     booleans = { bold = true, italic = true },
--     comments = { bold = true, italic = true },
--     conditionals = {},
--     constants = { bold = true },
--     fields = {},
--     functions = {},
--     keywords = {},
--     loops = {},
--     numbers = { bold = true },
--     operators = { bold = true },
--     punctuation = {},
--     strings = {},
--     types = { italic = true },
--   },
--   diagnostics = {
--     errors = {},
--     warnings = {},
--     information = {},
--     hints = {},
--   },
--   plugins = {
--     lsp = true,
--     treesitter = true,
--     telescope = true,
--     nvimtree = true,
--     cmp = true,
--     context = true,
--     dbui = true,
--     gitsigns = true,
--     neogit = true,
--   },
--   overwrite = {
--     colors = {},
--     highlights = {},
--   },
-- })

-- catppuccin
-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = true,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {
--         all = {
--             text = "#ffffff",
--         },
--         mocha = {
--             base = "#1e1e2e",
--         },
--         frappe = {},
--
--         macchiato = {},
--         latte = {},
--     },
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })


-- everfrost
require("everforest").setup({
  -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  -- Default is "medium".
  background = "medium",

  -- How much of the background should be transparent. Options are 0, 1 or 2.
  -- Default is 0.

  --
  -- 2 will have more UI components be transparent (e.g. status line
  -- background).
  transparent_background_level = 2,
  -- Whether italics should be used for keywords, builtin types and more.
  italics = false,
  -- Disable italic fonts for comments. Comments are in italics by default, set
  -- this to `true` to make them _not_ italic!
  disable_italic_comments = false,
})

function ColorMyPencils(color)
    color = color or "everforest"
    vim.opt.background = 'dark'
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
