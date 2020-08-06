-- Copyright (c) Facebook, Inc. and its affiliates.


PLUGIN = nil

function Initialize(Plugin)
    Plugin:SetName("GivenStartPosition")
    Plugin:SetVersion(1)

    PLUGIN = Plugin
    cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnPlayerSpawned)
    cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_MOVING, OnPlayerMoving)

    LOG("Loaded plugin: GivenStartPosition")
    math.randomseed(0)
    return true
end

function OnPlayerSpawned(player)
    x = 20.103118832918
    y = 68.751071381222 -- height
    z = 37.831284557496
    -- player:Freeze(Vector3d(x, y, z))
end

function OnPlayerMoving(player)
    local Pos = player:GetPosition()
    print('x:'+Pos.x, 'y:'+Pos.y, 'z:'+Pos.z)
end