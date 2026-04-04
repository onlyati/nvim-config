local registry = require("mason_list")
registry.add_lsp({
    "lua_ls", -- For Lua
})

local syntax = require("treesitter_list")
syntax.add({
    "lua",
    "luadoc",
    "luap",
})

vim.lsp.config('lua_ls', {
    on_init = function(client)
        client.server_capabilities.colorProvider = false
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library',
                    -- '${3rd}/busted/library',
                },
            },
        },
    },
})
