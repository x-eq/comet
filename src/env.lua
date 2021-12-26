local env = getgenv()

env["import"] = function(tableOfArguments)
    assert(tableOfArguments, ("Failed to import."))

    local format = rawget(string, "format")
    local user = (tableOfArguments["user"] or "Belkworks")
    local repository = tableOfArguments["repository"]
    local branch = (tableOfArguments["branch"] or "master")
    local file = (tableOfArguments["file"] or "init.lua")

    return loadstring(game:HttpGet(
        format("https://github.com/%s/%s/blob/%s/%s?raw=true", user, repository, branch, file)
    ))()
end

env["Services"] = {
    ["Players"] = game:GetService("Players"),
    ["RunService"] = game:GetService("RunService"),
    ["Workspace"] = game:GetService("Workspace") or game.workspace or workspace or (getrenv()).workspace,
    ["CoreGui"] = game:GetService("CoreGui"),
    ["ContentProvider"] = game:GetService("ContentProvider"),
    ["Lighting"] = game:GetService("Lighting"),
    ["ReplicatedStorage"] = game:GetService("ReplicatedStorage")
}

env["LocalPlayer"] = Services["Players"].LocalPlayer

return(env)
