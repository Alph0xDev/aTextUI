local resourceName = GetCurrentResourceName()
local CURRENT_VERSION = "1.0.0"
local GITHUB_RAW_URL = "https://raw.githubusercontent.com/Alph0xDev/aTextUI/main/version.txt"

CreateThread(function()
    PerformHttpRequest(GITHUB_RAW_URL, function(err, text, headers)
        if err ~= 200 or not text then
            print("["..resourceName.."] Could not check for updates.")
            return
        end

        local latestVersion = text:match("^%s*(.-)%s*$")
        if latestVersion == CURRENT_VERSION then
            print("["..resourceName.."] You are running the latest version: "..CURRENT_VERSION)
        else
            print("["..resourceName.."] Update available!")
            print("["..resourceName.."] Current version: "..CURRENT_VERSION.." - Latest: "..latestVersion)
            print("["..resourceName.."] Download here: https://github.com/Alph0xDev/aTextUI")
        end
    end, "GET")
end)

CreateThread(function()
    if resourceName ~= "aTextUI" then
        print("^1[ERROR] The resource name must be 'aTextUI' but is '"..resourceName.."'.^0")
        print("^3Please rename the folder to 'aTextUI' to avoid issues.^0")
        StopResource(resourceName)
    end
end)
