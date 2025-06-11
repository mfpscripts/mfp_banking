--- NEW ESX VERSIONS -----
if not Config.newESX then
	ESX = nil
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)
else
	ESX = exports["es_extended"]:getSharedObject()
end

PlayerData = {}
local cops = 0

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = ESX.GetPlayerData()
	PlayerData = xPlayer
	PlayerData.job = xPlayer.job
	PlayerLoaded = true
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

RegisterNetEvent('panicbutton:sendCoords')
AddEventHandler('panicbutton:sendCoords', function()
  local playerCoords = GetEntityCoords(PlayerPedId())
  print(playerCoords)
  TriggerServerEvent('panicbutton:syncPosition', playerCoords)
end)

RegisterNetEvent('panicbutton:alarm')
AddEventHandler('panicbutton:alarm', function(pos)
    if PlayerData ~= nil and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.policeJob then
        local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blip, Config.DispatchBlip.Sprite)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, Config.DispatchBlip.Size)
        SetBlipColour(blip, Config.DispatchBlip.Colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING");
        AddTextComponentString(Translation[Config.Locale]['atm_rob_police_blip'])
        EndTextCommandSetBlipName(blip)

        Citizen.Wait(Config.BlipTimer * 1000)
        RemoveBlip(blip)
    end

end)

-----------------------------------
_menuPool = NativeUI.CreatePool()
local mainMenu
local withdrawMenu
local depositMenu
local robMenu
local billingMenu
local welcomeMenu
local transferMenu
local creditMenu
local moneyMenu

Citizen.CreateThread(function()
    while true do

        _menuPool:ProcessMenus()

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
		for k,v in pairs(Config.ShopLocations) do
			if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
		ShowInputNotification(Translation[Config.Locale]['open_menu']) end
        if IsControlJustReleased(0, 38) then
		if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
            
			
			openmenuanimation()
			if Config.usingProgressbar then
				if (GetResourceState("Lux_Progressbar") == "started") then
					exports['Lux_Progressbar']:startUI(3500, Translation[Config.Locale]['insertcard'])
				elseif (GetResourceState("mfp_progressbar") == "started") then
					exports['mfp_progressbar']:startUI(3500, Translation[Config.Locale]['insertcard'])
				end
				Citizen.Wait(3500)
			end
			TriggerServerEvent("mfp_banking:welcomePlayer")
			openWelcomeMenu()
			
				if Anit2much then
					TriggerServerEvent('mfp_banking:antitoomuchmoney')
				end
            else

            end
        end end
		------
		for k,v in pairs(Config.BankLocations) do
			if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
		ShowInputNotification(Translation[Config.Locale]['open_menu2']) end
        if IsControlJustReleased(0, 38) then
		if GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true) < 1.5 then
            
			openMenu2()
			TriggerServerEvent("mfp_banking:welcomePlayer")
			
			if Anit2much then
			TriggerServerEvent('mfp_banking:antitoomuchmoney')
			end
            else

            end
        end end

        Citizen.Wait(1)

    end
	
end)

Citizen.CreateThread(function()
    for k in pairs(Config.Npc) do
       RequestModel(GetHashKey("a_f_y_business_01"))
       while not HasModelLoaded(GetHashKey("a_f_y_business_01")) do
         Citizen.Wait(1)
       end
       local ped =  CreatePed(4, GetHashKey("a_f_y_business_01"), Config.Npc[k].x, Config.Npc[k].y, Config.Npc[k].z, Config.Npc[k].h, false, true)
       FreezeEntityPosition(ped, true)
       SetEntityHeading(ped, Config.Npc[k].h, true)
       SetEntityInvincible(ped, true)
       SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)

