local M = {}

M.insert_template = function(template)
  local template_path = vim.fn.expand('~/.config/nvim/cp_templates/' .. template .. '.templ')
  if vim.fn.filereadable(template_path) == 1 then
    vim.cmd('read ' .. template_path)
  else
    print("Template not found: " .. template)
  end
end

return M
