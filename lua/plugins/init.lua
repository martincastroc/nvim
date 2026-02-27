return{
    {'kyazdani42/nvim-web-devicons'},
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },
    {'github/copilot.vim'},
}

