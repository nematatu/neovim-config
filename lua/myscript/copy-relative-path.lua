local M = {}

function M.copy_relative_file_path()
    local absolute_file_path = vim.api.nvim_buf_get_name(0)
    local git_path = vim.fn.system("git rev-parse --show-toplevel")

    local relative_file_path = "/" .. string.sub(absolute_file_path, git_path:len() + 1)
    local copy_command = "echo " .. "\"." .. relative_file_path .. "\"" .. " | pbcopy"
    vim.fn.system(copy_command)
    print(relative_file_path)
    print("command:" .. copy_command)
    return true
end

return M
