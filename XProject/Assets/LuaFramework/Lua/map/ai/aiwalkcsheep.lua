local assert = assert
local pairs = pairs
local mrandom = math.random
local mabs = math.abs
local tinsert = table.insert
local c_nBlockCnt 		= c_nBlockCnt
local c_nBlockMaxCnt 	= c_nBlockMaxCnt
local c_nHaltCnt 		= c_nHaltCnt				--׷�����ڱ�׷�����Աߵ�ͣ������c_nHaltCnt���ƶ�һ��
local c_aPoint = MOVE_DIR
--AI,EVENT״̬--
local AI_CONTINUE 		= AI_CONTINUE
local AI_NEXT 			= AI_NEXT
local AI_EXCEPTION 		= AI_EXCEPTION
local AI_CANCELTARGET	= AI_CANCELTARGET
local AI_NULL 			= AI_NULL

local EVENT_BEATTACK	= EVENT_BEATTACK					--������
local EVENT_TOATTACK	= EVENT_TOATTACK					--ָʹ׷����(�������)����

local NORMAL_NPC_RADIUS = NORMAL_NPC_RADIUS

------------------ȥĳλ��(��WalkToCharacter��һ��)------------------------
clsAIWalkCSheep = AI_WALKTOCHAR.clsAIWalkToCharacter:Inherit({__ClassType = "<csheepai>"})
function clsAIWalkCSheep:__init__(charObj, tarCharId, radius, fradius, wTime, aTime, sx, sy)
	Super(clsAIWalkCSheep).__init__(self, charObj, tarCharId, radius, fradius, wTime, aTime, sx, sy)
	
	self.tarCharId = tarCharId
	self.radius = radius			--���ٰ뾶�������Ͳ�����
	self.fradius = fradius			--�������������پ�ֹͣ����
	
	self.wTime = wTime * 5
	self.aTime = aTime
	
	self.sx = sx
	self.sy = sy
end

function clsAIWalkCSheep:IsWalkCSheep()
	return true
end

function clsAIWalkCSheep:GetDX()
	return self.dx
end
function clsAIWalkCSheep:GetDY()
	return self.dy
end

function clsAIWalkCSheep:Run()
	--Ѱ���¸�Ŀ���
	local ox, oy = self.charObj:GetX(), self.charObj:GetY()
	
	for i = 1, 16 do	--ѭ����û�ƶ������޷��ƶ�					
		local randDir = nil
		if i <= 8 then
			randDir = mrandom(8)
		else
			randDir = i - 8
		end
		local nx = ox + c_aPoint[randDir][1]
		local ny = oy + c_aPoint[randDir][2]
		if mabs(nx - self.sx) <= SHEEP_RANGE and mabs(ny - self.sy) <= SHEEP_RANGE then		--�ڷ�Χ��
			if self.charObj:CanMoveToOneGrid(ox, oy, nx, ny) then
				self.dx = nx
				self.dy = ny
				break
			end
		end
	end
	
	return Super(clsAIWalkCSheep).Run(self)
end

