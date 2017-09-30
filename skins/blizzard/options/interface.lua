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

    UIOptionsFrame:SetMovable(true)
    UIOptionsFrame:EnableMouse(true)

    UIOptionsFrame:ClearAllPoints()
    UIOptionsFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    UIOptionsFrame:SetWidth(BasicOptions:GetWidth())
    UIOptionsFrame:SetHeight(BasicOptions:GetHeight())
    UIOptionsFrame:SetScale(.8)

    StripTextures(UIOptionsFrame)

    CreateBackdrop(UIOptionsFrame, nil, false, .9)

    UIOptionsFrame:SetScript("OnMouseDown",function()
      UIOptionsFrame:StartMoving()
    end)

    UIOptionsFrame:SetScript("OnMouseUp",function()
      UIOptionsFrame:StopMovingOrSizing()
    end)
  end)
end)
