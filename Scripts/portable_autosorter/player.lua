-- Declarations --
local ui = require('openmw.ui')
local interfaces = require('openmw.interfaces')
local core = require('openmw.core')
local ambient = require('openmw.ambient')

local favoriteItems = {}

-- Event Handlers --
local function sortingComplete()
    ambient.playSound("spellmake success")
    ui.showMessage("Sorting complete!")
end

-- retrieve favorites from InventoryExtender if it's available, otherwise return an empty list
local function getFavorites(origin)
    if (core.contentFiles ~= nil and not core.contentFiles.has("InventoryExtender.omwscripts")) then 
        return {}
    end
    local ctx = interfaces.InventoryExtender.getContext()
    local favorites = ctx.favoriteItems
    favoriteItems = {}
    for itemID, _ in pairs(favorites) do
        table.insert(favoriteItems, itemID)
    end
    origin:sendEvent("updateFavorites", favoriteItems)
end

-- Return --
return {
    eventHandlers = {
        sortingComplete = sortingComplete,
        getFavorites = getFavorites,
    }
}