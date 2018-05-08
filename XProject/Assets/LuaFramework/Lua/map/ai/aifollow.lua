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

------------------׷��(��WalkToCharacter��һ��,���ڷ�Χ��ֱ�ӷ�)���AI��------------------------
clsAIFollow = AI_WALKTOCHAR.clsAIWalkToCharacter:Inherit()
function clsAIFollow:__init__(charObj, tarCharId, radius, fradius, wTime, aTime, walkGrid)
	Super(clsAIFollow).__init__(self, charObj, tarCharId, radius, fradius, wTime, aTime, walkGrid)
	
	self.tarCharId = tarCharId
	self.radius = radius			--���ٰ뾶�������Ͳ�����
	self.fradius = fradius			--�������������پ�ֹͣ����
	
	self.wTime = wTime
	self.aTime = aTime
	self.walkGrid = walkGrid or 1
end
function clsAIFollow:IsFollowAI()
	return true
end

function clsAIFollow:Run()
	local rt = Super(clsAIFollow).Run(self)
	if rt == AI_EXCEPTION then
		--�������ŵ�ͼ������ң�Ȼ��ɵ��Ա�
		local px, py = self.charObj:FindCharObjPosByRId(self.tarCharId) 			--���ŵ�ͼ����������꣬(û���򷵻�nil,nil)
		if px and py then	
			for i = 0, NORMAL_NPC_RADIUS - 1 do
				for randDir = 1, 8 do			
--					local randDir = mrandom(8)
					local nx = px + c_aPoint[randDir][1]
					local ny = py + c_aPoint[randDir][2]
					
					--JumpTo���������з���true,false���������true�����Ѿ��ƶ���
					if self.charObj:JumpTo(nx, ny) then
						self:SetActiveAIInit()			--���һ������׷������
						return AI_CONTINUE
					end
				end
			end
		end
		return AI_CONTINUE
	elseif rt == AI_NEXT then		--ֹͣ5�ξ���һ��
--		local haltCnt = (self.haltCnt or 0) + 1
--		if haltCnt >= c_nHaltCnt then
----			_RUNTIME("clsAIFollow:Run:", haltCnt, c_nHaltCnt)
--			local ox, oy = self.charObj:GetX(), self.charObj:GetY()
--			for i = 1, 16 do	--ѭ����û�ƶ������޷��ƶ�					
--				local randDir
--				if i <= 8 then
--					randDir = mrandom(8)
--				else
--					randDir = i - 8
--				end
--				local nx = ox + c_aPoint[randDir][1]
--				local ny = oy + c_aPoint[randDir][2]
--				
--				--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
--				if self.charObj:MoveTo(nx, ny) then
--					break
--				end
--			end		
--		end
--		self.haltCnt = haltCnt % c_nHaltCnt
		return AI_CONTINUE
	end
	return rt
end

function clsAIFollow:OnEvent(eventTbl)
	--��������ת���¸�Ŀ��ȥ
	if eventTbl.eventType == EVENT_BEATTACK or eventTbl.eventTbl == EVENT_TOATTACK then		
		return AI_NEXT							
	end
	return AI_CONTINUE
end