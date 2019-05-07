local BaseView = class("BaseView", cc.Node)

function BaseView:ctor()
    if self.onCreate then
        assert(type(self.onCreate) == "function", "onCreate should be function")

        self:onCreate()
    end
end

return BaseView
