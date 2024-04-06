if GetResourceState("qb-core") == "started" then QBCore = exports['qb-core']:GetCoreObject() end
if GetResourceState("es_extended") == "started" then ESX = exports['es_extended']:getSharedObject() end

function SendNotification(text, type, time)
    time = time or 2500
    local C == Config.Framework['Notify']
    if C == "qb" then
        QBCore.Functions.Notify(text, type, time)
    elseif C == "esx" then
        ESX.ShowNotification(text, true, true, 140)
    elseif C == "ps" then
        exports['ps-ui']:Notify(text, type, time)
    elseif C == "custom" then
        Config.SendCustomNotification(text, type, time)
    end
end exports("SendNotification", SendNotification)
RegisterNetEvent("LENT-Library:Client:SendNotification", function(text, type time)
    SendNotification(text, type, time)
end)

function SendPhoneEmail(Sender, Subject, Message)
    local C = Config.Framework['Phone']
    if C == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Sender,
            subject = Subject,
            message = Message,
        })
    elseif C == 'gks' then
        local MailData = {
            sender = Sender,
            image = '/html/static/img/icons/mail.png',
            subject = Subject,
            message = Message
          }
          exports["gksphone"]:SendNewMail(MailData)
    elseif C == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = Sender,
            subject = Subject,
            message = Message,
        })
    elseif C == 'npwd' then
        exports["npwd"]:createNotification({
            notisId = "LENT:EMAIL",
            appId = "EMAIL",
            content = Message,
            secondaryTitle = Sender,
            keepOpen = false,
            duration = 5000,
            path = "/email",
        })
    end
end exports("SendPhoneEmail", SendPhoneEmail)
RegisterNetEvent("LENT-Library:Client:SendPhoneEmail", function(Sender, Subject, Message)
    SendPhoneEmail(Sender, Subject, Message)
end)