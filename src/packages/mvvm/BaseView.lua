local BaseView = class("BaseView", cc.Node)

function BaseView:ctor(vo)
    self.vo = vo

    if self.initView then
        assert(type(self.initView) == "function", "initView should be function")

        self:initView()
    end

    if self.initBind then
        assert(type(self.initBind) == "function", "initBind should be function")

        self:initBind()
    end
end

return BaseView
