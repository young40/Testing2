
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

local function bind(node, nodeFunc, t, key)
    -- dump(node)
    -- dump(nodeFunc)
    -- dump(t)
    dump(key)
end

local Bindable = {}

function Bindable:ctor(child)
    local mt = getmetatable(child) or {}
    dump(mt)

    if mt.__index then
        -- error("__index")
    end

    if mt.__newindex then
        error("__newindex")
    end

    mt.__index = function(t, key)
        return mt[key]
    end

    mt.__newindex = function(t, key, value)
        local oldValue = mt[key]

        if oldValue == value then
            return
        end

        mt[key] = value

        print("update: " .. key .. "  " .. value)
    end

    setmetatable(child, mt)

    dump(mt)
end

local DataSource = class("DataSource", Bindable)

function DataSource:ctor()
    self.super:ctor(self)

    self.str = "你好"
end

function MainScene:onCreate()
    -- add background image
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)


    -- add HelloWorld label
    local h1 = cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)


    local h2 = cc.Label:createWithSystemFont("Hello 谢谢", "Arial", 40)
        :move(display.cx, display.cy + 100)
        :addTo(self)

    local t = DataSource.new()

    print(t.str)
    t.str = "大笑三声"

    bind(h1, h1.setString, t, "str")
    bind(h2, h2.setString, t, "str")

    -- setmetatable(t, {
    --                  __index = function(t, key)
    --                      print(t)
    --                      print(key)

    --                      return 40
    --                  end,
    --                  __newindex = function(t, key, value)
    --                      print(t)
    --                      print(key)
    --                      print(value)
    --                  end
    -- })

    -- t.x = nil
    -- t.x = 40
    -- t.z = 70
    -- print(t.x)
    -- print(t.bbb)

end

return MainScene
