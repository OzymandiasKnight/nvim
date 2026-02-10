return {
	cmd = {'csharp-ls'},
	filetypes = { 'cs' },
	root_markers = {
		'.csproj',
	},
	handlers = {
		["window/showMessage"] = function() end,
		["window/logMessage"] = function() end,
	}
}
