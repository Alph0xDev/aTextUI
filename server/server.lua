local resourceName = GetCurrentResourceName()
local currentVersion = "1.0.0" -- DONT TOUCH THIS
local githubRawURL = "https://github.com/Alph0xDev/aTextUI/blob/main/version.txt"

CreateThread(function()
    PerformHttpRequest(githubRawURL, function(err, text, headers)
        if not text or err ~= 200 then
            print("^1["..resourceName.."] Could not check for updates.^0")
            return
        end

        local latestVersion = text:gsub("%s+", "")
        if latestVersion == currentVersion then
            print("^2["..resourceName.."] You are running the latest version: "..currentVersion.."^0")
        else
            print("^3["..resourceName.."] Update available!^0")
            print("^3["..resourceName.."] Current version: "..currentVersion.." - Latest: "..latestVersion.."^0")
            print("^3["..resourceName.."] Download here: https://github.com/YOUR-GITHUB/REPO^0")
        end
    end, "GET")
end)
CreateThread(function()
    local resourceName = GetCurrentResourceName()
    if resourceName ~= "aTextUI" then
        print("^1[ERROR] The resource name must be 'aTextUI' but is '"..resourceName.."'.^0")
        print("^3Please rename the folder to 'aTextUI' to avoid issues.^0")
        StopResource(resourceName)
    end
end)
