local BaseView = require("packages/mvvm/BaseView")

local MainView = class("MainView", BaseView)

function MainView:onCreate()
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)
end

return MainView
