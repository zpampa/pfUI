pfUI:RegisterSkin("Options-Sound", function ()
    SoundOptionsFrame:SetScript("OnShow", function()
    -- default events
    SoundOptionsFrame_Load()
    Disable_BagButtons()
    UpdateMicroButtons()

    -- customize
    SoundOptionsFrame:SetMovable(true)
    SoundOptionsFrame:EnableMouse(true)
    SoundOptionsFrame:EnableKeyboard(false)

    SoundOptionsFrame:ClearAllPoints()
    SoundOptionsFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

    StripTextures(SoundOptionsFrame)

    CreateBackdrop(SoundOptionsFrame, nil, false, .9)

    SoundOptionsFrame:SetScript("OnMouseDown",function()
      SoundOptionsFrame:StartMoving()
    end)

    SoundOptionsFrame:SetScript("OnMouseUp",function()
      SoundOptionsFrame:StopMovingOrSizing()
    end)
  end)
end)
