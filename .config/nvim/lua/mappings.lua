local map = vim.keymap.set

function ReplaceWords()
  if not ( vim.bo.filetype:match("text") or vim.bo.filetype:match("markdown") ) then
    return
  end

	local rpt = {
		{ "\\.\\.\\.", "…" },
		{ "---", "—" },
		{ "--", "–" },
    { "!!", "‼" },
    { "?!", "⁈" },
	}

	for _, value in ipairs(rpt) do
		vim.cmd("silent! %s/" .. value[1] .. "/" .. value[2] .. "/g")
	end
end

-- terminal
map("n", "<leader>t", "<cmd>20split term://zsh<CR>", { desc = "Create new [t]erminal" })
map("n", "<leader>cd", "<cmd>cd %:h<CR>", { desc = "[C]hange [d]irectory to directory of current file" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<leader>qr", ":lua ReplaceWords()<CR>", { desc = "Replace some shit" })
vim.cmd({ cmd = "tnoremap", args = { "<ESC>", "<C-\\><C-n>" } })

-- snacks
map("n", "<leader>e", "<cmd>lua Snacks.explorer()<CR>", { desc = "[E]xplorer" })
