Config = {}
Translation = {}
Price = {}
-----------------

Config.Locale = 'en' -- 'en' for english, 'de' for german
Config.newESX = false -- enable if using export as sharedevents-event, make sure to enable the esx/imports.lua in the fxmanifest if true!

Config.EnableBlips = true -- enable Banks shown on the Map
Config.usingProgressbar = false -- enable if you want to use a progressbar while inserting card

-- Anti2muchMoney --
Anit2much = true -- activate a notification if a player have too much money in discord as a warning (maybe a cheater...)
Anti_MoneyMax = 50000000 -- amout for notification

-- Robbery --
Config.minCops = 1 -- min amout of online cops
Config.use_gcphone = false -- if you use GCPhone for police notification, if not write 'false'
Config.policeNumber = 'police' -- the number if you use gcphone for police. Could be '911' / 'police'...
Config.policeJob = 'police' -- jobname to receive blip and more displayed
Config.PayoutPeak = 1000 --- amout of money to get every peak, 3 peaks at one rob! So default you'll get 3.000$

Config.DispatchBlip = {
    Sprite = 526,
    Colour = 1,
    Size = 1.0,
}

-- Credit
Config.creditCommands = false -- to enable 'takecredit' and 'paycredit'
Config.creditAmount = 50000 -- set amout to get money to 50000

Config.BlipTimer = 240 -- seconds, until the blip disappears
Config.usingAdvancedBlips = true


-- daily payments --
Config.AccountGuarantors = 100 -- what you pay for your account every x minutes
Config.DailyTime = 15 -- Time for every x minutes the account guarantors are payed.


-- Discordlogging --
Dicordlogging = false -- type true to enable it!
DiscordWebhook = {
        ['webhook'] = '', -- paste here your webhook
}
	
Config.useAnimation = true -- Set true if you want Animation to insert creditcard

