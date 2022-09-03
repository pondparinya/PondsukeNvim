local extension = {}


extension.project = {
	base_dirs = {
		"~/go/src",
		-- { "~/dev/src2" },
		-- { "~/dev/src3", max_depth = 4 },
		-- { path = "~/dev/src4" },
		-- { path = "~/dev/src5", max_depth = 2 },
	},
	hidden_files = true, -- default: false
	-- theme = "dropdown",
}

-- extension.file_browser = {
-- 	theme = "ivy",
-- 	initial_mode = "normal",
-- 	-- disables netrw and use telescope-file-browser in its place
-- 	hijack_netrw = true,
-- 	mappings = {
-- 		["i"] = {
-- 			-- your custom insert mode mappings
-- 		},
-- 		["n"] = {
-- 			-- your custom normal mode mappings
-- 		},
-- 	},
-- }

return extension
