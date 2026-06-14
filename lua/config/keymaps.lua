-- common keymap
vim.keymap.set({ "n", "x" }, "y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "Y", '"+y$', { desc = "Yank to end of line to system clipboard" })

-- vscode keymap
if vim.g.vscode then

  local has_vscode, vscode = pcall(require, "vscode")

  local function call(action)
    return function()
      if has_vscode then
        vscode.call(action)
      else
        vim.fn.VSCodeNotify(action)
      end
    end
  end

  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
  end

  map("n", "<leader><space>", call("workbench.action.quickOpen"), "VSCode quick open")
  map("n", "<leader>/", call("workbench.action.findInFiles"), "VSCode find in files")
  map("n", "<leader>ss", call("workbench.action.gotoSymbol"), "VSCode goto symbol")

  for _, lhs in ipairs({ "<leader>ft", "<leader>fT", "<c-/>" }) do
    map({ "n", "t" }, lhs, call("workbench.action.terminal.toggleTerminal"), "VSCode toggle terminal")
  end

  map("n", "<S-h>", call("workbench.action.previousEditor"), "VSCode previous editor")
  map("n", "<S-l>", call("workbench.action.nextEditor"), "VSCode next editor")

  map("n", "gr", call("editor.action.goToReferences"), "VSCode goto references")
  map("n", "<leader>rn", call("editor.action.rename"), "VSCode rename")
  map({ "n", "x" }, "<leader>ca", call("editor.action.quickFix"), "VSCode code action")

end