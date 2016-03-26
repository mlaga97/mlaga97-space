local pages = {
	{ name = "Home", href = "./index.lua" },
	{ name = "Projects", href = "./projects.lua" },
	{ name = "Social", href = "./social.lua" },
}

local function createNavbar(selection)
	derp = {}
	
	for x,y in ipairs(pages) do
		derp[x] = {
			["<"] = "li",
			[">"] = {
				["<"] = "a",
				["href"] = y.href,
				[">"] = y.name
			}
		}
		
		if y.name == selection then
			derp[x]["class"] = "active"
		end
	end
	
	return {
		["<"] = "div",
		["class"] = "navbar navbar-default navbar-fixed-top",
		[">"] = {
			["<"] = "div",
			["class"] = "container",
			[">"] = {
				{
					["<"] = "h3",
					["class"] = "navbar-brand",
					[">"] = "mlaga97"
				},
				{
					["<"] = "ul",
					["class"] = "nav navbar-nav navbar-right",
					[">"] = derp
				}
			}
		}
	}
end

return createNavbar
