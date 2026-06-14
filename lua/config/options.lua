vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.virtualedit = "block"

vim.opt.iskeyword:append("-")

if vim.g.vscode then
  local ok, vscode = pcall(require, "vscode")
  if ok then
    vim.notify = vscode.notify
  end
end