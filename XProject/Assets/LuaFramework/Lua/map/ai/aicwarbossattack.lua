local assert = assert
local pairs = pairs
local math = math
local mabs = math.abs
local AI_CONTINUE 		= AI_CONTINUE

clsAICWarBossAttack = AI_BASE.clsAIBase:Inherit()
function clsAICWarBossAttack:__init__(charObj, aTime)
	Super(clsAICWarBossAttack).__init__(self, charObj)
	
	local aTime = aTime or AI_ATTACK_TIME
	self.aTime = aTime
	self.retTime = aTime
end

function clsAICWarBossAttack:GetTime()
	return self.retTime
end

function clsAICWarBossAttack:ResetRetTime()
	self.retTime = self.aTime
end

function clsAICWarBossAttack:SetRetTime(time)
	self.retTime = time
end

local function IsInRange(x, y, tx, ty, range)
	local drange = range ^ 2
	if drange >= (tx - x) ^ 2 + (ty - y) ^ 2 then
		return true
	end
end

function clsAICWarBossAttack:Run()
	self:ResetRetTime()
	local sCharObj = self.charObj
	if sCharObj:IsDie() then return end
	
	--���������ʾ���ܵ�
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
		sCharObj:ClearNowSkillId()
		FIGHT.DelSkillTips(sCharObj, skillId)
		
		local skillTime = skillData.SkillTime
		if skillTime then
			self:SetRetTime(skillTime + self.aTime)
		end
		
		return AI_CONTINUE
	else
		local range = sCharObj:GetAIRange().range
		local x, y = sCharObj:GetX(), sCharObj:GetY()

		local tarId = self.tarId
		local tarObj = nil
		if tarId then
			tarObj = CHAR_MGR.GetCharById(tarId)
		end
		
		if not tarObj or tarObj:IsDie() then
			--������һ�������Ŀɹ�������, ������򸳸�tarObj
			tarObj = sCharObj:SearchOCompCharObj(range, true, nil, PLAYER_TYPE)
		else
			local tx, ty = tarObj:GetX(), tarObj:GetY()
			--���ڹ�����Χ������ѡһ��
			if not IsInRange(x, y, tx, ty, range) then
				tarObj = sCharObj:SearchOCompCharObj(range, true, nil, PLAYER_TYPE)
			end
		end
		
		if tarObj then
			self.tarId = tarObj:GetId()
			--todo ����
			local skillId, isTips, isWait, _tx, _ty = sCharObj:GetNowSkillId(tarObj)
			if isWait then
				--�����Ѿ��ȴ���
				sCharObj:ClearSkillIdWait(skillId)
				if _tx and _ty then
					FIGHT.AddSkillTips(sCharObj, nil, skillId, _tx, _ty)
				else
					FIGHT.AddSkillTips(sCharObj, tarObj, skillId)
				end
				return AI_CONTINUE
			end
			local skillData = sCharObj:GetOneSkillData(skillId)
			if skillData then
				if FIGHT.NpcCheckTarget(sCharObj, tarObj, skillData.AttKind, skillData.AttKind2) then
					FIGHT.UseSkillAct(sCharObj, tarObj, skillId)
				else				--�����������Ӧ����
					local tarObj = FIGHT.GetMainTarget(sCharObj, skillData.AttKind, skillData.AttKind2, skillData.AttRange)
					if tarObj then
						FIGHT.UseSkillAct(sCharObj, tarObj, skillId)
					end
				end
				local skillTime = skillData.SkillTime			--npc����Ҫ�޼�϶����
				if skillTime and skillTime >= self.aTime then	--����ʱ��̫���˲����ü��ܵ�ʱ��
					self:SetRetTime(skillTime)
				end
			end
		end
		
		return AI_CONTINUE
	end
end