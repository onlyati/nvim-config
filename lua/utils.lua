local M = {}

local severity_icon = {
    [vim.diagnostic.severity.ERROR] = "", -- nf-fa-times_circle
    [vim.diagnostic.severity.WARN]  = "", -- nf-fa-warning
    [vim.diagnostic.severity.INFO]  = "", -- nf-fa-info_circle
    [vim.diagnostic.severity.HINT]  = "", -- nf-fa-lightbulb_o
}

---Diagnostic error format
---@param diag vim.Diagnostic
---@return string??
local function diag_format(diag)
    local template = severity_icon[diag.severity] .. " " .. diag.message
    if diag.source ~= nil then
        template = severity_icon[diag.severity] .. " " .. diag.source .. ": " .. diag.message
    end
    return template
end

function M.toogleDiagLines()
    if vim.g.diag_lines then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = {
                format = diag_format
            },
        })
        vim.g.diag_lines = false
    else
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = {
                format = diag_format
            },
        })
        vim.g.diag_lines = true
    end
end

function M.close_other_buffers()
    local current = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
        if buf ~= current and vim.api.nvim_buf_is_valid(buf) then
            local bt = vim.bo[buf].buftype
            local listed = vim.bo[buf].buflisted

            if listed and bt == "" then
                pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end
        end
    end
end

function M.pick_diagnostics()
    local diags = vim.diagnostic.get(0)

    local items = vim.tbl_map(function(d)
        local src     = d.source or "unknown"
        local icon    = severity_icon[d.severity] or "?"
        local lnum    = (d.lnum or 0) + 1
        local col     = (d.col or 0) + 1
        local start_l = (d.lnum or 0) + 1
        local start_c = (d.col or 0)
        local end_l   = (d.end_lnum or d.lnum or 0) + 1
        local end_c   = (d.end_col or d.col or 0)

        return {
            bufnr    = d.bufnr or 0,
            lnum     = lnum,
            col      = col,
            end_lnum = (d.end_lnum or d.lnum or 0) + 1,
            end_col  = (d.end_col or d.col or 0) + 1,

            text     = string.format(
                " %s %s: %s (%d:%d-%d:%d)",
                icon,
                src,
                d.message,
                start_l,
                start_c,
                end_l,
                end_c
            ),

            _diag    = d,
        }
    end, diags)

    local pick = require("mini.pick")
    pick.start({
        source = {
            name = "Diagnostics",
            items = items,

            show = function(buf_id, items_to_show, _)
                local lines = vim.tbl_map(function(it) return it.text end, items_to_show)
                vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
            end,
        },

        action = function(item)
            vim.api.nvim_set_current_buf(item.bufnr)
            vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
        end,
    })
end

return M
