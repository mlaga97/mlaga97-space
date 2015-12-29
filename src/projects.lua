site = require("site")
createNavbar = require("navbar")
createHeader = require("header")

projects = {
	[[
		<h3>This website is a project, right?</h3>
		<p><b>Problem:</b> So, I get this fancy new domain name, but I don't have any content for it.</p>
		<p><b>Solution:</b> I'm writing this site using a html preprocessor/generator that I am developing in Lua, which can be found over at my <a href="https://github.com/mlaga97/mlaga97-site">GitHub</a>. Pretty soon I'll try to document some of it here on the site itself.</p>
	]],
}

function project_list(input)	
	output = {
		["<"] = "div",
		["class"] = "row marketing",
		[">"] = {
			{
				["<"] = "div",
				["class"] = "col-lg-6",
				[">"] = {
				}
			},
			{
				["<"] = "div",
				["class"] = "col-lg-6",
				[">"] = {
				}
			},
		}
	}
	
	for x,y in ipairs(input) do
		if (x - math.floor(x/2)*2) == 1 then
			table.insert(output[">"][1][">"], y)
		else
			table.insert(output[">"][2][">"], y)
		end
	end
	
	return output
end

body = {
	["<"] = "div",
	["class"] = "container",
	[">"] = {
		{
			["<"] = "div",
			["class"] = "jumbotron",
			[">"] = [[
				<h1>Featured Projects</h1>
				<p class="lead">Descriptions and links to a few of the projects that I am currently working on.</p>
			]]
		},
		project_list(projects),
		{
			["<"] = "div",
			["class"] = "footer",
			[">"] = [[
				<p>Built with <a href="http://getbootstrap.com/">Bootstrap</a></p>
			]]
		}
	}
}

site_wrapper = {
	["<"] = "body",
	[">"] = {
		createNavbar("Projects"),
		body,
		unpack(site.scripts)
	}
}

header = createHeader(
	{ ["stylesheet"] = "./assets/css/projects.css" },
	{ ["description"] = "Project home" },
	{ ["title"] = "Projects" }
)

parseTagTree({
	["<"] = "html",
	[">"] = { header, site_wrapper, site.span }
});
