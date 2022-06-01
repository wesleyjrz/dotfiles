require("colorizer").setup({
	'*' -- Enable in all files (Lazy loading takes care of this)
},
{
	rgb_fn = true, -- Enable all RGB functions
	hsl_fn = true, -- Enable all HSL functions
	names = false, -- "Name" codes like Blue
	mode = "background"
})
