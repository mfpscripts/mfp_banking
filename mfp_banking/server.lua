ESX = nil

if not Config.newESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
	ESX = exports["es_extended"]:getSharedObject()
end

function sendLogs (message,webhook)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

ESX.RegisterServerCallback('mfp_banking:checkpoliceamount', function(source, cb)
    local copsonline = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == Config.policejob then
            copsonline = copsonline + 1
        end
    end
    cb(copsonline)
end)

RegisterServerEvent("mfp_banking:customwithdraw")
AddEventHandler("mfp_banking:customwithdraw", function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	local xMoney = xPlayer.getAccount('bank').money
	
	if xMoney >= total then
	
	xPlayer.addMoney(total)
	xPlayer.removeAccountMoney('bank', total)

	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['withdraw'], (Translation[Config.Locale]['bank_notify_1']):format(money), 'CHAR_BANK_FLEECA', 7 )
	if Dicordlogging then
		TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**[Withdraw]**: $'..total..'', DiscordWebhook['webhook'])
        end
	else
	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['error'], (Translation[Config.Locale]['bank_notify_2']):format(money), 'CHAR_BANK_FLEECA', 7 )
	end
end)

RegisterServerEvent("mfp_banking:customdeposit")
AddEventHandler("mfp_banking:customdeposit", function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = money
	local xMoney = xPlayer.getMoney()
	
	if xMoney >= total then
	
	xPlayer.removeMoney(total)
	xPlayer.addAccountMoney('bank', total)

	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['deposit'], (Translation[Config.Locale]['bank_notify_3']):format(money), 'CHAR_BANK_FLEECA', 7 )
	if Dicordlogging then
		TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**[Deposit]**: $'..total..'', DiscordWebhook['webhook'])
        end
	else
	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['error'], (Translation[Config.Locale]['bank_notify_4']):format(money), 'CHAR_BANK_FLEECA', 7 )
	end
end)

------------ DISCORD LOGGING --------------
RegisterServerEvent('mfp_banking:discordlog')
AddEventHandler('mfp_banking:discordlog', function(message, webhook)
sendLogs(message , webhook)
end)

--- MONEY DISPLAY ---

ESX.RegisterServerCallback('mfp_banking:getMoney', function(source, cb)
	   local _source = source
       local xPlayer = ESX.GetPlayerFromId(_source)
       local money = xPlayer.getMoney()
	   local bank = xPlayer.getAccount('bank').money
	   
	   cb(money, bank)
end)

RegisterServerEvent("mfp_banking:antitoomuchmoney")
AddEventHandler("mfp_banking:antitoomuchmoney", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xBank = xPlayer.getAccount('bank').money
	local maxmoney = Anti_MoneyMax

    if xBank >= maxmoney then
	    if Dicordlogging then
		   TriggerEvent('mfp_banking:discordlog', '__**WARNING**__\n\n**Probaly Cheater because of more than ' ..maxmoney.. '$ on Bank! **\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**[Money on Bank]**: $'..xBank..'', DiscordWebhook['webhook'])
	    else 
	       print("You need to activate discordlogging first!")
	   end
	end
end)

RegisterServerEvent("mfp_banking:welcomePlayer")
AddEventHandler("mfp_banking:welcomePlayer", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xName = xPlayer.getName()


	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['withdraw'], (Translation[Config.Locale]['welcome_player']):format(xName), 'CHAR_BANK_FLEECA', 7 )
	
end)


AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  print(" _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ ")
  print("|     |   __|  _  |   __|     | __  |     |  _  |_   _|   __|")
  print("| | | |   __|   __|__   |   --|    -|-   -|   __| | | |__   |")
  print("|_|_|_|__|  |__|  |_____|_____|__|__|_____|__|    |_| |_____|")
  print("The resource " .. resourceName .. " has been started")
  if Dicordlogging then
		TriggerEvent('mfp_banking:discordlog', "**mfp_banking** has been started succesfully!", DiscordWebhook['webhook'])
        end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  print('The resource ' .. resourceName .. ' was stopped. Created by MFP-Scripts!')
end)


