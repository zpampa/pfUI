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
end)
