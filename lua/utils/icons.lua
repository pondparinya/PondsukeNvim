local M = {}

M.lsp = {
	server_installed = "✓",
	server_pending = "➜",
	server_uninstalled = "✗",
}
M.diagnostics = {
	Error = "",
	Hint = "",
	Information = "",
	Question = "",
	Warning = "",
}

M.NeoTree = {
	FolderClosed = "",
	FolderEmpty = "",
	DefaultFile = "",
	Git = "",
	Diagnostic = "裂",
	FolderOpen = "",
	GitAdd = "",
	GitBranch = "",
	GitChange = "",
	GitConflict = "",
	GitDelete = "",
	GitIgnored = "◌",
	GitRenamed = "➜",
	GitStaged = "✓",
	GitUnstaged = "✗",
	GitUntracked = "★",
}

return M
