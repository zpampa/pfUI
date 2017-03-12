pfUI:RegisterModule("skin", function ()
  -- movable default frames
  EnableMovable("CharacterFrame", nil, { "PaperDollFrame",
      "PetPaperDollFrame", "ReputationFrame", "SkillFrame", "HonorFrame" } )

  EnableMovable("QuestLogFrame")
  EnableMovable("FriendsFrame")
  EnableMovable("SpellBookFrame")
  EnableMovable("GossipFrame")
  EnableMovable("TradeFrame")
  EnableMovable("MerchantFrame")
  EnableMovable("DressUpFrame")

  EnableMovable("TalentFrame", "Blizzard_TalentUI")
  EnableMovable("TradeSkillFrame", "Blizzard_TradeSkillUI")
  EnableMovable("ClassTrainerFrame", "Blizzard_TrainerUI")
  EnableMovable("InspectFrame", "Blizzard_InspectUI", { "InspectHonorFrame" })

  _, class = UnitClass("player")
  local color = RAID_CLASS_COLORS[class]
  local cr, cg, cb = color.r , color.g, color.b

  local buttons = {
    "GameMenuButtonOptions",
    "GameMenuButtonSoundOptions",
    "GameMenuButtonUIOptions",
    "GameMenuButtonKeybindings",
    "GameMenuButtonMacros",
    "GameMenuButtonLogout",
    "GameMenuButtonQuit",
    "GameMenuButtonContinue",
    "StaticPopup1Button1",
    "StaticPopup1Button2",
    "StaticPopup2Button1",
    "StaticPopup2Button2",
  }
  local boxes = {
    "StaticPopup1",
    "StaticPopup2",
    "GameMenuFrame",
    "DropDownList1MenuBackdrop",
    "DropDownList2MenuBackdrop",
    "DropDownList1Backdrop",
    "DropDownList2Backdrop",
  }

  GameMenuFrameHeader:SetTexture(nil)
  GameMenuFrame:SetHeight(GameMenuFrame:GetHeight()+2)
  GameMenuFrame:SetWidth(GameMenuFrame:GetWidth()-30)

  local pfUIButton = CreateFrame("Button", "GameMenuButtonPFUI", GameMenuFrame, "GameMenuButtonTemplate")
  pfUIButton:SetPoint("TOP", 0, -10)
  pfUIButton:SetText(T["pfUI Settings"])
  pfUIButton:SetScript("OnClick", function()
    pfUI.gui:Show()
    HideUIPanel(GameMenuFrame)
  end)
  SkinButton(pfUIButton)

  local point, relativeTo, relativePoint, xOffset, yOffset = GameMenuButtonOptions:GetPoint()
  GameMenuButtonOptions:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset - 22)

  for _, button in pairs(buttons) do
    SkinButton(button)
  end

  for _, box in pairs(boxes) do
    local b = getglobal(box)
    CreateBackdrop(b, nil, true, .8)
  end

  for i,v in ipairs({GameMenuFrame:GetRegions()}) do
    if v.SetTextColor then
      v:SetTextColor(1,1,1,1)
      v:SetPoint("TOP", GameMenuFrame, "TOP", 0, 16)
      v:SetFont(pfUI.font_default, C.global.font_size + 2, "OUTLINE")
    end
  end

  local alpha = tonumber(C.tooltip.alpha)
  CreateBackdrop(ShoppingTooltip1, nil, nil, alpha)
  CreateBackdrop(ShoppingTooltip2, nil, nil, alpha)
  CreateBackdrop(ItemRefTooltip, nil, nil, alpha)


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
  --CharacterResistanceFrame:SetWidth(24)

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



  SkinRotateButton(CharacterModelFrameRotateLeftButton)
  SkinRotateButton(CharacterModelFrameRotateRightButton)

  ShoppingTooltip1:SetScript("OnShow", function()
    local a, b, c, d, e = this:GetPoint()
    local border = tonumber(C.appearance.border.default)
    if not d or d == 0 then d = (border*2) + ( d or 0 ) + 1 end
    if a then this:SetPoint(a, b, c, d, e) end
  end)

  ShoppingTooltip2:SetScript("OnShow", function()
    local a, b, c, d, e = this:GetPoint()
    local border = tonumber(C.appearance.border.default)
    if not d or d == 0 then d = (border*2) + ( d or 0 ) + 1 end
    if a then this:SetPoint(a, b, c, d, e) end
  end)

  CreateBackdrop(TicketStatusFrame)
  TicketStatusFrame:ClearAllPoints()
  TicketStatusFrame:SetPoint("TOP", 0, -5)
  function TicketStatusFrame_OnEvent()
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      GetGMTicket()
    else
      if ( arg1 ~= 0 ) then
        this:Show()
        refreshTime = GMTICKET_CHECK_INTERVAL
      else
        this:Hide()
      end
    end
  end

  UIOptionsFrame:SetScript("OnShow", function()
    -- default events
    UIOptionsFrame_Load();
    MultiActionBar_Update();
    MultiActionBar_ShowAllGrids();
    Disable_BagButtons();
    UpdateMicroButtons();

    -- customize
    UIOptionsBlackground:Hide()

    UIOptionsFrame:SetMovable(true)
    UIOptionsFrame:EnableMouse(true)
    UIOptionsFrame:SetScale(.8)
    UIOptionsFrame:SetScript("OnMouseDown",function()
      UIOptionsFrame:StartMoving()
    end)

    UIOptionsFrame:SetScript("OnMouseUp",function()
      UIOptionsFrame:StopMovingOrSizing()
    end)
  end)

  -- due to the fontsize, the auctionhouse dropdown menu is misplaced.
  -- This hackfix rearranges it, by setting the width of it, as soon as
  -- the auctionhouse window is ready to get hooked.
  local pfAuctionHouseFix = CreateFrame("Frame", nil)
  pfAuctionHouseFix:RegisterEvent("ADDON_LOADED")
  pfAuctionHouseFix:SetScript("OnEvent", function ()
    if not pfAuctionFrame_OnShow and AuctionFrame_OnShow then
      pfAuctionFrame_OnShow = AuctionFrame_OnShow
      function AuctionFrame_OnShow ()
        pfAuctionFrame_OnShow()
        BrowseLevelText:SetWidth(70)
      end
      pfAuctionHouseFix:UnregisterAllEvents()
    end
  end)

  if C.global.errors_limit == "1" then
    UIErrorsFrame:SetHeight(25)
  end

  if C.global.errors_hide == "1" then
    UIErrorsFrame:Hide()
  end
end)