function openWelcomeMenu()
    

	welcomeMenu = NativeUI.CreateMenu(Translation[Config.Locale]['atm_subtitle'], Translation[Config.Locale]['atm'])
    _menuPool:Add(welcomeMenu)
	
	local wb = NativeUI.CreateItem(Translation[Config.Locale]['welcome'], '')
    welcomeMenu:AddItem(wb)
	
	local empty801 = NativeUI.CreateItem('', '')
    welcomeMenu:AddItem(empty801)
	
	
	local login = NativeUI.CreateItem(Translation[Config.Locale]['login'], Translation[Config.Locale]['login_disc'])
    welcomeMenu:AddItem(login)
	
	local logout = NativeUI.CreateItem(Translation[Config.Locale]['logout'], Translation[Config.Locale]['logout_disc'])
    welcomeMenu:AddItem(logout)
	
	
    login:RightLabel('→')
	logout:RightLabel('→')


    
	logout.Activated = function(sender, index)
        
		welcomeMenu:Visible(false)
		
    end
	login.Activated = function(sender, index)
        
		welcomeMenu:Visible(false)
		openMenu()
		
	
    end
	

    welcomeMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openCreditMenu()
    

	creditMenu = NativeUI.CreateMenu(Translation[Config.Locale]['atm_subtitle'], Translation[Config.Locale]['atm'])
    _menuPool:Add(creditMenu)
	
	local wb = NativeUI.CreateItem(Translation[Config.Locale]['credit_info'], '')
    creditMenu:AddItem(wb)
	
	local empty801 = NativeUI.CreateItem('', '')
    creditMenu:AddItem(empty801)
	
	
	local login = NativeUI.CreateItem(Translation[Config.Locale]['takecredit_info'], "")
    creditMenu:AddItem(login)
	
	local logout = NativeUI.CreateItem(Translation[Config.Locale]['paycredit_info'], "")
    creditMenu:AddItem(logout)
	
	
    login:RightLabel('→')
	logout:RightLabel('→')


    
	logout.Activated = function(sender, index)
        
		creditMenu:Visible(false)
		TriggerServerEvent('mfp_banking:paycredit', amount)
		
    end
	login.Activated = function(sender, index)
        
		creditMenu:Visible(false)
		TriggerServerEvent('mfp_banking:takecredit', amount)
		
	
    end
	

    creditMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openMoneyMenu()
    

	moneyMenu = NativeUI.CreateMenu(Translation[Config.Locale]['atm_subtitle'], Translation[Config.Locale]['atm'])
    _menuPool:Add(moneyMenu)
	
	
	local withdraw = NativeUI.CreateItem(Translation[Config.Locale]['withdraw'], "")
    moneyMenu:AddItem(withdraw)
	
	local deposit = NativeUI.CreateItem(Translation[Config.Locale]['deposit'], "")
    moneyMenu:AddItem(deposit)
	
	
    withdraw:RightLabel('→')
	deposit:RightLabel('→')


    
	deposit.Activated = function(sender, index)
        
		moneyMenu:Visible(false)
		openDeposit()
		
    end
	withdraw.Activated = function(sender, index)
        
		moneyMenu:Visible(false)
		openWithdraw()
		
	
    end
	

    moneyMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end


