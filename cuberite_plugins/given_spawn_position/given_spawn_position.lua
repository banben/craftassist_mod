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
    local x = 16.287732744898
    local y = 70.413520321603 -- height
    local z = -6.4526485359803
    local Roll = 0
    local Pitch = 40.798984527588
    local Yaw = 91.94750213623
    -- player:Freeze(Vector3d(x, y, z))
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