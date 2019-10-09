Sandbox = { }

local function numberOfSoulShards()
    local soulShardID = 6265
    local soulShardCount = 0
    for i = 0, NUM_BAG_SLOTS do
        for z = 1, GetContainerNumSlots(i) do
            if GetContainerItemID(i,z) == soulShardID then
                soulShardCount = soulShardCount + 1
            end
        end
    end
    print(soulShardCount)
end

local finalNumberOfSoulShards = numberOfSoulShards()
print(finalNumberOfSoulShards)


local frame = CreateFrame("FRAME", "SandboxFrame");
frame:RegisterEvent("BAG_UPDATE");
local function eventHandler(self, event, ...)
 print("Handling event " .. event);
end
frame:SetScript("OnEvent", numberOfSoulShards);