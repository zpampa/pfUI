pfUI:RegisterSkin("Character", function ()
  local CharacterFrame = _G["PaperDollFrame"]
  CreateBackdrop(CharacterFrame, nil, nil, .9)
  CharacterFrame.backdrop:SetPoint("TOPLEFT", 10, -12)
  CharacterFrame.backdrop:SetPoint("BOTTOMRIGHT", -32, 76)
  StripTextures(CharacterFrame)

  CharacterFramePortrait:Hide()
  SkinCloseButton(CharacterFrameCloseButton, CharacterFrame, -37, -17)

  CharacterNameFrame:SetPoint("TOP", -10, -20)

  StripTextures(CharacterAttributesFrame)
  StripTextures(CharacterResistanceFrame)

  local attributesLeft = CreateFrame("Frame", "CharacterAttributesLeft", CharacterAttributesFrame)
  attributesLeft:SetPoint("TOPLEFT", CharacterAttributesFrame, "TOPLEFT", -3, 3)
  attributesLeft:SetPoint("BOTTOMRIGHT", CharacterAttributesFrame, "BOTTOMRIGHT", -113, -11)
  SkinBackdropOffset(attributesLeft)

  local attributesTopRight = CreateFrame("Frame", "CharacterAttributesTopRight", CharacterAttributesFrame)
  attributesTopRight:SetPoint("TOPLEFT", CharacterAttributesFrame, "TOPLEFT", 116, 3)
  attributesTopRight:SetPoint("BOTTOMRIGHT", CharacterAttributesFrame, "BOTTOMRIGHT", 3, 33)
  SkinBackdropOffset(attributesTopRight)

  local attributesBottomRight = CreateFrame("Frame", "CharacterAttributesBottomRight", CharacterAttributesFrame)
  attributesBottomRight:SetPoint("TOPLEFT", CharacterAttributesFrame, "TOPLEFT", 116, -41)
  attributesBottomRight:SetPoint("BOTTOMRIGHT", CharacterAttributesFrame, "BOTTOMRIGHT", 3, -11)
  SkinBackdropOffset(attributesBottomRight)

  CreateBackdrop(CharacterResistanceFrame)
  CharacterResistanceFrame.backdrop:SetPoint("TOPLEFT", 3, 2)
  CharacterResistanceFrame.backdrop:SetPoint("BOTTOMRIGHT", -3, 48)

  local magicResTextureCords = {
    {0.21875, 0.78125, 0.25, 0.3203125},
    {0.21875, 0.78125, 0.0234375, 0.09375},
    {0.21875, 0.78125, 0.13671875, 0.20703125},
    {0.21875, 0.78125, 0.36328125, 0.43359375},
    {0.21875, 0.78125, 0.4765625, 0.546875}
  }

  for i,c in ipairs(magicResTextureCords) do
    local magicResFrame = _G["MagicResFrame"..i]
    magicResFrame:SetWidth(22)
    magicResFrame:SetHeight(22)
    for k,f in pairs({magicResFrame:GetRegions()}) do
      if f:GetObjectType() == "Texture" then f:SetTexCoord(c[1], c[2], c[3], c[4]) end
    end
  end

  for i=1, 5 do
    local tab = _G["CharacterFrameTab"..i]
    tab:SetHeight(22)
    tab:SetScript("OnShow", function()
      PanelTemplates_TabResize(0);
      tab:SetWidth(tab:GetTextWidth() + 20);
    end)
    SkinTabBottom(tab)
    if i ~= 1 then
      local lastTab = _G["CharacterFrameTab"..(i-1)]
      tab:ClearAllPoints()
      tab:SetPoint("LEFT", lastTab, "RIGHT", 8, 0)
    end
  end

  local slotTextCords = {.08, .92, .08, .92};

  local slots = {
    "HeadSlot",
    "NeckSlot",
    "ShoulderSlot",
    "BackSlot",
    "ChestSlot",
    "ShirtSlot",
    "TabardSlot",
    "WristSlot",

    "HandsSlot",
    "WaistSlot",
    "LegsSlot",
    "FeetSlot",
    "Finger0Slot",
    "Finger1Slot",
    "Trinket0Slot",
    "Trinket1Slot",

    "MainHandSlot",
    "SecondaryHandSlot",
    "RangedSlot"
  }

  for i, slot in pairs(slots) do
    local slotId, _, _ = GetInventorySlotInfo(slot)
    local quality = GetInventoryItemQuality("player", slotId)

    _G["Character"..slot.."IconTexture"]:SetTexCoord(unpack(slotTextCords))
    slot = _G["Character"..slot]
    StripTextures(slot)
    CreateBackdrop(slot)

    if i ~= 1 and i ~= 9 and i ~= 17 then
      local isBottomSlots = i > 17
      local lastSlot = slots[i-1]
      lastSlot = _G["Character"..lastSlot]
      slot:ClearAllPoints()

      if isBottomSlots then
        slot:SetPoint("LEFT", lastSlot, "RIGHT", 7, 0)
      else
        slot:SetPoint("TOP", lastSlot, "BOTTOM", 0, -7)
      end
    end
  end

  hooksecurefunc("PaperDollItemSlotButton_Update", function()
    for i, slot in pairs(slots) do
      local slotId, _, _ = GetInventorySlotInfo(slot)
      local quality = GetInventoryItemQuality("player", slotId)
      slot = _G["Character"..slot]

      if slot and slot.backdrop then
        if quality and quality > 0 then
          slot.backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
        else
          local er, eg, eb, ea = pfUI.cache.er, pfUI.cache.eg, pfUI.cache.eb, pfUI.cache.ea
          slot.backdrop:SetBackdropBorderColor(er, eg, rb, ea)
        end
      end
    end
  end)
end)
