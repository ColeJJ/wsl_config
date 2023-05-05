local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
    'intelephense',
    'angularls',
    'emmet_ls',
    'html'
})

-- Fix undefined global var 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space'] = cmp.mapping.complete()
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, noremap = true}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "gf", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<space>gd", function() vim.diagnostics.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostics.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostics.goto_prev() end, opts)
end)

-- require 'lspconfig'.intelephense.setup {
--     settings = {
--         intelephense = {
--             stubs = {
--                 'Core',
--                 'SPL',
--                 'imagick',
--                 'standard',
--                 'pcre',
--                 'date',
--                 'json',
--                 'ctype',
--                 'SimpleXML',
--                 'Reflection'
--             }
--         }
--     }
-- }

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})