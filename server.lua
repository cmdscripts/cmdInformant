ESX.RegisterServerCallback('CheckMoney', function(source, cb, price)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getAccount('black_money').money >= price then
		xPlayer.removeAccountMoney('black_money', tonumber(price))
		cb(true)
	else
		cb(false)
	end
end)