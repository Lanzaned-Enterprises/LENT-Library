function SendServerNotification(text, type, time)
    TriggerClientEvent("LENT-Library:Client:SendNotification", source, text, type, time)
end exports("ServerNotification", SendServerNotification)

function SendServerPhoneEmail(Sender, Subject, Message)
    TriggerClientEvent("LENT-Library:Client:SendPhoneEmail", source, Sender, Subject, Message)
end exports("ServerPhoneMail", SendServerPhoneEmail)