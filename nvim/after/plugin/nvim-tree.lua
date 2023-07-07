-- nvim-tree-config.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end



nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,

    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
        enable = false,
    },
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    filters = {
        custom = { ".git" },
        exclude = { ".gitignore" },
    },
    renderer = {

        add_trailing = false,
        root_folder_modifier = ":t",
        highlight_opened_files = "icon",
        -- These icons are visible when you install web-devicons
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",

                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,

            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,

                folder_arrow = true,
                git = true,

            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",

                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",

            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = "left",
    }

})

-- style
vim.cmd([[hi NvimTreeWinSeparator guifg=#0F111A guibg=NONE]])

-- Automatic closing wenn changing buffer in tree 
vim.g.nvim_tree_auto_close = 1
vim.cmd([[
  autocmd BufEnter * lua if vim.api.nvim_win_get_number(0) > 1 and vim.b.previous_bufnr then vim.api.nvim_buf_delete(vim.b.previous_bufnr, { force = true }) end

]])

-- Keybindings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>t', '<Cmd>NvimTreeToggle<CR>', opts)
