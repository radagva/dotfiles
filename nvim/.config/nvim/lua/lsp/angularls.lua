local ok, mason_registry = pcall(require, "mason-registry")

if not ok then
	vim.notify("Could not load mason registry, check if installed")
	return
end

local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

local ts_probe = table.concat({
	angularls_path,
	vim.uv.cwd(),
}, ",")

local ng_probe = table.concat({
	angularls_path .. "/node_modules/@angular/language-server",
	vim.uv.cwd(),
}, ",")

local cmd = {
	"ngserver",
	"--stdio",
	"--tsProbeLocations",
	ts_probe,
	"--ngProbeLocations",
	ng_probe,
}

local config = {
	cmd = cmd,
	on_new_config = function(new_config, _)
		new_config.cmd = cmd
	end,
}

return config
