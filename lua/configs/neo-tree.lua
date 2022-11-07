local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end
local icons = require("utils.icons")
neotree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      -- filesystem = icons.explorer.FolderClosed,
      -- buffers = icons.explorer.DefaultFile,
      -- git_status = icons.explorer.Git,
      -- diagnostics = icons.explorer.Diagnostic,
    },
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      -- folder_closed = icons.explorer.FolderClosed,
      -- folder_open = icons.explorer.FolderOpen,
      -- folder_empty = icons.explorer.FolderEmpty,
      -- default = icons.explorer.DefaultFile,
    },
    git_status = {
      symbols = {
        -- added = icons.explorer.GitAdd,
        -- deleted = icons.explorer.GitDelete,
        -- modified = icons.explorer.GitDelete,
        -- renamed = icons.explorer.GitRenamed,
        -- untracked = icons.explorer.GitUntracked,
        -- ignored = icons.explorer.GitUntracked,
        -- unstaged = icons.explorer.GitUnstaged,
        -- staged = icons.explorer.GitStaged,
        -- conflict = icons.explorer.GitConflict,
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt_local.signcolumn = "auto"
      end,
    },
  },
})
