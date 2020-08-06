-- Copyright (c) Facebook, Inc. and its affiliates.


PLUGIN = nil

function Initialize(Plugin)
    Plugin:SetName("GivenStartPosition")
    Plugin:SetVersion(1)

    PLUGIN = Plugin
    cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnPlayerSpawned)

    LOG("Loaded plugin: GivenStartPosition")
    math.randomseed(0)
    return true
end

function OnPlayerSpawned(player)
    x = 0.50
    y = 163.00 -- height
    z = 0.50
    -- player:TeleportToCoords(x, y, z)
    player:Freeze(Vector3d(x, y, z))
end
