return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			cloak_character = "*",
			-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = "Comment",
			patterns = {
				{
					-- Match any file starting with ".env".
					-- This can be a table to match multiple file patterns.
					file_pattern = {
						".env*",
						"zurlenv",
						".zsh_config",
						".dev.vars",
            ".curlrc",
					},
					-- Match an equals sign and any character after it.
					-- This can also be a table of patterns to cloak,
					-- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
          cloak_pattern = {
            -- foo="hithere" -> foo="*******"
            { '(=)"[^"]*', replace = '%1"' },
            -- foo='hithere' -> foo='*******'
            { "(=)'[^']*", replace = "%1'" },
            -- bar=not -> bar=***
            -- IMPORTANT: exclude quotes so it won't match foo="..."
            { '(=)[^#%s"\']+', replace = "%1" },
            -- keep the rest if you want, but make patterns valid Lua patterns
            { '^grant.*="[^"]*"', },          -- example: whole line match
            { '^https?://.+', },              -- URLs (your {^https|^http}:.+ won't do what you think)
          },
				},
			},
		})
	end,
}
