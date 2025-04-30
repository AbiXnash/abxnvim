return {
    'nvim-java/nvim-java',
    dependencies = {
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-refactor',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        'neovim/nvim-lspconfig',
        'mfussenegger/nvim-dap',
        { 'williamboman/mason.nvim', },
    },
    {
        "JavaHello/spring-boot.nvim",
        ft = "java",
        dependencies = {
            "ibhagwan/fzf-lua", -- optional
        },
    }
}
