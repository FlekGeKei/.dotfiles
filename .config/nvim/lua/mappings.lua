local map = vim.keymap.set

-- terminal
map('n', '<leader>t', '<cmd>20split term://zsh<CR>', { desc = 'Create new [t]erminal' })
map('n', '<leader>cd', '<cmd>cd %:h<CR>', { desc = '[C]hange [d]irectory to directory of current file' })
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.cmd {cmd = 'tnoremap', args = { '<ESC>', '<C-\\><C-n>' } }

-- lsp 
map('n', '<Leader>rd', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', { desc = 'Render diagnostics'})

-- rustceanvim
--map('n', '<Leader>dt', '<cmd>lua vim.cmd('RustLsp testables')<CR>', { desc = 'Debugger testables (RUST)' })
map('n', '<Leader>re', '<cmd>lua vim.cmd.RustLsp("explainError")<CR>', { desc = 'Explain errors (RUST)'})
map('n', '<Leader>rj', '<cmd>lua vim.cmd.RustLsp("relatedDiagnostics")<CR>', { desc = 'Jump to related diagnostics (RUST)'})