Config.ShopLocations = {
{ ['x'] = 89.75,  ['y'] = 2.35,  ['z'] = 68.31},
{ ['x'] = 1167.02,  ['y'] = -456.32,  ['z'] = 66.79},
{ ['x'] = -386.733,  ['y'] = 6045.953,  ['z'] = 31.501},
{ ['x'] = -284.037,  ['y'] = 6224.385,  ['z'] = 31.187},
{ ['x'] = -284.037,  ['y'] = 6224.385,  ['z'] = 31.187},
{ ['x'] = -135.165,  ['y'] = 6365.738,  ['z'] = 31.101},
{ ['x'] = -110.753,  ['y'] = 6467.703,  ['z'] = 31.784},
{ ['x'] = -94.9690,  ['y'] = 6455.301,  ['z'] = 31.784},
{ ['x'] = 155.4300,  ['y'] = 6641.991,  ['z'] = 31.784},
{ ['x'] = 174.6720,  ['y'] = 6637.218,  ['z'] = 31.784},
{ ['x'] = 1703.138,  ['y'] = 6426.783,  ['z'] = 32.730},
{ ['x'] = 1735.114,  ['y'] = 6411.035,  ['z'] = 35.164},
{ ['x'] = 1702.842,  ['y'] = 4933.593,  ['z'] = 42.051},
{ ['x'] = 1967.333,  ['y'] = 3744.293,  ['z'] = 32.272},
{ ['x'] = 1821.917,  ['y'] = 3683.483,  ['z'] = 34.244},
{ ['x'] = 1174.532,  ['y'] = 2705.278,  ['z'] = 38.027},
{ ['x'] = 540.0420,  ['y'] = 2671.007,  ['z'] = 42.177},
{ ['x'] = 2564.399,  ['y'] = 2585.100,  ['z'] = 38.016},
{ ['x'] = 2558.683,  ['y'] = 349.6010,  ['z'] = 108.050},
{ ['x'] = 2558.051,  ['y'] = 389.4817,  ['z'] = 108.660},
{ ['x'] = 1077.692,  ['y'] = -775.796,  ['z'] = 58.218},
{ ['x'] = 1139.018,  ['y'] = -469.886,  ['z'] = 66.789},
{ ['x'] = 1168.975,  ['y'] = -457.241,  ['z'] = 66.641},
{ ['x'] = 1153.884,  ['y'] = -326.540,  ['z'] = 69.245},
{ ['x'] = 381.2827,  ['y'] = 323.2518,  ['z'] = 103.270},
{ ['x'] = 265.0043,  ['y'] = 212.1717,  ['z'] = 106.780},
{ ['x'] = 285.2029,  ['y'] = 143.5690,  ['z'] = 104.970},
{ ['x'] = 157.7698,  ['y'] = 233.5450,  ['z'] = 106.450},
{ ['x'] = -164.568,  ['y'] = 233.5066,  ['z'] = 94.919},
{ ['x'] = -1827.04,  ['y'] = 785.5159,  ['z'] = 138.020},
{ ['x'] = -1409.39,  ['y'] = -99.2603,  ['z'] = 52.473},
{ ['x'] = -1205.35,  ['y'] = -325.579,  ['z'] = 37.870},
{ ['x'] = -1215.64,  ['y'] = -332.231,  ['z'] = 37.881},
{ ['x'] = -2072.41,  ['y'] = -316.959,  ['z'] = 13.345},
{ ['x'] = -2975.72,  ['y'] = 379.7737,  ['z'] = 14.992},
{ ['x'] = -2962.60,  ['y'] = 482.1914,  ['z'] = 15.762},
{ ['x'] = -2955.70,  ['y'] = 488.7218,  ['z'] = 15.486},
{ ['x'] = -3044.22,  ['y'] = 595.2429,  ['z'] = 7.595},
{ ['x'] = -3144.13,  ['y'] = 1127.415,  ['z'] = 20.868},
{ ['x'] = -3241.10,  ['y'] = 996.6881,  ['z'] = 12.500},
{ ['x'] = -3241.11,  ['y'] = 1009.152,  ['z'] = 12.877},
{ ['x'] = -1305.40,  ['y'] = -706.240,  ['z'] = 25.352},
{ ['x'] = -538.225,  ['y'] = -854.423,  ['z'] = 29.234},
{ ['x'] = -711.156,  ['y'] = -818.958,  ['z'] = 23.768},
{ ['x'] = -717.614,  ['y'] = -915.880,  ['z'] = 19.268},
{ ['x'] = -526.566,  ['y'] = -1222.90,  ['z'] = 18.434},
{ ['x'] = -256.831,  ['y'] = -719.646,  ['z'] = 33.444},
{ ['x'] = -203.548,  ['y'] = -861.588,  ['z'] = 30.205},
{ ['x'] = 112.4102,  ['y'] = -776.162,  ['z'] = 31.427},
{ ['x'] = 112.9290,  ['y'] = -818.710,  ['z'] = 31.386},
{ ['x'] = 119.9000,  ['y'] = -883.826,  ['z'] = 31.191},
{ ['x'] = -846.304,  ['y'] = -340.402,  ['z'] = 38.687},
{ ['x'] = -1204.35,  ['y'] = -324.391,  ['z'] = 37.877},
{ ['x'] = -1216.27,  ['y'] = -331.461,  ['z'] = 37.773},
{ ['x'] = -56.1935,  ['y'] = -1752.53,  ['z'] = 29.452},
{ ['x'] = -261.692,  ['y'] = -2012.64,  ['z'] = 30.121},
{ ['x'] = -273.001,  ['y'] = -2025.60,  ['z'] = 30.197},
{ ['x'] = -351.534,  ['y'] = -49.529,  ['z'] = 49.042},
{ ['x'] = 24.589,  ['y'] = -946.056,  ['z'] = 29.357},
{ ['x'] = -254.112,  ['y'] = -692.483,  ['z'] = 33.616},
{ ['x'] = -1570.197,  ['y'] = -546.651,  ['z'] = 34.955},
{ ['x'] = -1415.909,  ['y'] = -211.825,  ['z'] = 46.500},
{ ['x'] = -1430.112,  ['y'] = -211.014,  ['z'] = 46.500},
{ ['x'] = 33.232,  ['y'] = -1347.849,  ['z'] = 29.497},
{ ['x'] = 129.216,  ['y'] = -1292.347,  ['z'] = 29.269},
{ ['x'] = 287.645,  ['y'] = -1282.646,  ['z'] = 29.659},
{ ['x'] = 289.012,  ['y'] = -1256.545,  ['z'] = 29.440},
{ ['x'] = 295.839,  ['y'] = -895.640,  ['z'] = 29.217},
{ ['x'] = 1686.753,  ['y'] = 4815.809,  ['z'] = 42.008},
{ ['x'] = -302.408,  ['y'] = -829.945,  ['z'] = 32.417},
{ ['x'] = 5.134,  ['y'] = -919.949,  ['z'] = 29.557},
{ ['x'] = 315.89,  ['y'] = -594.18,  ['z'] = 43.3},
{ ['x'] = 231.57,  ['y'] = 367.4,  ['z'] = 106.13},
{ ['x'] = 146.47,  ['y'] = -1034.66,  ['z'] = 29.34},
{ ['x'] = -320.64,  ['y'] = 6115.42,  ['z'] = 33.23},
{ ['x'] = -3227.8,  ['y'] = 787.77,  ['z'] = 14.08},
{ ['x'] = 1116.07,  ['y'] = 220.07,  ['z'] = -49.44},
{ ['x'] = -199.29,  ['y'] = -1308.47,  ['z'] = 31.29},
{ ['x'] = -1040.41,  ['y'] = -423.02,  ['z'] = 39.62},
{ ['x'] = -35.36,  ['y'] = -212.57,  ['z'] = 44.77},
{ ['x'] = -29.37,  ['y'] = -724.85,  ['z'] = 44.24},
{ ['x'] = 187.65,  ['y'] = -893.95,  ['z'] = 30.17},
{ ['x'] = -1391.01,  ['y'] = -590.42,  ['z'] = 30.32}, -- still at more if you want so!
}

