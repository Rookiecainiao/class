--
-- Author: Your Name
-- Date: 2015-11-12 20:19:30
--
local ui = require("framework.ui")
local SetLayer = class("SetLayer", function (  )
	return display.newColorLayer(cc.c4b(100, 100, 100, 100))
end)
function SetLayer:ctor( )
	self:setTouchEnabled(true)
	self:setTouchSwallowEnabled(true)
	-- self:init()
end

function SetLayer:init( )
	local bgsprite = cc.Sprite:create("setBG.png")
    bgsprite:pos(display.cx, display.cy)
    bgsprite:setAnchorPoint(cc.p(0.5,0.5))
    self:add(bgsprite)

    -- 创建音乐音效
    local lab1 = cc.Sprite:create("music1.png")
    lab1:pos(250, 400)
    self:add(lab1)
    local lab2 = cc.Sprite:create("music2.png")
    lab2:pos(250, 300)
    self:add(lab2)
    local okbtn = cc.ui.UIPushButton.new({
        normal="ok.png",pressed="ok1.png"
        })
    okbtn:pos(display.cx, display.bottom+150)
    self:add(okbtn)
    okbtn:addButtonClickedEventListener(function (  )
    	self:removeFromParent()
    end)

    local slider = cc.ui.UISlider.new(display.LEFT_TO_RIGHT,
    {
    	bar="loading tiao.png",
    	button="set1.png"
    }, {
    	min=0,max=100,touchInButton=true,scale9=true
    })
    slider:onSliderValueChanged(function ( event )
    	audio.setSoundsVolume(event.value/100)
    end)
    slider:setSliderSize(400, 20)
    slider:setSliderValue(70)
    slider:pos(350, 390)
    self:add(slider)

    local slider2 = cc.ui.UISlider.new(display.LEFT_TO_RIGHT,
    {
    	bar="loading tiao.png",
    	button="set1.png"
    }, {
    	min=0,max=100,touchInButton=true,scale9=true
    })
    slider2:onSliderValueChanged(function ( event )
    	audio.setMusicVolume(event.value/100)
    end)
    slider2:setSliderSize(400, 20)
    slider2:setSliderValue(70)
    slider2:pos(350, 290)
    self:add(slider2)
    

    
	-- local function touchbegan(location,event)
 --        --  print("这是一种通用的触摸")
 --        -- local p=location:getLocation()
 --        -- print(p.x ..p.y)
 --        return true
	-- end
	-- self.dispatcher = cc.Director:getInstance():getEventDispatcher()
	-- self.listener = cc.EventListenerTouchOneByOne:create()
	-- self.listener:setSwallowTouches(true)
	-- self.listener:registerScriptHandler(touchbegan,
	-- 	cc.Handler.EVENT_TOUCH_BEGAN)
	-- self.dispatcher
	-- :addEventListenerWithSceneGraphPriority(self.listener,
	-- 	self)
end
function SetLayer:onEnter( )
	

end

function SetLayer:onExit( )
	
end
return SetLayer