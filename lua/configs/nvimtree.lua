local status_ok, nvimtree = pcall(require, "nvim-tree")

if not status_ok then
	return
end
local configs = {
	filters = {
		dotfiles = false,
	},
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	-- ignore_ft_on_setup = { "alpha" },
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 25,
		hide_root_folder = true,
		mappings = {
			list = {
				{ key = "s", action = "split", mode = "n" },
				{ key = "i", action = "vsplit", mode = "n" },
				{ key = "O", action = "system_open", mode = "n" },
				{ key = "<C-k>", action = "" },
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	git = {
		enable = true,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		highlight_git = false,
		highlight_opened_files = "none",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			}, },

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

vim.g.nvimtree_side = configs.view.side

nvimtree.setup(configs)
