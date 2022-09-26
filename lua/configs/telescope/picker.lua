local picker = {}

picker.find_files = {
	file_ignore_patterns = { "node_modules", ".git" },
	path_display = { "tail" },
	theme = "dropdown",
	mappings = {},
}

return picker
