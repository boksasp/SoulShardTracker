local function createStatusFrame()
    local statusFrame = CreateFrame("Frame",nil,UIParent)
    
    -- Enable movable frame
    statusFrame:SetMovable(true)
    statusFrame:EnableMouse(true)
    statusFrame:RegisterForDrag("LeftButton")
    statusFrame:SetScript("OnDragStart", statusFrame.StartMoving)
    statusFrame:SetScript("OnDragStop", statusFrame.StopMovingOrSizing)

    -- Set size and position
    statusFrame:SetWidth(110) 
    statusFrame:SetHeight(20)
    statusFrame:SetAlpha(0.8)
    statusFrame:SetPoint("TOPLEFT",90,-5) -- above the character pane

    -- Create texture
    local texture = statusFrame:CreateTexture(nil,"BACKGROUND")
    texture:SetAllPoints(true)
    texture:SetColorTexture(0, 0, 0, 0.6)
    statusFrame.texture = texture

    -- Create text
    statusFrame.text = statusFrame:CreateFontString(nil,"ARTWORK") 
    statusFrame.text:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
    statusFrame.text:SetPoint("CENTER",0,0)
    statusFrame:Show()

    return statusFrame
end

local f1 = createStatusFrame()

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
    f1.text:SetText(string.format("# of Soul Shards: %d", soulShardCount))
end

-- Create frame for handling bag update
local bagUpdateHandler = CreateFrame("FRAME", "SandboxFrame");
bagUpdateHandler:RegisterEvent("BAG_UPDATE");
bagUpdateHandler:SetScript("OnEvent", numberOfSoulShards);
