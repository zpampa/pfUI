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

    local closeButton = GetCloseButton(UIOptionsFrame)
    if closeButton then SkinCloseButton(closeButton, UIOptionsFrame, -4, -4) end

    SkinButton(UIOptionsFrameResetTutorials)
    UIOptionsFrameResetTutorials:SetTextColor(1,0.82,0,1)
    SkinButton(UIOptionsFrameDefaults)

    SkinButton(UIOptionsFrameOkay)
    UIOptionsFrameOkay:ClearAllPoints()
    UIOptionsFrameOkay:SetPoint("RIGHT", UIOptionsFrameCancel, "LEFT", -3, 0)
    UIOptionsFrameOkay:SetTextColor(1,0.82,0,1)

    SkinButton(UIOptionsFrameCancel)
    UIOptionsFrameCancel:SetTextColor(1,0.82,0,1)

    local backdrops = {
      BasicOptionsGeneral,
      BasicOptionsDisplay,
      BasicOptionsCamera,
      BasicOptionsHelp,
      AdvancedOptionsActionBars,
      AdvancedOptionsChat,
      AdvancedOptionsRaid,
      AdvancedOptionsCombatText,
    }

    for i,f in ipairs(backdrops) do
      SkinBackdropOffset(f)
    end
  end)
end)
