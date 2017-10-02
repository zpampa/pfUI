pfUI:RegisterSkin("Options-Video", function ()
  OptionsFrame:SetScript("OnShow", function()
    -- default events
    OptionsFrame_Load()
    UpdateMicroButtons()
    Disable_BagButtons()

    -- customize
    OptionsFrame:SetScale(.95)
    StripTextures(OptionsFrame)
    CreateBackdrop(OptionsFrame, nil, nil, .9)
    CenterFrame(OptionsFrame)
    EnableMovable(OptionsFrame)

    SkinButton(OptionsFrameDefaults)

    SkinButton(OptionsFrameOkay)
    OptionsFrameOkay:ClearAllPoints()
    OptionsFrameOkay:SetPoint("RIGHT", OptionsFrameCancel, "LEFT", -3, 0)

    SkinButton(OptionsFrameCancel)

    local backdrops = {
      OptionsFrameDisplay,
      OptionsFrameWorldAppearance,
      OptionsFrameBrightness,
      OptionsFramePixelShaders,
      OptionsFrameMiscellaneous,
    }

    for i,f in ipairs(backdrops) do
      SkinBackdropOffset(f)
    end

    OptionsFrameBrightness.grayScale = OptionsFrameBrightness:CreateTexture("ARTWORK")
    OptionsFrameBrightness.grayScale:SetTexture("Interface\\OptionsFrame\\21stepgrayscale")
    OptionsFrameBrightness.grayScale:SetWidth(256)
    OptionsFrameBrightness.grayScale:SetHeight(32)
    OptionsFrameBrightness.grayScale:SetPoint("RIGHT", -10, 0)
  end)
end)
