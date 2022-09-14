---> announcement pondnvim is variable globals
_G.pondnvim = {}

local fn = vim.fn

---> Set local packer path
pondnvim.packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- pondnvim.default_compile_path = fn.stdpath("data") .. "/packer_compiled.lua"

---> Prepare packer config
pondnvim.packer_config = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	-- compile_path = pondnvim.default_compile_path,
	git = { clone_timeout = 6000 },
	auto_clean = true,
	compile_on_sync = true,
}

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
	-- -- call packer again
	-- have_packer, _ = pcall(require, "packer")
	-- -- if packer didn't load, print error
	-- if not have_packer then
	-- 	vim.api.nvim_err_writeln("Failed to load packer at:" .. pondnvim.packer_path)
	-- 	return false
	-- end

	-- -- If you automation sync & update every time then open editor
	-- if have_packer then
	-- 	return true
	-- end
end

return pondnvim
