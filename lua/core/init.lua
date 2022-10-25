---> announcement pondnvim is variable globals
_G.pondnvim = {}

local fn = vim.fn

---> Set local packer path
pondnvim.packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---> Check Packer if not install it auto loads
pondnvim.initial_packer = function()
	-- try loading packer
	local have_packer, _ = pcall(require, "packer")
	-- if packer haven't, reinstall it
	if not have_packer then
		-- delete the old packer install if one exists
		vim.fn.delete(pondnvim.packer_path, "rf")
		-- clone packer
		vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			pondnvim.packer_path,
		})
		vim.cmd("packadd packer.nvim")
		return false
	end
	return true
end

---> LSP configs on/off
pondnvim.lsp = {
	code_lens_refresh = true,
	document_highlight = true,
	nvim_navic = true,
	aerial = false,
	semantic_highlighting = false,
	tag_func = true,
	format_expr = true,
}

return pondnvim
