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
		social("https://facebook.com/luc.lagarde.1", "./assets/social/facebook-2-128.png"),
		social("https://twitter.com/mlaga97", "./assets/social/twitter-2-128.png"),
		social("https://google.com/+LucLagarde97", "./assets/social/google-plus-2-128.png"),
		social("https://github.com/mlaga97/", "./assets/social/github-7-128.png"),
		social("https://linkedin.com/in/mlaga97", "./assets/social/linkedin-2-128.png"),
		social("https://youtube.com/c/LucLagarde97", "./assets/social/youtube-2-128.png"),
		
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
	{ ["stylesheet"] = "./social.css" },
	{ ["description"] = "Social media links" },
	{ ["title"] = "Social" }
)

parseTagTree({
	["<"] = "html",
	[">"] = { header, body, site.span }
});
