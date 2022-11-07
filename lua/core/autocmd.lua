-- autocmds
local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd("BufEnter", {
  desc = "Open Neo-Tree on startup with directory",
  -- group = "neotree_start",
  callback = function()
    local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
    if stats and stats.type == "directory" then
      require("neo-tree.setup.netrw").hijack()
    end
  end,
})

-- autocmd("BufDelete", {
-- 	callback = function(args)
-- 		for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
-- 			local bufs = vim.t[tab].bufs
-- 			if bufs then
-- 				for i, bufnr in ipairs(bufs) do
-- 					if bufnr == args.buf then
-- 						table.remove(bufs, i)
-- 						vim.t[tab].bufs = bufs
-- 						break
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end,
-- })

-- autocmd({ "BufAdd", "BufEnter" }, {
-- 	callback = function(args)
-- 		if vim.t.bufs == nil then
-- 			vim.t.bufs = { args.buf }
-- 		else
-- 			local bufs = vim.t.bufs

-- 			-- check for duplicates
-- 			if not vim.tbl_contains(bufs, args.buf) and (args.event == "BufAdd" or vim.bo[args.buf].buflisted) then
-- 				table.insert(bufs, args.buf)
-- 				vim.t.bufs = bufs
-- 			end
-- 		end
-- 	end,
-- })

-- vim.cmd [[autocmd BufReadPost,FileReadPost * normal zR ]]
