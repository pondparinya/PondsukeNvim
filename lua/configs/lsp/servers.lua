local code_path = vim.fn.stdpath("config") .. "/language-provider.json"
local content = vim.fn.readfile(code_path)
local providers = vim.fn.json_decode(content)

local servers_list = {} -- ex. {"gopls", "sumneko_lua"}
local check_servers_duplicate = {}
for _, provider in pairs(providers) do
	if provider.enable then
		for _, server in pairs(provider.servers) do
			table.insert(servers_list, server)
		end
	end
end

for index, server in ipairs(servers_list) do
	if check_servers_duplicate[server] then
		table.remove(servers_list, index)
	else
		check_servers_duplicate[server] = true
	end
end

return servers_list
