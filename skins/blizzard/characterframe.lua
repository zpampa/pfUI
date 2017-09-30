pfUI:RegisterSkin("characterframe", function ()
  local CharacterFrame = _G["PaperDollFrame"]
  CreateBackdrop(CharacterFrame, nil, nil, alpha)
  CharacterFrame.backdrop:SetPoint('TOPLEFT', 10, -12)
  CharacterFrame.backdrop:SetPoint('BOTTOMRIGHT', -32, 76)
  for k,v in pairs({CharacterFrame:GetRegions()}) do
    if v:GetObjectType() == "Texture" then
      v:SetTexture(nil)
    end
  end

  CharacterFramePortrait:Hide()
  SkinCloseButton(CharacterFrameCloseButton, CharacterFrame)

  CharacterNameFrame:SetPoint("TOP", -10, -20)

  for k,v in pairs({CharacterAttributesFrame:GetRegions()}) do
    if v:GetObjectType() == "Texture" then
      v:SetTexture(nil)
    end
  end

  for k,v in pairs({CharacterResistanceFrame:GetRegions()}) do
    if v:GetObjectType() == "Texture" then
      v:SetTexture(nil)
    end
  end

  CreateBackdrop(CharacterResistanceFrame)
  CharacterResistanceFrame.backdrop:SetPoint('TOPLEFT', 3, 2)
  CharacterResistanceFrame.backdrop:SetPoint('BOTTOMRIGHT', -3, 48)

  for i=1,5 do
    _G["MagicResFrame" .. i]:SetWidth(22)
    _G["MagicResFrame" .. i]:SetHeight(22)
  end

  for k,v in pairs({MagicResFrame1:GetRegions()}) do
    if v:GetObjectType() == "Texture" then v:SetTexCoord(0.21875, 0.78125, 0.25, 0.3203125) end
  end

  for k,v in pairs({MagicResFrame2:GetRegions()}) do
    if v:GetObjectType() == "Texture" then v:SetTexCoord(0.21875, 0.78125, 0.0234375, 0.09375) end
  end

  for k,v in pairs({MagicResFrame3:GetRegions()}) do
    if v:GetObjectType() == "Texture" then v:SetTexCoord(0.21875, 0.78125, 0.13671875, 0.20703125) end
  end

  for k,v in pairs({MagicResFrame4:GetRegions()}) do
    if v:GetObjectType() == "Texture" then v:SetTexCoord(0.21875, 0.78125, 0.36328125, 0.43359375) end
  end

  for k,v in pairs({MagicResFrame5:GetRegions()}) do
    if v:GetObjectType() == "Texture" then v:SetTexCoord(0.21875, 0.78125, 0.4765625, 0.546875) end
  end
end)