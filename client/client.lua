local textUIActive = false

function ShowTextUI(text, style, key)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "show",
        text = text,
        style = style or "blue",
        key = key or "E",
        position = Config.DefaultPosition
    })
    textUIActive = true
end

function HideTextUI()
    SendNUIMessage({
        action = "hide"
    })
    textUIActive = false
end
