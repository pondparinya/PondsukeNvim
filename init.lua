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
-- local code_path = vim.fn.stdpath("config") .. "/language-provider.json"
-- local content = vim.fn.readfile(code_path)
-- local provider = vim.fn.json_decode(content)

-- local servers = {}
-- local languages = require("language-provider")
-- for _, language in pairs(languages) do
-- 	if language.enable then
-- 		for i, server in pairs(language.servers) do
-- 			servers[i] = tostring(server)
-- 		end
-- 	end
-- end

-- for i, value in pairs(servers) do
-- 	print(i)
-- 	print(value)
-- end
