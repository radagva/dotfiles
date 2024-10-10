return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'query',
            'vim',
            'vimdoc',
            'python',
            'typescript',
            'javascript',
            'css',
            'sql',
            'regex',
            'json',
            'yaml',
            'toml',
            'go',
            'gitignore',
            'graphql',
            'tsx'
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = {'ruby'},
        },
        indent = { enable = true, disable = {'ruby'} }
    }
}
