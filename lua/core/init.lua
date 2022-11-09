---> announcement pondnvim is variable globals
_G.pondnvim = {}

local fn = vim.fn

---> Set local packer path
pondnvim.packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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
end

pondnvim.system_open = function(path)
  path = path or vim.fn.expand("<cfile>")
  if vim.fn.has("mac") == 1 then
    -- if mac use the open command
    vim.fn.jobstart({ "open", path }, { detach = true })
  elseif vim.fn.has("unix") == 1 then
    -- if unix then use xdg-open
    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
  else
    -- -- if any other operating system notify the user that there is currently no support
    -- astronvim.notify("System open is not supported on this OS!", "error")
  end
end

---> LSP configs on/off
pondnvim.lsp = {
  code_lens_refresh = true,
  document_highlight = true,
  nvim_navic = true,
  aerial = false,
  semantic_highlighting = false,
  tag_func = true,
  format_expr = true,
}

return pondnvim
