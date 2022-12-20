local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end
local icons = require("utils.icons")

local config = {
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = icons.NeoTree.FolderClosed,
      buffers = icons.NeoTree.DefaultFile,
      git_status = icons.NeoTree.Git,
      diagnostics = icons.NeoTree.Diagnostic,
    },
  },
  default_component_configs = {
    indent = { padding = 0 },
    icon = {
      folder_closed = icons.NeoTree.FolderClosed,
      folder_open = icons.NeoTree.FolderOpen,
      folder_empty = icons.NeoTree.FolderEmpty,
      default = icons.NeoTree.DefaultFile,
    },
    git_status = {
      symbols = {
        added = icons.NeoTree.GitAdd,
        deleted = icons.NeoTree.GitDelete,
        modified = icons.NeoTree.GitChange,
        renamed = icons.NeoTree.GitRenamed,
        untracked = icons.NeoTree.GitUntracked,
        ignored = icons.NeoTree.GitIgnored,
        unstaged = icons.NeoTree.GitUnstaged,
        staged = icons.NeoTree.GitStaged,
        conflict = icons.NeoTree.GitConflict,
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open",
      O = function(state)
        pondnvim.system_open(state.tree:get_node():get_id())
      end,
      H = "prev_source",
      L = "next_source",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_)
        vim.opt_local.signcolumn = "auto"
      end,
    },
  },
}

neotree.setup(config)