Config.BankLocations = {
{ ['x']= 150.266, ['y']= -1040.203, ['z']= 29.374},
{ ['x']= -1212.980, ['y']= -330.841, ['z']= 37.787},
{ ['x']= -2962.582, ['y']= 482.627, ['z']= 15.703},
{ ['x']= -112.202, ['y']= 6469.295, ['z']= 31.626},
{ ['x']= 314.187, ['y']= -278.621, ['z']= 54.170},
{ ['x']= -351.534, ['y']= -49.529, ['z']= 49.042},
{ ['x']= 255.0, ['y']= 217.5, ['z']= 106.286}, -- default: { ['x']= 241.727, ['y']= 220.706, ['z']= 106.286},
{ ['x']= 1175.0643310547, ['y']= 2706.6435546875, ['z']= 38.094036102295},

}

Config.Npc = { -- coords to add more npc's [dealers] you want
   { ['x'] = 149.5, ['y'] = -1042.8, ['z'] = 28.4, ['h'] = 341.99}, -- more are possible
   { ['x'] = 253.7, ['y'] = 215.6, ['z'] = 106.3-1, ['h'] = 336.4}, 
   { ['x'] = 258.6, ['y'] = 228.2, ['z'] = 106.3-1, ['h'] = 159.97}, 

}



Price = { -- atm amount that is showed!
        ['atm1'] = 100,
		['atm2'] = 500,
		['atm3'] = 1000,
		['atm4'] = 10000
    }
	
