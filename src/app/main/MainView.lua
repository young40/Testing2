local BaseView = cc.load("mvvm").BaseView

---@class MainView
local MainView = class("MainView", BaseView)

function MainView:initView()
    self.sprHelloWorld = display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)

    self.lblHelloWorld = cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)

    self.lblHelloThanks = cc.Label:createWithSystemFont("Hello 谢谢", "Arial", 40)
        :move(display.cx, display.cy + 100)
        :addTo(self)
end

function MainView:initBind()
end

return MainView
