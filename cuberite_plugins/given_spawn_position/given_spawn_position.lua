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
    local x = -21.179593872085
    local y = 70.626060228271 -- height
    local z = -4.8648014235143
    local Roll = 0
    local Pitch = 34.949275970459
    local Yaw = -89.849822998047
    player:Freeze(Vector3d(x, y, z))
    player:SetRoll(Roll)
    player:SetPitch(Pitch)
    player:SetYaw(Yaw)
end

function OnPlayerMoving(player)
    local Pos = player:GetPosition()
    local Roll = player:GetRoll()
    local Pitch = player:GetPitch()
    local Yaw = player:GetYaw()
    print('x:'..tostring(Pos.x), 'y:'..tostring(Pos.y), 'z:'..tostring(Pos.z), 'roll:'..tostring(Roll), 'pitch:'..tostring(Pitch), 'yaw:'..tostring(Yaw))
end