ESX.RegisterServerCallback('mfp_banking:getBillings', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

RegisterServerEvent("mfp_banking:robberystarts")
AddEventHandler("mfp_banking:robberystarts", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local serverid = xPlayer 

    TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['rob2'], Translation[Config.Locale]['withdraw'], Translation[Config.Locale]['robbery_notify1'], 'CHAR_DETONATEPHONE', 9 )
    Citizen.Wait(15000)
    TriggerClientEvent('esx:showNotification', xPlayer.source, Translation[Config.Locale]['robbery_notify2'])
	Citizen.Wait(15000) 
	TriggerClientEvent('esx:showNotification', xPlayer.source, Translation[Config.Locale]['robbery_notify3'])
	
	if Config.use_gcphone then  
	TriggerEvent("mfp_banking:policedistresses", serverid)
	TriggerClientEvent("mfp_banking:senddistress", xPlayer.source)
	   if Dicordlogging then
		 TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**Started robbing an ATM', DiscordWebhook['webhook'])
       end
	else 
    TriggerEvent("mfp_banking:policedistresses", serverid)
	if Dicordlogging then
		TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**Started robbing an ATM', DiscordWebhook['webhook'])
	  end
	TriggerEvent("mfp_banking:goonerobberywithpayout", xPlayer)
	end
	

end)



--- NEW V2.1 ---
RegisterServerEvent('mfp_banking:policedistresses')
AddEventHandler('mfp_banking:policedistresses', function(serverid)
	_source  = source
	xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['atm_rob_police_title'], Translation[Config.Locale]['atm_rob_police_disc'], Translation[Config.Locale]['atm_rob_police_msg'], 'CHAR_CALL911', 7 )
		end		
	end
end)
---

RegisterServerEvent("mfp_banking:goonerobberywithpayout")
AddEventHandler("mfp_banking:goonerobberywithpayout", function(xPlayer)
	local _source = source
	local robbedmoney = Config.PayoutPeak
	
	if Dicordlogging then
		TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**[Robbing ATM]**: 3x $'..robbedmoney..'', DiscordWebhook['webhook'])
    end
	
    TriggerClientEvent('esx:showNotification', xPlayer.source, Translation[Config.Locale]['robbery_notify4'])
    Citizen.Wait(10000)
    TriggerClientEvent('esx:showNotification', xPlayer.source, Translation[Config.Locale]['robbery_notify5'])
	xPlayer.addMoney(robbedmoney)
	TriggerClientEvent('esx:showNotification', xPlayer.source, (Translation[Config.Locale]['robbery_notify6']):format(robbedmoney))
	Citizen.Wait(10000)
	xPlayer.addMoney(robbedmoney)
	TriggerClientEvent('esx:showNotification', xPlayer.source, (Translation[Config.Locale]['robbery_notify7']):format(robbedmoney))
	Citizen.Wait(10000)
	xPlayer.addMoney(robbedmoney)
	TriggerClientEvent('esx:showNotification', xPlayer.source, (Translation[Config.Locale]['robbery_notify8']):format(robbedmoney))

end)
--
--
--
--
--
--
-- Credit update
--
--
--
--
--

ESX.RegisterServerCallback('mfp_banking:getcreditstatus', function(source, cb)
	   MySQL.Async.fetchAll('SELECT * FROM mfp_player_loans WHERE player_id = @playerId AND repaid = 0', {
        ['@playerId'] = playerId
    }, function(result)
        if result[1] then
            local remainingAmount = tonumber(result[1].remaining_amount)
            local hasActiveLoan = true
            cb(hasActiveLoan, remainingAmount)
        else
            local hasActiveLoan = false
            local remainingAmount = 0
            cb(hasActiveLoan, remainingAmount)
        end
    end)
end)


function GetPlayerLoanStatus(playerId, callback)
    MySQL.Async.fetchAll('SELECT * FROM mfp_player_loans WHERE player_id = @playerId AND repaid = 0', {
        ['@playerId'] = playerId
    }, function(result)
        if result[1] then
            local remainingAmount = tonumber(result[1].remaining_amount)
            local hasActiveLoan = true
            callback(hasActiveLoan, remainingAmount)
        else
            local hasActiveLoan = false
            local remainingAmount = 0
            callback(hasActiveLoan, remainingAmount)
        end
    end)
end

