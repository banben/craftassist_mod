-- Copyright (c) Facebook, Inc. and its affiliates.


PLUGIN = nil

function Initialize(Plugin)
    Plugin:SetName("GivenStartPosition")
    Plugin:SetVersion(1)

    PLUGIN = Plugin
    cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnPlayerSpawned)
    cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_MOVING, OnPlayerMoving)
    -- cPluginManager.AddHook(cPluginManager.HOOK_PLAYER_BREAKING_BLOCK, OnPlayerBreakingBlock)

    LOG("Loaded plugin: GivenStartPosition")
    math.randomseed(0)
    return true
end

function OnPlayerSpawned(player)
    local x = -4.6659293747492
    local y = 69.301222412827 -- height
    local z = -8.632181055806
    local Roll = 0
    local Pitch = 22.648979187012
    local Yaw = -1.2024536132812
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

function OnPlayerBreakingBlock(player, blockx, blocky, blockz, blockface, blocktype, blockmeta)
    print('blockx:'..tostring(blockx), 'blocky:'..tostring(blocky), 'blockz:'..tostring(blockz), 'blocktype:'..tostring(blocktype), 'blockmeta:'..tostring(blockmeta))
end