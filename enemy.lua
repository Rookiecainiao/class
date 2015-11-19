--
-- Author: Your Name
-- Date: 2015-11-17 17:49:56
--
local enemy = class("enemy", function (  )
	return display.newSprite("logo3.png")
end)
function enemy:ctor( )
	body=cc.PhysicsBody:createBox(cc.size(100,200))
	body:getShape(0):setRestitution(0)
	body:setCollisionBitmask(0)
	body:setCategoryBitmask(00000000000002)
	self:setPhysicsBody(body)

	self:addStateMachine()
end
function enemy:doEvent(event)
	if self.fsm:canDoEvent(event) then
		self.fsm:doEvent(event)
	end
end
function enemy:addStateMachine()
	self.fsm={}
	cc.GameObject.extend(self.fsm)
	:addComponent("components.behavior.StateMachine")
	:exportMethods()
	self.fsm:setupState({
		initial="idle",
		events={
			{name="move",from={"idle","attack"},to="walk"},
			{name="attack",from={"idle","walk"},to="attack"},
			{name="normal",from={"walk","attack"},to="idle"}
		    },
		callbacks={
			onenteridle = function (  )
				self:stopAllActions()
				display.addSpriteFrames("20002_stand.plist",
				"20002_stand.png")
				local frames = display.newFrames("20002_stand_000%d.png",
	 			0, 7)
				local animate = display.newAnimation(frames, 0.1)
				self:playAnimationForever(animate)
			end,
			onenterwalk = function (  )
				self:stopAllActions()
				display.addSpriteFrames("20002_walk.plist",
				"20002_walk.png")
				local frames = display.newFrames("20002_walk_000%d.png",
	 			0, 7)
				local animate = display.newAnimation(frames, 0.1)
				self:playAnimationForever(animate)
			end,
			onenterattack = function (  )
				self:stopAllActions()
				display.addSpriteFrames("20002_skill.plist",
			"20002_skill.png")
			local frames = display.newFrames("20002_skill_00%02d.png",
	 		0, 12)
			local animate = display.newAnimation(frames, 0.1)
			self:playAnimationOnce(animate, removeWhenFinished, 
				function ()
					print("attack000000000")
					self:doEvent("move")
				end, 0)
			
			end
		}
		})

end
function enemy:onEnter( )
	
end
function enemy:onExit( )
	
end
return enemy