RegisterServerEvent("mfp_banking:paycredit")
AddEventHandler("mfp_banking:paycredit", function(xPlayer)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

    GetPlayerLoanStatus(xPlayer.identifier, function(hasActiveLoan, remainingAmount)
        if hasActiveLoan then
            if remainingAmount == Config.creditAmount then
                xPlayer.removeMoney(Config.creditAmount)

                MySQL.Async.execute('UPDATE mfp_player_loans SET remaining_amount = 0, repaid = 1 WHERE player_id = @playerId', {
                    ['@playerId'] = xPlayer.identifier
                }, function(rowsAffected)
                    --xPlayer.removeLicense('credit_license', function()
                        TriggerClientEvent('esx:showNotification', xPlayer.source,Translation[Config.Locale]['payback_successfully'])
                    end)
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source,Translation[Config.Locale]['payback_not_money'])
            end
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source,Translation[Config.Locale]['payback_failed'])
        end
    end)
end)

RegisterServerEvent("mfp_banking:takecredit")
AddEventHandler("mfp_banking:takecredit", function(xPlayer)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

    GetPlayerLoanStatus(xPlayer.identifier, function(hasActiveLoan, remainingAmount)
        if hasActiveLoan then
            TriggerClientEvent('esx:showNotification', xPlayer.source,Translation[Config.Locale]['takecredit_failed'])
        else
            MySQL.Async.execute('INSERT INTO mfp_player_loans (player_id, amount, remaining_amount, repaid) VALUES (@playerId, @creditamount, @creditamount, 0)', {
                ['@playerId'] = xPlayer.identifier,
				['@creditamount'] = Config.creditAmount
            }, function(rowsAffected)
                --xPlayer.addLicense('credit_license', function()
					if Dicordlogging then
						TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\n\n**[Player]**: '..xPlayer.name..'\n**[Identifier]**: || '..xPlayer.identifier..' || \n**[Credit]**: $'..Config.creditAmount..'', DiscordWebhook['webhook'])
					end
					xPlayer.addMoney(Config.creditAmount)
                    TriggerClientEvent('esx:showNotification', xPlayer.source, Translation[Config.Locale]['takecredit_success'])
                end)
        end
    end)
end)

------ COMMANDS ---------
RegisterCommand('takecredit', function(source, args, rawCommand)
    if Config.creditCommands then
	local xPlayer = ESX.GetPlayerFromId(source)


    GetPlayerLoanStatus(xPlayer.identifier, function(hasActiveLoan, remainingAmount)
        if hasActiveLoan then
            TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, 'Du hast bereits einen ausstehenden Kredit.')
        else
            MySQL.Async.execute('INSERT INTO mfp_player_loans (player_id, amount, remaining_amount, repaid) VALUES (@playerId, @creditamount, @creditamount, 0)', {
                ['@playerId'] = xPlayer.identifier,
				['@creditamount'] = Config.creditAmount
            }, function(rowsAffected)
					xPlayer.addMoney(Config.creditAmount)
                    TriggerClientEvent('esx:showNotification', xPlayer.source,'Du hast einen Kredit von ~g~$50,000~s~ aufgenommen. Deine Kreditlizenz wurde aktualisiert.')
                end)
        end
    end)
	end
end, false)

RegisterCommand('paycredit', function(source, args, rawCommand)
    if Config.creditCommands then
	local xPlayer = ESX.GetPlayerFromId(source)

    GetPlayerLoanStatus(xPlayer.identifier, function(hasActiveLoan, remainingAmount)
        if hasActiveLoan then
            if remainingAmount == 50000 then
                xPlayer.removeMoney(50000)

                MySQL.Async.execute('UPDATE mfp_player_loans SET remaining_amount = 0, repaid = 1 WHERE player_id = @playerId', {
                    ['@playerId'] = xPlayer.identifier
                }, function(rowsAffected)
                        TriggerClientEvent('esx:showNotification', xPlayer.source,'Du hast den Kredit vollständig zurückgezahlt. Deine Kreditlizenz wurde entfernt.')
                    end)
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source,'Du musst den vollen Betrag von ~g~$50,000~s~ zurückzahlen.')
            end
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source,'Du hast keinen ausstehenden Kredit.')
        end
    end)
	end
end, false)


-- EXPORT
exports('GetPlayerLoanStatus', GetPlayerLoanStatus)
