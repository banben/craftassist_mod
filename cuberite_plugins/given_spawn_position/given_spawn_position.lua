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
    local x = -3.3726953831572
    local y = 72.238239619938 -- height
    local z = -7.4457397249562
    local Roll = 0
    local Pitch = 40.498989105225
    local Yaw = 0.44756075739861
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

function OnPlayerBreakingBlock(player, blockx, blocky, blockz, blockface, blocktype, blockmeta)
    print('blockx:'..tostring(blockx), 'blocky:'..tostring(blocky), 'blockz:'..tostring(blockz), 'blocktype:'..tostring(blocktype), 'blockmeta:'..tostring(blockmeta))
end