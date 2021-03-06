parseTagTree = require("parseTagTree")

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
			[">"] = "Welcome"
		},
		{
			["<"] = "p",
			["class"] = "lead",
			[">"] = {
				"to a world of electronics, programming, 3d printing,",
				{ ["<"] = "br" },
				"longboarding, and the fantastic amalgamations",
				{ ["<"] = "br" },
				"that tend to arise when you smash them",
				{ ["<"] = "br" },
				"all together at high speeds."
			}
		},
		--[[{
			["<"] = "p",
			["class"] = "lead",
			[">"] = {
				["<"] = "a",
				["class"] = "btn btn-lg btn-default",
				["href"] = "./Cover_Bootstrap.html",
				[">"] = "Learn More"
			}
		}]]
	}
}

footer = {
	["<"] = "div",
	["class"] = "mastfoot",
	[">"] = {
		["<"] = "div",
		["class"] = "inner",
		[">"] = {
			["<"] = "p",
			[">"] = {
				"Built with ",
				{
					["<"] = "a",
					["href"] = "http://getbootstrap.com/",
					[">"] = "Bootstrap"
				}
			}
		}
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
						createNavbar("Home"),
						cover,
						footer
					}
				}
			}
		},
		unpack(site.scripts)
	}
}

header = createHeader(
	{ ["stylesheet"] = "./assets/css/index.css" },
	{ ["description"] = "Homepage" },
	{ ["title"] = "Home" }
)

function handle(r)
    r.content_type = "text/html" -- set the output to text/html
	
	parseTagTree({
		["<"] = "html",
		[">"] = { header, body, site.span }
	}, "", "\t", function(s) r:puts(s) end);
    
    return apache2.OK
end
