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

------------------�����١����ҡ�����ĳ��AI��-----------------------------
clsAIWalkToCharacterAndAttack = AI_BASE.clsAIBase:Inherit()
function clsAIWalkToCharacterAndAttack:__init__(charObj, tarCharId, radius, fradius, wTime, aTime, walkGrid)
	Super(clsAIWalkToCharacterAndAttack).__init__(self, charObj)
	local walkToCharAI = AI_WALKTOCHAR.clsAIWalkToCharacter:New(charObj, tarCharId, radius, fradius, wTime, aTime, walkGrid)
	local attackAI = AI_ATTACK.clsAIAttack:New(charObj, tarCharId, fradius, aTime)

	self.tarCharId = tarCharId

	self.aAI[1] = walkToCharAI
	self.aAI[2] = attackAI
	
	self.aNextNo[1] = 2
	self.aNextNo[2] = 1
	
	self.wTime = wTime
	self.aTime = aTime
	self.walkGrid = walkGrid or 1
end

function clsAIWalkToCharacterAndAttack:GetTarCharId()
	return self.tarCharId
end

function clsAIWalkToCharacterAndAttack:SetTarCharId(tarCharId)
	self.tarCharId = tarCharId
	for _, oneAIObj in pairs(self.aAI) do
		oneAIObj:SetTarCharId(tarCharId)
	end
end

function clsAIWalkToCharacterAndAttack:SetActiveAIInit()
	self.aAI[1]:SetActiveAIInit()		--��������aAI�Ļ���ҲҪ�������ã���Ϊ�ڶ��ε��õ�ʱ���޷�SetActiveAIInit
	self.activeAINo = 1
end

--function clsAIWalkToCharacterAndAttack:OnEvent(eventTbl)
--	if eventTbl.eventType == EVENT_BEATTACK then		--��������ת���¸�Ŀ��ȥ
--		--�޸�׷�ٵ��˵�id
--		if eventTbl.eventAttackCharId ~= self.tarCharId then
--			local randomNum = mrandom(8)
--			if randomNum <= 1 then		--1/8���ʸı�׷������
--				self:SetTarCharId(eventTbl.eventAttackCharId)
--			end
--		end
--	end
--	return AI_CONTINUE
--end