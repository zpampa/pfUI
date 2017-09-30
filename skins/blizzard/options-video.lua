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
  end)
end)
