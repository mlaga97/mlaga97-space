site = require("site")
createNavbar = require("navbar")
createHeader = require("header")

projects = {
	--[[
		<h3>This website is a project, right?</h3>
		<p><b>Problem:</b> So, I get this fancy new domain name, but I don't have any content for it.</p>
		<p><b>Solution:</b> I'm writing this site using a html preprocessor/generator that I am developing in Lua, which can be found over at my <a href="https://github.com/mlaga97/mlaga97-site">GitHub</a>. Pretty soon I'll try to document some of it here on the site itself.</p>
	]]
	[[
		<h3>Snappy RepRap</h3>
		<p>My attempt to build yet another 3d printer. Pics soon! <a href="https://github.com/revarbat/snappy-reprap">GitHub</a> (Not Mine)</p>
	]],
	[[
		<h3>This Website</h3>
		<p>My attempt to write html without actually editing any html files. <a href="https://github.com/mlaga97/mlaga97-space">GitHub</a></p>
	]],
	[[
		<h3>Also, I bought a domain and an EC2 account</h3>
		<p>Well actually that seems fairly self-explanatory...</p>
	]],
	[[
		<h3>Network Optimizations and Lots of VM's</h3>
		<p>I'd like to be able to access my dorm room server from the internet. (I still can't.)</p>
	]],
	[[
		<h3>Parametric Glasses</h3>
		<p>Why as a matter of fact, yes, these glasses <em>are</em> 3d printed. <a href="https://github.com/mlaga97/PrintableGlasses">GitHub</a></p>
	]],
	[[
		<h3>3d Printed Filament Spool Holder</h3>
		<p>Pics and source code coming soon!</p>
	]],
	[[
		<h3>Programming on Android with Material Design</h3>
		<p>Read: take everything you learned with Swing and find somewhere to jam it.</p>
	]],
	[[
		<h3>GUI Programming with Java and Swing</h3>
		<p>In preparation for a bit of Android development.</p>
	]],
	[[
		<h3>Computerized Toaster Oven Control</h3>
		<p>For filament drying purposes, of course! <a href="https://github.com/mlaga97/ToastCommander">GitHub</a></p>
	]],
	--[[
		<h3>Hash-based Image Storage</h3>
	]]
	--[[
		<h3>Title</h3>
		<p>Description</p>
	]]
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
				<p class="lead">Descriptions of (and possibly even information about) a few of the projects that I am currently working on.</p>
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