function openMenu()
    mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['atm'], Translation[Config.Locale]['atm_subtitle'])
    _menuPool:Add(mainMenu)
	
	local moneyshow1 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_cash'], '')
    mainMenu:AddItem(moneyshow1)
	
	local moneyshow2 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_bank'], '')
    mainMenu:AddItem(moneyshow2)
	
	local iban = NativeUI.CreateItem("~p~IBAN~s~", '')
    mainMenu:AddItem(iban)
	
	local empty = NativeUI.CreateItem('', '')
    mainMenu:AddItem(empty)

    local withdraw3 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw'], "")
    mainMenu:AddItem(withdraw3)
	
	local deposit3 = NativeUI.CreateItem(Translation[Config.Locale]['deposit'], "")
    mainMenu:AddItem(deposit3)
	

	local tranfer2 = NativeUI.CreateItem(Translation[Config.Locale]['transfer_menu_but'], "")
    mainMenu:AddItem(tranfer2)

	
	local robstart = NativeUI.CreateItem(Translation[Config.Locale]['rob'], Translation[Config.Locale]['rob_disc'])
    mainMenu:AddItem(robstart)
	
    ESX.TriggerServerCallback('mfp_banking:getMoney', function(money, bank)
	   moneyshow2:RightLabel('~o~$' .. ESX.Math.GroupDigits(bank) .. ',00')
	   moneyshow1:RightLabel('~g~$' .. ESX.Math.GroupDigits(money) .. ',00')
	end)
	
	robstart:SetRightBadge(BadgeStyle.Alert)
	iban:RightLabel('~p~' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '~s~')
    withdraw3:RightLabel('→')
	deposit3:RightLabel('→')
	tranfer2:SetRightBadge(BadgeStyle.Star)


    withdraw3.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openWithdraw()
		
		
    end
	deposit3.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openDeposit()
		
		
    end
	tranfer2.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openTranfer()
		
		
    end
	robstart.Activated = function(sender, index)
        
		mainMenu:Visible(false)
		openRobbery()
		
		
    end
	

    mainMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openMenu2()
    mainMenu2 = NativeUI.CreateMenu(Translation[Config.Locale]['atm'], Translation[Config.Locale]['atm_subtitle'])
    _menuPool:Add(mainMenu2)
	
	local moneyshow12 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_cash'], '')
    mainMenu2:AddItem(moneyshow12)
	
	local moneyshow22 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_bank'], '')
    mainMenu2:AddItem(moneyshow22)
	
	local iban2 = NativeUI.CreateItem("~p~IBAN~s~", '')
    mainMenu2:AddItem(iban2)
	
	local credit = NativeUI.CreateItem(Translation[Config.Locale]['credit'], Translation[Config.Locale]['credit2'])
    mainMenu2:AddItem(credit)

	
	local deposit32 = NativeUI.CreateItem(Translation[Config.Locale]['transactions_info'], "")
    mainMenu2:AddItem(deposit32)
	

	local tranfer22 = NativeUI.CreateItem(Translation[Config.Locale]['transfer_menu_but'], "")
    mainMenu2:AddItem(tranfer22)

	local billings2 = NativeUI.CreateItem(Translation[Config.Locale]['billings'], '')
    mainMenu2:AddItem(billings2)
	
	
    ESX.TriggerServerCallback('mfp_banking:getMoney', function(money, bank)
	   moneyshow22:RightLabel('~o~$' .. ESX.Math.GroupDigits(bank) .. ',00')
	   moneyshow12:RightLabel('~g~$' .. ESX.Math.GroupDigits(money) .. ',00')
	end)
	
	deposit32:RightLabel('→')
	credit:RightLabel('→')
	billings2:RightLabel('→')
	tranfer22:SetRightBadge(BadgeStyle.Star)
	iban2:RightLabel('~p~' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '~s~')


	credit.Activated = function(sender, index)
        
		mainMenu2:Visible(false)
		openCreditMenu()
		
		
    end
	deposit32.Activated = function(sender, index)
        
		mainMenu2:Visible(false)
		openMoneyMenu()
		
		
    end
	tranfer22.Activated = function(sender, index)
        
		mainMenu2:Visible(false)
		openTranfer()
		
		
    end
	billings2.Activated = function(sender, index)
        
		mainMenu2:Visible(false)
		openBillings()
		
		
    end
	

    mainMenu2:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openWithdraw()
    withdrawMenu = NativeUI.CreateMenu(Translation[Config.Locale]['withdraw'], Translation[Config.Locale]['withdraw_disc'])
    _menuPool:Add(withdrawMenu)
	
	local bankamount1 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_bank'], '')
    withdrawMenu:AddItem(bankamount1)
	
	local empty2 = NativeUI.CreateItem('', '')
    withdrawMenu:AddItem(empty2)
	
	local withdrawinfo1 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_disc_info_item'], '')
    withdrawMenu:AddItem(withdrawinfo1)

    local withdraw = NativeUI.CreateItem(Translation[Config.Locale]['atm1'], '')
    withdrawMenu:AddItem(withdraw)
	
	local withdraw2 = NativeUI.CreateItem(Translation[Config.Locale]['atm2'], '')
    withdrawMenu:AddItem(withdraw2)
	
	local withdraw4 = NativeUI.CreateItem(Translation[Config.Locale]['atm3'], '')
    withdrawMenu:AddItem(withdraw4)
	
	local withdraw5 = NativeUI.CreateItem(Translation[Config.Locale]['atm4'], '')
    withdrawMenu:AddItem(withdraw5)
	
	
	local custom_withdraw = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_custom_item'], '')
    withdrawMenu:AddItem(custom_withdraw)
			
	
	ESX.TriggerServerCallback('mfp_banking:getMoney', function(money, bank)
	   bankamount1:RightLabel('~o~$' .. ESX.Math.GroupDigits(bank) .. ',00')
	end)

    withdraw:RightLabel("→")
	withdraw2:RightLabel("→")
	withdraw4:RightLabel("→")
	withdraw5:RightLabel("→")


    withdraw.Activated = function(sender, index)
     local amount = Price['atm1']
     TriggerServerEvent('mfp_banking:customwithdraw', amount)
    end
	withdraw2.Activated = function(sender, index)
	local amount = Price['atm2']
     TriggerServerEvent('mfp_banking:customwithdraw', amount)
    end
	withdraw4.Activated = function(sender, index)
     local amount = Price['atm3']
     TriggerServerEvent('mfp_banking:customwithdraw', amount)
    end
	withdraw5.Activated = function(sender, index)
     local amount = Price['atm4']
     TriggerServerEvent('mfp_banking:customwithdraw', amount)
    end	
	custom_withdraw.Activated = function(sender, index)
	withdraw_custom_amount()
	end
	

    withdrawMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end
