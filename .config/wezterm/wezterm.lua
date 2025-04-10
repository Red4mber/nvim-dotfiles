
local function merge_tables(target, source)
    for k, v in pairs(source) do
        target[k] = v
    end
end

local wezterm = require 'wezterm'
local merged = {}
local modules = {
    "config.general",
    "config.appearance",
    "config.smart-splits",
}


for _, moduleName in ipairs(modules) do
    local conf = require(moduleName)
    merge_tables(merged, conf)
end

return merged
