-- Auto-generated loader
local URL = "https://raw.githubusercontent.com/Schlouie/testnumber2/main/CometZ.lua"

local function httpGet(url)
    if typeof(syn) == "table" and type(syn.request) == "function" then
        local ok, res = pcall(syn.request, {Url = url, Method = "GET"})
        if ok and type(res) == "table" then local b = res.Body or res.body; if type(b) == "string" and #b > 0 then return b end end
    end
    if type(request) == "function" then
        local ok, res = pcall(request, {Url = url, Method = "GET"})
        if ok and type(res) == "table" then local b = res.Body or res.body or res.Data or res.data; if type(b) == "string" and #b > 0 then return b end end
    end
    if typeof(http) == "table" and type(http.request) == "function" then
        local ok, res = pcall(http.request, {Url = url, Method = "GET"})
        if ok and type(res) == "table" then local b = res.Body or res.body or res.Data or res.data; if type(b) == "string" and #b > 0 then return b end end
    end
    if type(http_request) == "function" then
        local ok, res = pcall(http_request, {Url = url, Method = "GET"})
        if ok and type(res) == "table" then local b = res.Body or res.body; if type(b) == "string" and #b > 0 then return b end end
    end
    if type(game.HttpGet) == "function" then
        local ok, r = pcall(function() return game:HttpGet(url, true) end)
        if ok and type(r) == "string" and #r > 0 then return r end
    end
    if type(game.HttpGetAsync) == "function" then
        local ok, r = pcall(function() return game:HttpGetAsync(url) end)
        if ok and type(r) == "string" and #r > 0 then return r end
    end
    local hs = game:GetService("HttpService")
    if hs and type(hs.GetAsync) == "function" then
        local ok, r = pcall(function() return hs:GetAsync(url, true) end)
        if ok and type(r) == "string" and #r > 0 then return r end
    end
    error("[loader] no working HTTP method for " .. url)
end

local src = httpGet(URL)
if type(src) ~= "string" or #src == 0 then error("[loader] empty response") end
if src:sub(1,1) == "<" then error("[loader] server returned HTML") end

local chunk, err = (loadstring or load)(src, "@" .. URL)
if not chunk then error("[loader] compile error: " .. tostring(err)) end
return chunk()