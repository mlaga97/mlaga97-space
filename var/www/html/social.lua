parseTagTree = require("parseTagTree")

site = require("site")
createNavbar = require("navbar")
createHeader = require("header")

function social(href, src)
	return {
		["<"] = "a",
		["href"] = href,
		[">"] = {
			["<"] = "img",
			["class"] = "social",
			["src"] = src,
			["width"] = "100",
			["height"] = "100",
		}
	}
end

cover = {
	["<"] = "div",
	["class"] = "cover inner",
	[">"] = {
		social("https://facebook.com/luc.lagarde.1", "./assets/image/social/facebook-2-128.png"),
		social("https://twitter.com/mlaga97", "./assets/image/social/twitter-2-128.png"),
		social("https://google.com/+LucLagarde97", "./assets/image/social/google-plus-2-128.png"),
		social("https://github.com/mlaga97/", "./assets/image/social/github-7-128.png"),
		social("https://linkedin.com/in/mlaga97", "./assets/image/social/linkedin-2-128.png"),
		social("https://youtube.com/c/LucLagarde97", "./assets/image/social/youtube-2-128.png"),
		
		--"./assets/social/flickr-2-128.png"
		--"./assets/social/stackoverflow-2-128.png"
		--"./assets/social/vimeo-2-128.png"
		--"./assets/social/instagram-2-128.png"
		--"./assets/social/deviantart-2-128.png"
		--"./assets/social/last-fm-2-128.png"
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
						createNavbar("Social"),
						cover
					}
				}
			}
		},
		unpack(site.scripts)
	}
}

header = createHeader(
	{ ["stylesheet"] = "./assets/css/social.css" },
	{ ["description"] = "Social media links" },
	{ ["title"] = "Social" }
)

function handle(r)
    r.content_type = "text/html" -- set the output to text/html
	
	parseTagTree({
		["<"] = "html",
		[">"] = { header, body, site.span }
	}, "", "\t", function(s) r:puts(s) end);
    
    return apache2.OK
end
