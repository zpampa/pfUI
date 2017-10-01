pfUI:RegisterSkin("Options-Sound", function ()
  SoundOptionsFrame:SetScript("OnShow", function()
    -- default events
    SoundOptionsFrame_Load()
    Disable_BagButtons()
    UpdateMicroButtons()

    -- customize
    SoundOptionsFrame:EnableKeyboard(false)

    StripTextures(SoundOptionsFrame)
    CreateBackdrop(SoundOptionsFrame, nil, nil, .9)

    CenterFrame(SoundOptionsFrame)
    EnableMovable(SoundOptionsFrame)
  end)
end)
