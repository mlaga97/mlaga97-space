local function parseTagTree(t, indent, indenter, textDisplayer)
	indent = indent or ""
	indenter = indenter or "\t"
	textDisplayer = textDisplayer or io.write
	
	exclude = {
		["<"] = true,
		[">"] = true
	}
	c = {}
	
	-- Open Tag
	textDisplayer(indent .. "<" .. t["<"]);
	
	-- Parameters
	for x,y in pairs(t) do
		if not exclude[x] then
			textDisplayer( " " .. x .. '="' .. y .. '"')
		end
	end
	
	-- Close Tag
	if( type(t[">"]) == "nil" ) then
		textDisplayer("/>\n")
	end
	
	if( type(t[">"]) == "string" ) then
		textDisplayer(">" .. t[">"] .. "</" .. t["<"] .. ">\n")
	end
	
	if( type(t[">"]) == "table" ) then
		textDisplayer(">\n")
		
		if t[">"]["<"] then
			parseTagTree(t[">"], indent..indenter, indenter, textDisplayer)
		else			
			for x,y in ipairs(t[">"]) do
				if( type(y) == "string" ) then
					textDisplayer(indent..indenter..y.."\n")
				end
				
				if( type(y) == "table" ) then
					parseTagTree(y, indent..indenter, indenter, textDisplayer)
				end
			end
		end
		
		textDisplayer(indent .. "</" .. t["<"] .. ">\n")
	end
end

return parseTagTree
