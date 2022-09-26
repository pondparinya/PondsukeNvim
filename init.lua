local status_impatient, impatient = pcall(require, "impatient")
if status_impatient then
	impatient.enable_profile()
end

for _, source in ipairs({
	"core",
	"core.autocmd",
	"core.general",
	"core.keymaps",
	"core.plugins",
	"configs.colortheme",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end
