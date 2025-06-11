ESX = nil

if not Config.newESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
	ESX = exports["es_extended"]:getSharedObject()
end

--- NEW V2.1 ---
Citizen.CreateThread(function()
	while true do
	 for k, playerid in pairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerid)
		local xMoney = xPlayer.getAccount('bank').money
		local money = 100
		if xMoney >= money then
            xPlayer.removeAccountMoney('bank', money)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['daily_costs_title'], (Translation[Config.Locale]['daily_costs_msg']):format(money), 'CHAR_BANK_FLEECA', 9 )
		else
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['daily_costs_title'], Translation[Config.Locale]['daily_costs_msg_failed'], 'CHAR_BANK_FLEECA', 9 )
		end
	 end
	 
	 local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer then
                GetPlayerLoanStatus(xPlayer.identifier, function(hasActiveLoan, remainingAmount)
                    if hasActiveLoan and remainingAmount > 0 then
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['daily_costs_title'], (Translation[Config.Locale]['payback_message']):format(remainingAmount), 'CHAR_BANK_FLEECA', 9 )
					end
                end)
            end
        end
	 Citizen.Wait(Config.DailyTime * 60000)
	end

end)


RegisterServerEvent('mfp_banking:syncPosition')
AddEventHandler('mfp_banking:syncPosition', function(position)
    local xPlayer = ESX.GetPlayerFromId(source)
	print("serversidesync: " ..position)
    TriggerClientEvent('mfp_banking:alarm', -1, position)
end)

RegisterServerEvent('mfp_banking:start2serverside')
AddEventHandler('mfp_banking:start2serverside', function()
    print(source)
    TriggerClientEvent('mfp_banking:sendCoords', source)
end)




--- NEW V2.1 ---
RegisterServerEvent('mfp_banking:transfer')
AddEventHandler('mfp_banking:transfer', function(receiver, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xReceiver = ESX.GetPlayerFromId(receiver)
    local balance = xPlayer.getAccount('bank').money

    if xReceiver ~= nil and GetPlayerEndpoint(receiver) ~= nil then
        balance2 = xReceiver.getAccount('bank').money

        if tonumber(_source) == tonumber(receiver) then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['transfer'], Translation[Config.Locale]['transfer_failed_self'], 'CHAR_BANK_FLEECA', 7)
        else
            if balance <= 0 or balance < tonumber(amount) or tonumber(amount) <= 0 then
                TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['transfer'], Translation[Config.Locale]['transfer_failed_too_much'], 'CHAR_BANK_FLEECA', 7) 
            else
                xPlayer.removeAccountMoney('bank', tonumber(amount))
                xReceiver.addAccountMoney('bank', tonumber(amount))
                TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['atm'], Translation[Config.Locale]['transfer'], (Translation[Config.Locale]['transfer_success']):format(amount, receiver), 'CHAR_BANK_FLEECA', 7)
                TriggerClientEvent('esx:showAdvancedNotification', receiver, Translation[Config.Locale]['atm'], Translation[Config.Locale]['transfer'], (Translation[Config.Locale]['transfer_received']):format(amount, _source), 'CHAR_BANK_FLEECA', 7)
                  if Dicordlogging then
				     TriggerEvent('mfp_banking:discordlog', '__**mfp_banking**__\nBank transfer\n\n**[Sender]**: '..xPlayer.name..'\n**[Receiver]**: || '..xReceiver.name..' || \n**[Amount]**: || '..amount..'', DiscordWebhook['webhook'])
			      end
		    end

        end
    end

end)

--------------------------------------