local assert = assert
local pairs = pairs
local mrandom = math.random
local mceil = math.ceil
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

local AI_WALK_TIME 		= AI_WALK_TIME
local AI_ATTACK_TIME 	= AI_ATTACK_TIME

------------------��׷�桿,��;�б�����(������׷����)������һ���ĳ���򡾸��ٲ��һ���AI��----------
clsAIFollowAttack = AI_BASE.clsAIBase:Inherit()
function clsAIFollowAttack:__init__(charObj, followCharId, radius, fradius, wTime, aTime, walkGrid)
	Super(clsAIFollowAttack).__init__(self, charObj)
	
	self.followCharId = followCharId
	
	if fradius > radius then
		_RUNTIME_ERROR("fradius is > radius:", fradius, radius)
		fradius = radius
	end
	local wTime = wTime or AI_WALK_TIME
	local aTime = aTime or AI_ATTACK_TIME
	
	local followAI = AI_FOLLOW.clsAIFollow:New(charObj, followCharId, radius, 1, wTime, aTime)
	local walkToCharacterAndAttack = AI_WALKTOCHARANDATTACK.clsAIWalkToCharacterAndAttack:New(charObj, nil, radius, fradius, wTime, aTime, walkGrid)
	self.aAI[1] = followAI
	self.aAI[2] = walkToCharacterAndAttack
	
	self.aNextNo[1] = 2
	self.aNextNo[2] = 1
	
	self.aExceptionNo[2] = 1

	self.wTime = wTime
	self.aTime = aTime
	self.radius = radius
	
	self.nextTime = nil
	self.walkGrid = walkGrid or 1
end

function clsAIFollowAttack:GetTime()
	if self.urgentAI then
		return Super(clsAIFollowAttack).GetTime(self)
	end
	
	return self.aTime or Super(clsAIFollowAttack).GetTime(self)
end

function clsAIFollowAttack:Run()
	if not self.urgentAI then
		local sCharObj = self.charObj
		local followCharId = self.followCharId
				
		--�ж��Ƿ����������ͬ������
		local tarCharObj = sCharObj:FindCharObjByRId(followCharId) 			--���ŵ�ͼ����������꣬(û���򷵻�nil)
		if not tarCharObj then
			return AI_CANCELTARGET
		end
		if tarCharObj:IsDie() then
			return AI_CANCELTARGET
		end
		
		sCharObj:TryAutoSkill()	
		local skillId = sCharObj:GetNowSkillId()
		if skillId then
			local skillData = sCharObj:GetOneSkillData(skillId)
			if skillData then
				if FIGHT.CheckGoodAttKind(skillData.AttKind) then		--���Լ��кô���
					local tarObj = FIGHT.GetMainTarget(sCharObj, skillData.AttKind, skillData.AttKind2, skillData.AttRange)
					if tarObj then
						if FIGHT.UseSkillAct(sCharObj, tarObj, skillId) then
							sCharObj:ClearNowSkillId()
							return AI_CONTINUE
						end
					end
				end
			end
		end
		
		if self.activeAINo == 1 then
			local tarObj = sCharObj:SearchOCompCharObj(self.radius)
			if tarObj then							--��������
				self.aAI[2]:SetTarCharId(tarObj:GetId())
				return self:OnReturn(AI_NEXT)	
			end
		end
	end
	
	local ret = Super(clsAIFollowAttack).Run(self)
	
	return ret
end

--����ͬ�鹥��˭
function clsAIFollowAttack:SetAttTarId(tarId)
end

--����ͬ��׷���Լ�(����Ϊtrue����follow)
function clsAIFollowAttack:SetFollowMe(isFollow)
	if isFollow then
		if self.urgentAI then return end
		self.urgentAI = AI_FOLLOW.clsAIFollow:New(self.charObj, self.followCharId, self.radius, 1, self.wTime, self.aTime, self.walkGrid)
	else
		self.urgentAI = nil
	end
end

--�¼��ĸı䣬���类����
function clsAIFollowAttack:OnEvent(eventTbl)	--����Ǳ�׷����˴���Ͳ�����
--	if self.activeAINo == 1 then
--		if eventTbl.eventType == EVENT_BEATTACK or eventTbl.eventType == EVENT_TOATTACK then
--			if eventTbl.eventAttackCharId ~= self.followCharId then
--				self.aAI[2]:SetTarCharId(eventTbl.eventAttackCharId)
--			else	--����Ǳ�׷���߹����Լ��򷵻�
--				return AI_CONTINUE
--			end
--		end
--		return AI_CONTINUE
--	elseif self.activeAINo == 2 then
--		if eventTbl.eventType == EVENT_BEATTACK or eventTbl.eventType == EVENT_TOATTACK then
--			if eventTbl.eventAttackCharId ~= self.followCharId then
--				--����һ�£���ΪclsAIWalkToCharacterAndAttackֻ�������
--				eventTbl.eventType = EVENT_BEATTACK		
--			else	--����Ǳ�׷���߹����Լ��򷵻�
--				return AI_CONTINUE
--			end
--		end		
--	end
--	if eventTbl.eventType == EVENT_BEATTACK or eventTbl.eventType == EVENT_TOATTACK then
--		local x, y = eventTbl.attX, eventTbl.attY
--		assert(x and y, "not clsAIFollowAttack:OnEvent attX, attY")
--		local sx, sy = mabs(x - self.charObj:GetX()), mabs(y - self.charObj:GetY())
--		local radius = sx > sy and sx or sy
--		self:SetRadius(radius)	
--	end
--	return Super(clsAIFollowAttack).OnEvent(self, eventTbl)
end