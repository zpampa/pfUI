pfUI:RegisterSkin("Options-Interface", function ()
    UIOptionsFrame:SetScript("OnShow", function()
    -- default events
    UIOptionsFrame_Load()
    MultiActionBar_Update()
    MultiActionBar_ShowAllGrids()
    Disable_BagButtons()
    UpdateMicroButtons()

    -- customize
    UIOptionsBlackground:Hide()

    UIOptionsFrame:SetWidth(BasicOptions:GetWidth())
    UIOptionsFrame:SetHeight(BasicOptions:GetHeight())
    UIOptionsFrame:SetScale(.8)

    StripTextures(UIOptionsFrame)
    CreateBackdrop(UIOptionsFrame, nil, nil, .9)

    CenterFrame(UIOptionsFrame)
    EnableMovable(UIOptionsFrame)
  end)
end)
