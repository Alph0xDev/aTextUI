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
CreateThread(function()
    local resourceName = GetCurrentResourceName()
    if resourceName ~= "aTextUI" then
        print("^1[ERROR] The resource name must be 'aTextUI' but is '"..resourceName.."'.^0")
        print("^3Please rename the folder to 'aTextUI' to avoid issues.^0")
        StopResource(resourceName)
    end
end)
