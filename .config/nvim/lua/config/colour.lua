require("colorizer").setup({
	'*' -- Enable in all files (Lazy loading takes care of this)
},
{
	css_fn = true, -- Enable all CSS functions: rgb_fn, hsl_fn
	names = false, -- "Name" codes like Blue
	mode = "background"
})
