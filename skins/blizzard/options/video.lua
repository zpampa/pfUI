pfUI:RegisterSkin("Options-Video", function ()
    OptionsFrame:SetScript("OnShow", function()
    -- default events
    OptionsFrame_Load()
    UpdateMicroButtons()
    Disable_BagButtons()

    -- customize
    OptionsFrame:SetMovable(true)
    OptionsFrame:EnableMouse(true)

    OptionsFrame:ClearAllPoints()
    OptionsFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    OptionsFrame:SetScale(.95)

    for i,v in ipairs({OptionsFrame:GetRegions()}) do
      if v.SetTexture then v:SetTexture("") end
    end

    CreateBackdrop(OptionsFrame, nil, false, .9)

    OptionsFrame:SetScript("OnMouseDown",function()
      OptionsFrame:StartMoving()
    end)

    OptionsFrame:SetScript("OnMouseUp",function()
      OptionsFrame:StopMovingOrSizing()
    end)
  end)
end)
