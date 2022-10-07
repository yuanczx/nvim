vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer 插件管理
	use 'wbthomason/packer.nvim'
    -- 代码补全
	use { 'neoclide/coc.nvim', branch = 'release' }
    -- Onedark 主题
	use 'navarasu/onedark.nvim'
    -- 图标
	use 'kyazdani42/nvim-web-devicons'
    -- Markdown preview
    use 'iamcco/markdown-preview.nvim'
    -- 文件浏览
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
    -- 状态栏
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
    -- 快捷注释插件
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
