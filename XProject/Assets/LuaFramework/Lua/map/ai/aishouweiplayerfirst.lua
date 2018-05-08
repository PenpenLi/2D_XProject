local assert = assert
local pairs = pairs
local mrandom = math.random
local mabs = math.abs
local tinsert = table.insert
local mceil = math.ceil
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

local TmpShouWeiPlayerFirstChar = {
	__ClassType = "<swplayerf>",
}

clsAIShouWeiPlayerFirst = AI_WALKAROUNDATTACK.clsAIWalkAroundAttack:Inherit(TmpShouWeiPlayerFirstChar)
function clsAIShouWeiPlayerFirst:__init__(charObj, radius, fradius, wTime, aTime, walkGrid)
	Super(clsAIShouWeiPlayerFirst).__init__(self, charObj, radius, fradius, wTime, aTime, walkGrid)
end

function clsAIShouWeiPlayerFirst:Run()			--����һ��
	self.retTime = nil
	--���������ʾ���ܵ�
	local sCharObj = self.charObj
	if sCharObj:IsNpc() then
		local skillId, tipsTime = sCharObj:IsNowTipsSkillId()
		if skillId then
			local allSkill = sCharObj:GetAllSkill()
			local skillData = allSkill[skillId]
			if not skillData then 
				return AI_CONTINUE
			end
			FIGHT.UseSkillAct(sCharObj, nil, skillId, skillData.x, skillData.y)
			skillData.x = nil
			skillData.y = nil
			local nTimeNo = GetNowTimeNo()
			local timeNoCnt = skillData.CD
			skillData.CDEndTimeNo = nTimeNo + timeNoCnt
			
			self.retTime = skillData.SkillTime
			
			sCharObj:ClearNowSkillId()
			FIGHT.DelSkillTips(sCharObj, skillId)
			return AI_CONTINUE
		end
		
		if self.urgentAI then
			--�ж�һ���Ƿ�������ڸ���, ����ɾ�����������
			local tarObj = sCharObj:SearchOCompCharObj(self.radius, nil, nil, PLAYER_TYPE)
			if tarObj then
				self.urgentAI:Destroy()
				self.urgentAI = nil
			else
				--�ж�������������Χ�Ƿ���npc, ����ɾ����������
				tarObj = sCharObj:SearchOCompCharObj(self.radius, nil, nil, NPC_TYPE)
				if tarObj then
					self.urgentAI:Destroy()
					self.urgentAI = nil
				else
					local ret = Super(AI_WALKAROUNDATTACK.clsAIWalkAroundAttack).Run(self)
					if self.urgentAI then
						return ret
					end
				end
			end
		end
		
		if self.npcExtSkillAI then
			local ret = Super(AI_WALKAROUNDATTACK.clsAIWalkAroundAttack).Run(self)
			if self.npcExtSkillAI then
				return ret
			end
		end		
	else
		if self.urgentAI then
			local ret = Super(AI_WALKAROUNDATTACK.clsAIWalkAroundAttack).Run(self)
			if self.urgentAI then
				return ret
			end
		end		
	end
	
	--������Χ��״̬��ʱ������һ����Χ���Ƿ������
	if self.activeAINo == 1 then
		--�ж���Χ�Ƿ������, ����׷�����
		local tarObj = sCharObj:SearchOCompCharObj(self.radius, nil, nil, PLAYER_TYPE)
		if tarObj then
			local tarId = tarObj:GetId()
			
			local x, y = tarObj:GetX(), tarObj:GetY()
			local sx, sy = mabs(x - sCharObj:GetX()), mabs(y - sCharObj:GetY())
			local radius = sx > sy and sx or sy
			self:SetRadius(radius)	
			
			self.aAI[2]:SetTarCharId(tarId)
			return self:OnReturn(AI_NEXT)	
		end
		
		if not tarObj then
			--�ж�������������Χ�Ƿ���npc, ����ɾ����������
			tarObj = sCharObj:SearchOCompCharObj(self.radius, nil, nil, NPC_TYPE)
			if tarObj then
				local tarId = tarObj:GetId()
				
				local x, y = tarObj:GetX(), tarObj:GetY()
				local sx, sy = mabs(x - sCharObj:GetX()), mabs(y - sCharObj:GetY())
				local radius = sx > sy and sx or sy
				self:SetRadius(radius)	
				
				self.aAI[2]:SetTarCharId(tarId)
				return self:OnReturn(AI_NEXT)	
			end
		end
		
		--��Χû���, ����ȫ����ͼ�Ƿ��ежԵ�npc, �������ý�������
		if not tarObj then
			tarObj = sCharObj:SearchOCompCharObj_ByAllChar(NPC_TYPE)
			if tarObj then
				self.aAI[2]:SetTarCharId(nil)
				local x, y = tarObj:GetX(), tarObj:GetY()
				self.urgentAI = AI_WALKTOPOS.clsAIWalkToPos:New(self.charObj, nil, self.radius, 1, self.wTime, self.aTime, x, y, self.walkGrid)
				return AI_CONTINUE
			end
		end
	elseif self.activeAINo == 2 then
		--�����ǰ�Ķ�����npc, �����������Ƿ������, ����׷�����
		local tarId = self.aAI[2]:GetTarCharId()
		local tarObj = CHAR_MGR.GetCharById(tarId)
		if tarObj and tarObj:IsNpc() then
			tarObj = sCharObj:SearchOCompCharObj(self.radius, nil, nil, PLAYER_TYPE)
			if tarObj then
				local tarId = tarObj:GetId()
				
				local x, y = tarObj:GetX(), tarObj:GetY()
				local sx, sy = mabs(x - sCharObj:GetX()), mabs(y - sCharObj:GetY())
				local radius = sx > sy and sx or sy
				self:SetRadius(radius)	
				
				self.aAI[2]:SetTarCharId(tarId)
			end
		end
	end
	local ret = Super(AI_WALKAROUNDATTACK.clsAIWalkAroundAttack).Run(self)
	if ret == AI_EXCEPTION then
		--�����´��жϿ���������
		self.retTime = 10
	end
	return ret
end