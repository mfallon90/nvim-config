local fn = vim.fn

-- Install packer automatically
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer, close and reopen neovim..."
	vim.cmd [[packadd packer.nvim]]
end


-- autocommand to reload neovim whenever plugins.lua is written to
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]


-- protected call so we don't error out on first use of packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- use a pop up window for packer
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install plugins here
return packer.startup(function(use)

use "wbthomason/packer.nvim"		-- install packer
use "nvim-lua/popup.nvim"			-- popup API in neovim
use "nvim-lua/plenary.nvim"			-- lua functions used in lots of plugins
use "lunarvim/colorschemes"			-- add color schemes from youtube dude
use "folke/tokyonight.nvim"			-- add tokyo night color scheme
use "nvim-telescope/telescope.nvim" -- install telescope plugin

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
