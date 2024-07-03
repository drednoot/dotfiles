vim.keymap.set('n', '<SPACE>', '<Nop>')

-- i hate jumping lines
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')

--tabs and stuff
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-s>', '<C-w>s')
vim.keymap.set('n', '<C-v>', '<C-w>v')
vim.keymap.set('n', '<C-,>', '3<C-w><')
vim.keymap.set('n', '<C-.>', '3<C-w>>')
vim.keymap.set('n', '<C-=>', '3<C-w>+')
vim.keymap.set('n', '<C-->', '3<C-w>-')

-- ctrl backspace
vim.keymap.set('i', '<c-bs>', '<c-w>')
