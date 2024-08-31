local M = {}
M.insert_template = function(template)
  local template_path = vim.fn.expand('~/.config/nvim/cp_templates/' .. template .. '.templ')
  if vim.fn.filereadable(template_path) == 1 then
    local lines = vim.fn.readfile(template_path)
    local cursor_line = vim.fn.line('.')
    
    vim.api.nvim_put(lines, "l", true, false)
    
    -- Find the line number of "void solve()" function
    local solve_line = 0
    for i, line in ipairs(lines) do
      if line:match("void%s+solve%s*%(%) *{?") then
        solve_line = i
        break
      end
    end
    
    -- If "void solve()" is found, move the cursor to the line below it
    if solve_line > 0 then
      local new_line = cursor_line + solve_line + 1 -- +1 to move to the next line
      local last_line = vim.fn.line('$')
      if new_line <= last_line then
        vim.api.nvim_win_set_cursor(0, {new_line, 0})
        vim.cmd('normal! ^') -- Move to the first non-blank character of the line
        print("Main Template inserted.")
      else
        print("Template inserted. 'void solve()' found but cursor not moved (beyond file end).")
      end
    else
      print("Template inserted: " .. template)
    end
  else
    print("Template not found: " .. template)
  end
end
return M
