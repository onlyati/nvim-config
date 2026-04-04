local M = {}

M.synax_list = {}

---Add language syntax that will be installed by treesitter
---@param list string[]
function M.add(list)
    for _, server in ipairs(list) do
        M.synax_list[server] = true
    end
end

---Convert the set to table that is accepted by treesitter
---@return string[] List for the treesitter
function M.get_lists()
    local list = {}
    for k, _ in pairs(M.synax_list) do table.insert(list, k) end
    return list
end

return M
