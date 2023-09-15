ShowHelpNotification = function(text)
	AddTextEntry("HelpNotification", text)
    DisplayHelpTextThisFrame("HelpNotification", false)
end

CLNotify = function(text)
    ESX.ShowNotification(text)
end

-- ## If you more like the GTA V based native notifications:

-- CLNotify = function(text)
--     SetNotificationTextEntry('STRING')
--     AddTextComponentString(text)
--     DrawNotification(false, true)
-- end

Timeout = function(time)
    cooldown = true
    SetTimeout(time, function()
        cooldown = false
    end)
end