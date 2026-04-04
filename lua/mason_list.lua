local M = {}

M.lsp_servers = {}
M.tools = {}

---Add language server that will be installed by Mason and enabled as lsp.
---@param list string[]
function M.add_lsp(list)
    for _, server in ipairs(list) do
        M.lsp_servers[server] = true
    end
end

---Add tool that will be installed by Mason.
---@param list string[]
function M.add_tools(list)
    for _, tool in ipairs(list) do
        M.tools[tool] = true
    end
end

---Convert the set to table that is accepted by mason-tool-installer and mason-lspconfig.
---@return string[] LSP server list
---@return string[] Tool list
function M.get_lists()
    local servers = {}
    local tools = {}
    for k, _ in pairs(M.lsp_servers) do table.insert(servers, k) end
    for k, _ in pairs(M.tools) do table.insert(tools, k) end
    return servers, tools
end

return M