-----------------------
function openTranfer()
    transferMenu = NativeUI.CreateMenu(Translation[Config.Locale]['transfer'], Translation[Config.Locale]['transfer_disc'])
    _menuPool:Add(transferMenu)
	
	local moneyshow70 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_bank'], '')
    transferMenu:AddItem(moneyshow70)
	
	local empty1099 = NativeUI.CreateItem('', '')
    transferMenu:AddItem(empty1099)

	local tranfer6 = NativeUI.CreateItem(Translation[Config.Locale]['tranfer_button'], '')
    transferMenu:AddItem(tranfer6)
	
	ESX.TriggerServerCallback('mfp_banking:getMoney', function(money, bank)
		moneyshow70:RightLabel('~o~$' .. ESX.Math.GroupDigits(bank) .. ',00')
	
	 end)
	
	
	

    tranfer6.Activated = function(sender, index)
     transfer_custom_amount()
    end
	
    transferMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end
 ----------------------
function openRobbery()
    robMenu = NativeUI.CreateMenu(Translation[Config.Locale]['rob'], Translation[Config.Locale]['atm_subtitle'])              
    _menuPool:Add(robMenu)


    local info = NativeUI.CreateItem(Translation[Config.Locale]['rob_disc_item'], '')
    robMenu:AddItem(info)
	
	local empty102 = NativeUI.CreateItem('', '')
    robMenu:AddItem(empty102)
	
	local robtrue = NativeUI.CreateItem(Translation[Config.Locale]['yes'], '')
    robMenu:AddItem(robtrue)
	
	
	local back30 = NativeUI.CreateItem(Translation[Config.Locale]['stop'], '')
	robMenu:AddItem(back30)
	
	robtrue:RightLabel("~r~⚠")

    back30.Activated = function(sender, index)
     robMenu:Visible(false)
	 mainMenu:Visible(true)
    end
	
	robtrue.Activated = function(sender, index)
		ESX.TriggerServerCallback('mfp_banking:checkpoliceamount', function(copsonline)
			local cops = copsonline
			if cops >= Config.minCops then
				Citizen.Wait(200)
				if Config.use_gcphone then
					SendDistressSignal()
				end
				robMenu:Visible(false)
				TriggerServerEvent('mfp_banking:start2serverside') -- event-2323
				TriggerServerEvent('mfp_banking:robberystarts') -- event-9842
			else
				robMenu:Visible(false)
				TriggerEvent('esx:showNotification', Translation[Config.Locale]['robbery_notenough'])
			end

		end)
    end
	

    robMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end


function openDeposit()
    depositMenu = NativeUI.CreateMenu(Translation[Config.Locale]['deposit'], Translation[Config.Locale]['deposit_disc'])
    _menuPool:Add(depositMenu)
	
	local bankamount2 = NativeUI.CreateItem(Translation[Config.Locale]['money_in_cash'], '')
    depositMenu:AddItem(bankamount2)
	
	local empty2 = NativeUI.CreateItem('', '')
    depositMenu:AddItem(empty2)
	
	local withdrawinfo1 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_disc_info_item'], '')
    depositMenu:AddItem(withdrawinfo1)

    local deposit = NativeUI.CreateItem(Translation[Config.Locale]['atm1'], '')
    depositMenu:AddItem(deposit)
	
	local deposit2 = NativeUI.CreateItem(Translation[Config.Locale]['atm2'], '')
    depositMenu:AddItem(deposit2)
	
	local deposit4 = NativeUI.CreateItem(Translation[Config.Locale]['atm3'], '')
    depositMenu:AddItem(deposit4)
	
	local deposit5 = NativeUI.CreateItem(Translation[Config.Locale]['atm4'], '')
    depositMenu:AddItem(deposit5)
	
	local custom_deposit = NativeUI.CreateItem(Translation[Config.Locale]['deposit_custom_item'], '')
    depositMenu:AddItem(custom_deposit)
	
	
	
	ESX.TriggerServerCallback('mfp_banking:getMoney', function(money, bank)
	   bankamount2:RightLabel('~g~$' .. ESX.Math.GroupDigits(money) .. ',00')
	end)

    deposit:RightLabel("→")
	deposit2:RightLabel("→")
	deposit4:RightLabel("→")
	deposit5:RightLabel("→")


    deposit.Activated = function(sender, index)
	 local amount = Price['atm1']
     TriggerServerEvent('mfp_banking:customdeposit', amount)
    end
	deposit2.Activated = function(sender, index)
	local amount = Price['atm2']
     TriggerServerEvent('mfp_banking:customdeposit', amount)
    end
	deposit4.Activated = function(sender, index)
     local amount = Price['atm3']
     TriggerServerEvent('mfp_banking:customdeposit', amount)
    end
	deposit5.Activated = function(sender, index)
     local amount = Price['atm4']
     TriggerServerEvent('mfp_banking:customdeposit', amount)
    end
	custom_deposit.Activated = function(sender, index)
	deposit_custom_amount()
	end
	

    depositMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end

