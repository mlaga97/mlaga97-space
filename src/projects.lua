site = require("site")
createNavbar = require("navbar")
createHeader = require("header")

cover = {
	["<"] = "div",
	["class"] = "cover inner",
	[">"] = {
		{
			["<"] = "h1",
			["class"] = "cover-heading",
			[">"] = "Well, I suppose this site is a project..."
		},
	}
}

body = {
	["<"] = "body",
	[">"] = {
		{
			["<"] = "div",
			["class"] = "site-wrapper",
			[">"] = {
				["<"] = "div",
				["class"] = "site-wrapper-inner",
				[">"] = {
					["<"] = "div",
					["class"] = "cover-container",
					[">"] = {
						createNavbar("Projects"),
						cover
					}
				}
			}
		},
		unpack(site.scripts)
	}
}

header = createHeader(
	{ ["stylesheet"] = "./projects.css" },
	{ ["description"] = "Project home" },
	{ ["title"] = "Projects" }
)

parseTagTree({
	["<"] = "html",
	[">"] = { header, body, site.span }
});
