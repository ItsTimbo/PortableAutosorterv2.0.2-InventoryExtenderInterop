-- Declarations --
local core = require("openmw.core")
local self = require('openmw.self')
local nearby = require('openmw.nearby')

local posInfo = {
    cell=self.cell.id,
    position=self.position,
    rotation=self.rotation
}

local favoriteItems = {}

-- Event Handlers --
local function updateFavorites(data)
    local next = next
    if not next(data) then
        print("Received empty favorites list.")
        return {}
    end
    favoriteItems = data
end

-- Engine Handlers --
local function onActivated(actor)
    core.sendGlobalEvent("runAutoSort", {
        actor=actor,
        containers=nearby.containers,
        autoSortObject=self.object,
        posInfo=posInfo,
        favoriteItems=favoriteItems
    })
end

local function onUpdate()
    local actor = nearby.players[1]
    actor:sendEvent("getFavorites", self)
end

-- Return --
return {
    eventHandlers = {
        updateFavorites = updateFavorites
    },
    engineHandlers = {
        onUpdate = onUpdate,
        onActivated = onActivated
    }
}