function openBillings()
	billingMenu = NativeUI.CreateMenu(Translation[Config.Locale]['billings'], Translation[Config.Locale]['billings_disc'])
    _menuPool:Add(billingMenu)
	
	billingItem = {}

	ESX.TriggerServerCallback('mfp_banking:getBillings', function(bills)
		for i = 1, #bills, 1 do
			local label = bills[i].label
			local amount = bills[i].amount
			local value = bills[i].id

			table.insert(billingItem, value)
			
			billingItem[value] = NativeUI.CreateItem(label, '')
			billingItem[value]:RightLabel('$' .. ESX.Math.GroupDigits(amount))
			billingMenu:AddItem(billingItem[value])
			
			
			---
		end
		----
	end)
	billingMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
end



function ShowInputNotification(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

-------- Distressfunction from gcphone -----
function SendDistressSignal()
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }


    TriggerServerEvent('esx_addons_gcphone:startCall', Config.policeNumber, Translation[Config.Locale]['atm_rob_police_msg'], PlayerCoords, { -- _U('distress_message_raub_one')

		--PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

function withdraw_custom_amount()
	local amount = KeyboardInput("MFP_ATM_AMOUNT", Translation[Config.Locale]['withdraw_custom_box'], "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('mfp_banking:customwithdraw', amount)
		end
	end
end

function deposit_custom_amount()
	local amount = KeyboardInput("MFP_ATM_AMOUNT", Translation[Config.Locale]['deposit_custom_box'], "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('mfp_banking:customdeposit', amount)
		end
	end
end


function transfer_custom_amount() 
	local person = KeyboardInput("MFP_ATM_AMOUNT", Translation[Config.Locale]['transfer_who_received'], "", 8)
	local amount = KeyboardInput("MFP_ATM_AMOUNT", Translation[Config.Locale]['transfer_amount'], "", 8)
	if person ~= nil then 
			person = tonumber(person)
	   if amount ~= nil then 
		amount = tonumber(amount)
		
		    if type(person) == 'number' then 
		      if type(amount) == 'number' then 
			  TriggerServerEvent('mfp_banking:transfer', person, amount)
		      end 
	        end 
	   end 
	end 
end 

Citizen.CreateThread(function()
	if not Config.EnableBlips then return end
	
	RequestStreamedTextureDict("banking_banner", 1)
    while not HasStreamedTextureDictLoaded("banking_banner") do
        Wait(0)
    end

	for _, BankLocations in pairs(Config.BankLocations) do
		BankLocations.blip = AddBlipForCoord(BankLocations.x, BankLocations.y, BankLocations.z)
		SetBlipSprite(BankLocations.blip, 108)
		SetBlipDisplay(BankLocations.blip, 4)
		SetBlipScale(BankLocations.blip, 0.9)
		SetBlipColour(BankLocations.blip, 0)
		SetBlipAsShortRange(BankLocations.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Translation[Config.Locale]['atm_blip'])
		EndTextCommandSetBlipName(BankLocations.blip)
		if Config.usingAdvancedBlips then
			exports['blip_info']:SetBlipInfoTitle(BankLocations.blip, Translation[Config.Locale]['atm_blip'], false)
			exports['blip_info']:SetBlipInfoImage(BankLocations.blip, "banking_banner", "fleeca")
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['times1_blip'], Translation[Config.Locale]['times2_blip'])
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['withdraw_blip'], Translation[Config.Locale]['yes_blip'])
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['sendmoney_blip'], Translation[Config.Locale]['yes_blip'])
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['employees_blip'], Translation[Config.Locale]['employees_amount_blip'])
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['place_blip'], Translation[Config.Locale]['place2_blip'])
			exports['blip_info']:AddBlipInfoHeader(BankLocations.blip, "") -- Empty header adds the header line
			exports['blip_info']:AddBlipInfoText(BankLocations.blip, Translation[Config.Locale]['disc_blip'])
		end
	end
end)

RegisterNetEvent("mfp_banking:senddistress")
AddEventHandler("mfp_banking:senddistress",function()
	--SendDistressSignal()
	print("sended distress")
	    TriggerEvent("mfp_banking:goonerobberywithpayout")

end)


function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

function openmenuanimation()
if Config.useAnimation then 
		playAnim('mp_common', 'givetake1_a', 2500)
		Citizen.Wait(2500)
	end
end
