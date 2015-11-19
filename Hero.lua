--
-- Author: Your Name
-- Date: 2015-11-13 21:19:49
--
local Hero = class("Hero", function ()
	return display.newSprite("logo3.png")
end)
function Hero:ctor( )
	body = cc.PhysicsBody:createBox(cc.size(100,200))   --self._world:createCircleBody(100, item:getContentSize().width/2-5)
	body:getShape(0):setRestitution(0)
	-- body:setCollisionBitmask(0001)
	body:setCategoryBitmask(00000000000001)
	-- body:setContactTestBitmask(0003)
	self:setPhysicsBody(body)
	self:addStateMachine()
end
function Hero:doEvent(event)
	if self.fsm:canDoEvent(event) then
		self.fsm:doEvent(event)
	end
end
function Hero:addStateMachine()
	self.fsm={}
	cc.GameObject.extend(self.fsm)
	:addComponent("components.behavior.StateMachine")
	:exportMethods()
	self.fsm:setupState({
		initial="idle",
		events={
			{name="move",from={"idle","jump"},to="walk"},
			{name="attack",from={"idle","walk"},to="attack"},
			{name="normal",from={"walk","attack"},to="idle"}
			},
		callbacks={
			onenteridle=function ()
				self:stopAllActions()
				display.addSpriteFrames("20002_stand.plist",
				"20002_stand.png")
				local frames = display.newFrames("20002_stand_000%d.png",
	 			0, 7)
				local animate = display.newAnimation(frames, 0.1)
				self:playAnimationForever(animate)
			end,
			onenterwalk = function ()
				self:stopAllActions()
				display.addSpriteFrames("20002_walk.plist",
				"20002_walk.png")
				local frames = display.newFrames("20002_walk_000%d.png",
	 			0, 7)
				local animate = display.newAnimation(frames, 0.1)
				self:playAnimationForever(animate)
			end,
			onenterjump = function ()
				
			end
			}
		})
end
-- function Hero:skill1()
-- 	display.addSpriteFrames("20002_skill.plist",
-- 		"20002_skill.png")
-- 	local frames = display.newFrames("20002_skill_00%02d.png",
-- 	 0, 12)
-- 	local animate = display.newAnimation(frames, 0.1)
-- 	self:playAnimationOnce(animate)
-- end
-- function Hero:stand()
-- 	display.addSpriteFrames("20002_stand.plist",
-- 		"20002_stand.png")
-- 	local frames = display.newFrames("20002_stand_000%d.png",
-- 	 0, 7)
-- 	local animate = display.newAnimation(frames, 0.1)
-- 	self:playAnimationForever(animate)
-- end
-- function Hero:walk( )
-- 	display.addSpriteFrames("20002_walk.plist",
-- 		"20002_walk.png")
-- 	local frames = display.newFrames("20002_walk_000%d.png",
-- 	 0, 7)
-- 	local animate = display.newAnimation(frames, 0.1)
-- 	self:playAnimationForever(animate)
-- end

function Hero:onEnter()
	
end
function Hero:onExit()
	
end
return Hero