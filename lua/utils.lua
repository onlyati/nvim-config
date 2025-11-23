local M = {}

function M.close_other_buffers()
    local current = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end

return M
