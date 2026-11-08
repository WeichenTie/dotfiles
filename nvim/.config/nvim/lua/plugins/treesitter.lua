return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"angular",
			"c",
			"lua",
			"python",
			"json",
			"yaml",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
			"query",
			"elixir",
			"heex",
			"javascript",
			"html",
			"typescript",
			"tsx",
			"php",
			"scss",
			"css",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
				if not (lang and vim.treesitter.language.add(lang)) then
					return
				end
				vim.treesitter.start(ev.buf, lang)
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
