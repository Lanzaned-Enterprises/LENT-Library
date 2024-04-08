Config = Config or {}

Config.Framework = {
    ['Notify'] = "qb", -- qb, esx, ps, custom
    ['Phone'] = "qb", -- qb, gks, qs, npwd
    ['Dispatch'] = "ps", -- ps, cd, custom
}

function Config.SendCustomNotification(text, type, time)
    -- Change here

    -- Default F8 Print Statements / Server Console
    print(text)

    -- Mythic Notify: https://github.com/wowpanda/mythic_notify
    if GetResourceState("mythic_notify") == "started" then
        exports['mythic_notify']:DoHudText(type, text)
    end
end

function Config.SendCustomPoliceAlert(x, y, z, message, code, description, sprite, color, scale, time, jobs)
    return print(message)
end