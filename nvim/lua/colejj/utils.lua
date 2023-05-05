-- Define a utility function to set the keymap for the file browser buffer
function set_file_browser_keymap()
  local bufnr = vim.fn.bufnr()
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
end
