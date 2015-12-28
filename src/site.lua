local site = {}

site.span = {
	["<"] = "span",
	["class"] = "gr__tooltip",
	[">"] = {
		{
			["<"] = "span",
			["class"] = "gr__tooltip-content"
		},
		{
			["<"] = "i",
			["class"] = "gr__tooltip-logo"
		},
		{
			["<"] = "span",
			["class"] = "gr__triangle"
		}
	}
}

site.scripts = {
		{
			["<"] = "script",
			["src"] = "./bootstrap/jquery.min.js",
			[">"] = {}
		},
		{
			["<"] = "script",
			[">"] = [[window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')]]
		},
		{
			["<"] = "script",
			["src"] = "./bootstrap/bootstrap.min.js",
			[">"] = {}
		},
		{
			["<"] = "script",
			["src"] = "./bootstrap/ie10-viewport-bug-workaround.js",
			[">"] = {}
		}
}

return site
