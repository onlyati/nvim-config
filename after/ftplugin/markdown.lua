local is_float = vim.api.nvim_win_get_config(0).relative ~= ""

if is_float then
    vim.opt_local.colorcolumn = ""
    vim.opt_local.spell = false
else
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "hu,en"
end
