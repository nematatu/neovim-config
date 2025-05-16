return {
    'machakann/vim-sandwich',
    lazy = false,
    config = function()
        vim.g['sandwich#recipes'] = vim.deepcopy(vim.g['sandwich#default_recipes'])
    end,
}
