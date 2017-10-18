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

  local leftSlots = {
    "CharacterHeadSlot",
    "CharacterNeckSlot",
    "CharacterShoulderSlot",
    "CharacterBackSlot",
    "CharacterChestSlot",
    "CharacterShirtSlot",
    "CharacterTabardSlot",
    "CharacterWristSlot"
  }

  for i, slot in pairs(leftSlots) do
    _G[slot.."IconTexture"]:SetTexCoord(unpack(slotTextCords))

    slot = _G[slot]
    StripTextures(slot)
    CreateBackdrop(slot)

    if i ~= 1 then
      local lastSlot = _G[leftSlots[i-1]]
      slot:ClearAllPoints()
      slot:SetPoint("TOP", lastSlot, "BOTTOM", 0, -7)
    end
  end

  local rightSlots = {
    "CharacterHandsSlot",
    "CharacterWaistSlot",
    "CharacterLegsSlot",
    "CharacterFeetSlot",
    "CharacterFinger0Slot",
    "CharacterFinger1Slot",
    "CharacterTrinket0Slot",
    "CharacterTrinket1Slot",
  }

  for i, slot in pairs(rightSlots) do
    _G[slot.."IconTexture"]:SetTexCoord(unpack(slotTextCords))

    slot = _G[slot]
    StripTextures(slot)
    CreateBackdrop(slot)

    if i ~= 1 then
      local lastSlot = _G[rightSlots[i-1]]
      slot:ClearAllPoints()
      slot:SetPoint("TOP", lastSlot, "BOTTOM", 0, -7)
    end
  end

  local bottomSlots = {
    "CharacterMainHandSlot",
    "CharacterSecondaryHandSlot",
    "CharacterRangedSlot",
  }

  for i, slot in pairs(bottomSlots) do
    _G[slot.."IconTexture"]:SetTexCoord(unpack(slotTextCords))

    slot = _G[slot]
    StripTextures(slot)
    CreateBackdrop(slot)

    if i ~= 1 then
      local lastSlot = _G[bottomSlots[i-1]]
      slot:ClearAllPoints()
      slot:SetPoint("LEFT", lastSlot, "RIGHT", 7, 0)
    end
  end
end)
