
local MyApp = class("MyApp", cc.load("mvc").AppBase)

cc.load("mvvm")

function MyApp:onCreate()
    math.randomseed(os.time())
end

return MyApp
