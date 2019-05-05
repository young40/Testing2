
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

local MainView = require("app/main/MainView")

local function bind(node, nodeFunc, t, key)
    local mt = getmetatable(t) or {}
    dump(mt)
    dump(node, nodeFunc)

    local b = mt.b or {}
    mt.b = b

    local kb = b[key] or {}
    b[key] = kb

    kb[#kb + 1] = {node, nodeFunc}
    -- dump(node)
    -- dump(nodeFunc)
    -- dump(t)
    -- dump(key)
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


        local b = mt.b or {}
        local kb = b[key]

        dump(kb)
        if kb then
            for _, bojtt in pairs(kb) do
                local obj, func = unpack(bojtt)
                dump(obj)
                dump(func)
                func(obj, value)
            end
        end
    end

    setmetatable(child, mt)

    dump(mt)
end

function Bindable:bind(key, obj, func)
    local mt = getmetatable(self) or {}

    local b = mt[b] or {}
    mt[b] = b

    local kb = b[key] or {}
    b[key] = kb

    kb[#kb + 1] = {obj = func}
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
    print("bbbbbbbb")
    bind(h2, h2.setString, t, "str")

    t.str = "爱你永不变️"

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
