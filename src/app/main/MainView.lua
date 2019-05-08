local BaseView = require("packages/mvvm/BaseView")

function cc.Sprite:bindFile()
    print("oooooooooo")
end

local MainView = class("MainView", BaseView)

function MainView:onCreate()
    self.sprHelloWorld = display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self):bindFile()

    self.lblHelloWorld = cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)

    self.lblHelloThanks = cc.Label:createWithSystemFont("Hello 谢谢", "Arial", 40)
        :move(display.cx, display.cy + 100)
        :addTo(self)
end

return MainView