Translation = {
    ['en'] = {
        ['open_menu'] = 'Press ~INPUT_PICKUP~ to access the ATM',
		--- MAINMENU
		['atm'] = 'Fleeca',
		['atm_subtitle'] = 'ATM',
		['withdraw'] = 'Withdraw',
	    ['deposit'] = 'Deposit',
		['billings'] = '~b~Billings',
		['billings_disc'] = 'Invoices received',
		--------------------------------------
		['money_in_cash'] = '~g~Cash',
		['money_in_bank'] = '~o~Balance',
		----------------------------------------
		['rob'] = '~r~Rob',
		['rob2'] = 'Rob',
		['rob_disc'] = '~r~Rob the ATM!',
		['rob_disc_item'] = '~o~Are you sure you want to do this?',
		['stop'] = '~r~Cancel',
		['yes'] = '~g~Yes',
		['error'] = 'Error',
		['atm_blip'] = 'ATM',
		----------------------------------------
		['withdraw_disc'] = 'Withdraw money from your account',
		['withdraw_disc_info_item'] = 'Withdraw money:',
		['withdraw_custom_item'] = '~g~Custom payout',
		['withdraw_custom_box'] = 'How much do you want to withdraw?',
		['deposit_disc'] = 'Deposit money into your account',
		['deposit_disc_info_item'] = 'Deposit money:',
		['deposit_custom_item'] = '~g~Custom deposit',
		['deposit_custom_box'] = 'How much do you want to deposit?',
		['login'] = 'Login',
		['logout'] = 'Logout',
		['login_disc'] = 'Access the ~b~ATM~w~!',
		['logout_disc'] = 'Log out of the ~b~ATM~w~!',
		-----
		['atm1'] = '~g~100$', -- still change like the Config.Price's are!
		['atm2'] = '~g~500$',
		['atm3'] = '~g~1 000$',
		['atm4'] = '~g~10 000$',
		-----
		['bank_notify_1'] = '~g~%s$~s~ have been withdrawn from your account',
		['bank_notify_2'] = '~r~No %s$~w~ can be withdrawn if you do not have them!',
		['bank_notify_3'] = 'There were ~g~%s$~s~ deposited in your account',
		['bank_notify_4'] = 'You can ~r~not include %s$~w~ if you do not have them!',
		----
		['welcome'] = '~b~Welcome back!',
		['welcome_player'] = 'Welcome back, ~b~%s~w~! Your Fleeca Bank LS is always at your service!',
		---- NEW in V2 ----
		['robbery_notify1'] = '~r~You start tampering with the ATM...~w~',
		['robbery_notify2'] = 'The display can be detached now, better do it fast!',
		['robbery_notify3'] = '~r~The cash box could be broken open.... The cops were notified...',
		['robbery_notify4'] = '~r~You pull out the first cash box...~w~',
		['robbery_notify5'] = 'You see the bundles and start packing them!',
		['robbery_notify6'] = 'These were ~g~$%s~w~!',
		['robbery_notify7'] = 'These were more ~g~$%s~w~!',
		['robbery_notify8'] = 'That was ~g~$%s~w~ again! Now the ATM is empty, run!',
		----
		['police_notify'] = 'An ATM reports a malfunction or forced entry!',
		['robbery_notenough'] = 'There is not enough police in Los Santos!',
		--- NEW in 2.1
		['transfer'] = 'Transfer',
		['transfer_menu_but'] = '~o~Transfer',
		['transfer_disc'] = 'Make a transfer to another player.',
		['tranfer_button'] = '~g~Do the transfer',
		['daily_costs_title'] = 'Accountmaintenancecharge',
		['daily_costs_msg'] = 'You have had ~r~$%s~w~ deducted.',
		['daily_costs_msg_failed'] = '~r~You could not afford the account maintenance fees...',
		['transfer_failed_self'] = '~r~You can not transfer money to yourself.',
		['transfer_failed_too_much'] = '~r~You can not transfer that much if you do not own it.',
		['transfer_success'] = 'You transfer ~r~$ %s~s~ to ~r~%s.',
		['transfer_received'] = 'You will receive a transfer in the amount of ~g~$ %s~s~ through ~g~%s.',
		['transfer_who_received'] = 'What is the IBAN of the recipient?',
		['transfer_amount'] = 'How much do you want to transfer?',
		['atm_rob_police_title'] = 'ATM alert',
		['atm_rob_police_disc'] = 'ATM Security System',
		['atm_rob_police_msg'] = 'An ATM machine reports suspicious activity.',
		['atm_rob_police_blip'] = 'ATM - Dispatch',
		--- advancedblips
		['times1_blip'] = 'Opening hours',
		['times2_blip'] = '5:00 AM - 10:30 PM',
		['withdraw_blip'] = 'Cash Withdrawal',
		['yes_blip'] = 'Yes',
		['sendmoney_blip'] = 'Transfers',
		['employees_blip'] = 'Employees',
		['employees_amount_blip'] = '1-2',
		['place_blip'] = 'Location',
		['place2_blip'] = 'Public Bank',
		['disc_blip'] = 'Your Fleeca Bank Los Santos is there for you at all times. Safely deposit your money & benefit from numerous advantages!',
		---- update
		['transactions_info'] = 'Transactions',
		['payback_message'] = 'You still have an outstanding credit of ~r~$%s~s~. Please repay it.',
		['payback_successfully'] = 'You have fully repaid the credit.',
		['payback_not_money'] = 'You must repay the full amount of ~g~$50,000~s~.',
		['payback_failed'] = 'You must repay the full amount of ~g~$50,000~s~.',
		['takecredit_failed'] = 'You already have an ongoing credit with this bank. Repay it to take a new one.',
		['takecredit_success'] = 'You have taken a credit of ~g~$50,000~s~.',
		['credit_info'] = 'Credit: $50,000',
		['paycredit_info'] = '~p~Pay back credit',
		['takecredit_info'] = '~p~Take credit',
		['credit'] = 'Credit',
		['credit2'] = 'Take a credit',
		['insertcard'] = 'Insert Creditcard...',
		
		--
	},

    ['de'] = {
        ['open_menu'] = 'Drücke ~INPUT_PICKUP~ um auf den ATM zuzugreifen',
		['open_menu2'] = 'Drücke ~INPUT_PICKUP~ um dein Bankkonto zu verwalten',
		--- HAUPTMENU
		['atm'] = 'Fleeca',
		['atm_subtitle'] = 'Fleecabanking',
		['withdraw'] = 'Abheben',
	    ['deposit'] = 'Einzahlen',
		['billings'] = '~b~Rechnungen',
		['billings_disc'] = 'Eingegangende Rechnungen',
		--------------------------------------
		['money_in_cash'] = '~g~Bargeld',
		['money_in_bank'] = '~o~Kontostand',
		----------------------------------------
		['rob'] = '~r~Ausrauben',
		['rob2'] = 'Ausrauben',
		['rob_disc'] = '~r~Raube den ATM aus!',
		['rob_disc_item'] = '~o~Sind Sie sicher, dass Sie dies tun wollen?',
		['stop'] = '~r~Abbrechen',
		['yes'] = '~g~Ja',
		['error'] = 'Fehler',
		['atm_blip'] = 'Fleecabank',
		----------------------------------------
		['withdraw_disc'] = 'Heben Sie Geld Ihrem Konto ab',
		['withdraw_disc_info_item'] = 'Geld auszahlen lassen:',
		['withdraw_custom_item'] = '~g~Eigene Auszahlung',
		['withdraw_custom_box'] = 'Wie viel möchten Sie abheben?',
		['deposit_disc'] = 'Zahlen Sie Geld auf Ihr Konto ein',
		['deposit_disc_info_item'] = 'Geld einzuzahlen:',
		['deposit_custom_item'] = '~g~Eigene Einzahlung',
		['deposit_custom_box'] = 'Wie viel möchten Sie einzahlen?',
		['login'] = 'Einloggen',
		['logout'] = 'Ausloggen',
		['login_disc'] = 'Greifen Sie auf den ~b~ATM~w~ zu!',
		['logout_disc'] = 'Melden Sie sich aus dem ~b~ATM~w~ aus!',
		-----
		['atm1'] = '~g~100$',
		['atm2'] = '~g~500$',
		['atm3'] = '~g~1 000$',
		['atm4'] = '~g~10 000$',
		-----
		['bank_notify_1'] = 'Es wurden ~g~%s$~s~ von deinem Konto abgehoben',
		['bank_notify_2'] = 'Es können ~r~keine %s$~w~ abgehoben werden, wenn Sie diese nicht besitzen!',
		['bank_notify_3'] = 'Es wurden ~g~%s$~s~ auf deinem Konto eingezahlt',
		['bank_notify_4'] = 'Es können ~r~keine %s$~w~ eingezahlt werden, wenn Sie diese nicht besitzen!',
		----
		['welcome'] = '~b~Willkommen zurück!',
		['welcome_player'] = 'Herzlich willkommen zurück, ~b~%s~w~! Ihre Fleeca Bank LS steht Ihnen jederzeit zur Seite!',
		---- NEU in V2 ----
		['robbery_notify1'] = '~r~Du fängst an dich am Automaten zu schaffen zu machen...~w~',
		['robbery_notify2'] = 'Das Display lässt sich jetzt lösen, mach lieber schnell!',
		['robbery_notify3'] = '~r~Die Geldkassette konnte aufgebrochen werden... Die Cops wurden verständigt...',
		['robbery_notify4'] = '~r~Du ziehst die erste Geldkassette raus...~w~',
		['robbery_notify5'] = 'Du siehst die Bündel und fängst an diese einzupacken!',
		['robbery_notify6'] = 'Das waren ~g~$%s~w~!',
		['robbery_notify7'] = 'Das waren weitere ~g~$%s~w~!',
		['robbery_notify8'] = 'Das waren wieder ~g~$%s~w~! Jetzt ist der Automat leer, lauf!',
		----
		['police_notify'] = 'Ein Geldautomat meldet eine Störung oder einen gewaltsames Eindringen!',
		['robbery_notenough'] = 'Es sind nicht genug Polizisten im Dienst.',
		--- NEU in 2.1
		['transfer'] = 'Überweisung',
		['transfer_menu_but'] = '~o~Überweisung',
		['transfer_disc'] = 'Tätige eine Überweisung an einen anderen Spieler.',
		['tranfer_button'] = '~g~Überweisung tätigen',
		['daily_costs_title'] = 'Kontoführungsgebühr',
		['daily_costs_msg'] = 'Dir wurden ~r~$%s~w~ abgezogen.',
		['daily_costs_msg_failed'] = '~r~Du konntest dir die Kontoführungsgebüren nicht leisten',
		['transfer_failed_self'] = '~r~Du kannst dir nicht selber Geld überweisen.',
		['transfer_failed_too_much'] = '~r~Du kannst nicht soviel überweisen, wenn du es nicht besitzt.',
		['transfer_success'] = 'Du überweist ~r~$ %s~s~ an ~r~%s.',
		['transfer_received'] = 'Du erhälst eine Überweisung in Höhe von ~g~$ %s~s~ durch ~g~%s.',
		['transfer_who_received'] = 'Wie lautet die IBAN des Empfängers?',
		['transfer_amount'] = 'Wie viel möchten Sie überweisen?',
		['atm_rob_police_title'] = 'Geldautomatenwarnung',
		['atm_rob_police_disc'] = 'ATM Security System',
		['atm_rob_police_msg'] = 'Ein Geldautomat meldet verdächtige Aktivitäten.',
		['atm_rob_police_blip'] = 'Geldautomat - Einsatzort',
		--- advancedblips
		['times1_blip'] = 'Öffnungszeiten',
		['times2_blip'] = '5:00 - 22:30 Uhr',
		['withdraw_blip'] = 'Bargeldauszahlung',
		['yes_blip'] = 'Ja',
		['sendmoney_blip'] = 'Überweisungen',
		['employees_blip'] = 'Mitarbeiter',
		['employees_amount_blip'] = '1-2',
		['place_blip'] = 'Ort',
		['place2_blip'] = 'öffentliche Bank',
		['disc_blip'] = 'Deine Fleecabank Los Santos steht Dir jederzeit zur Seite. Deportiere sicher Dein Geld & profitiere von zahlreichen Vorteilen!',
		----
		--- advancedblips
		['times1_blip'] = 'Öffnungszeiten',
		['times2_blip'] = '5:00 - 22:30 Uhr',
		['withdraw_blip'] = 'Bargeldauszahlung',
		['yes_blip'] = 'Ja',
		['sendmoney_blip'] = 'Überweisungen',
		['employees_blip'] = 'Mitarbeiter',
		['employees_amount_blip'] = '1-2',
		['place_blip'] = 'Ort',
		['place2_blip'] = 'öffentliche Bank',
		['disc_blip'] = 'Deine Fleecabank Los Santos steht Dir jederzeit zur Seite. Deportiere sicher Dein Geld & profitiere von zahlreichen Vorteilen!',
		---- update
		['transactions_info'] = 'Transaktionen',
		['payback_message'] = 'Du hast noch einen ausstehenden Kredit von ~r~$%s~s~. Zahle ihn bitte zurück.',
		['payback_successfully'] = 'Du hast den Kredit vollständig zurückgezahlt.',
		['payback_not_money'] = 'Du musst den vollen Betrag von ~g~$50,000~s~ zurückzahlen.',
		['payback_failed'] = 'Du musst den vollen Betrag von ~g~$50,000~s~ zurückzahlen.',
		['takecredit_failed'] = 'Du hast bereits einen laufenden Kredit bei dieser Bank. Zahle ihn ab um einen neuen aufzunehmen.',
		['takecredit_success'] = 'Du hast einen Kredit von ~g~$50,000~s~ aufgenommen.',
		['credit_info'] = 'Credit: 50.000$',
		['paycredit_info'] = '~p~Kredit abbezahlen',
		['takecredit_info'] = '~p~Kredit nehmen',
		['credit'] = 'Kredit',
		['credit2'] = 'Nehme einen Kredit auf',
		['insertcard'] = 'Kreditkarte wird eingesteckt.',

    },
}