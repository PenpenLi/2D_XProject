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

local function gmax(a, b)
	return a > b and a or b
end

--          ^ +y
-- 6  	    5          4
--          |
--          |            +x
---7-------------------3-->
--		  	|           
--		  	|
-- 8	    1          2
--�����ߣ�������ox == dx and oy == dy
local function GetPriorityDir(ox, oy, dx, dy)
	local disX, disY = dx - ox, dy - oy
	assert((disX ~= 0 or disY ~= 0), "disX == 0 and disY == 0 in GetPriorityDir!!")
	
	if disX == 0 then
		if disY > 0 then
			--{0,1}, {-1,1}, {1,1}
			return 5, 6, 4
		else
			--{0,-1}, {-1,-1}, {1,-1} 
			return 1, 8, 2
		end
	elseif disX > 0 then
		if disY == 0 then
			--{1,0}, {1,1}, {1,-1}
			return 3, 4, 2
		elseif disY > 0 then   
			if disX == disY then
				--{1,1}, {0,1}, {1,0}
				return 4, 5, 3
			elseif disX > disY then
				--{1,1}���Ȼ���{1,0}����
--				local tmp11 = radical2_2 * (disX - disY)
--				local tmp10 = disY
				local tmp11 = (disX - disY) / (disX + disY)
				local tmp10 = disY / disX
				if tmp11 <= tmp10 then
					--{1,1}����
					return 4, 3, 5, 2
				else
					return 3, 4, 2, 5
				end
			else
				--{0,1}���Ȼ���{1,1}����
--				local tmp01 = disX
--				local tmp11 = radical2_2 * (disY - disX)
				local tmp01 = disX / disY
				local tmp11 = (disY - disX) / (disX + disY)
				if tmp01 <= tmp11 then
					--{0,1}����
					return 5, 4, 6, 3
				else
					return 4, 5, 3, 6
				end				
			end
		else
			disY = -disY
			if disX == disY then
				--{1,-1}, {1,0}, {0,-1}
				return 2, 3, 1
			elseif disX > disY then
				--{1,-1}���Ȼ���{1,0}����
--				local tmp1_1 = radical2_2 * (disX - disY)
--				local tmp10 = disY
				local tmp1_1 = (disX - disY) / (disX + disY)
				local tmp10 = disY / disX
				if tmp1_1 <= tmp10 then
					--{1,-1}����
					return 2, 3, 1, 4
				else
					return 3, 2, 4, 1
				end
			else
				--{0,-1}���Ȼ���{1,-1}����
--				local tmp0_1 = disX
--				local tmp1_1 = radical2_2 * (disY - disX)
				local tmp0_1 = disX / disY
				local tmp1_1 = (disY - disX) / (disX + disY)
				if tmp0_1 <= tmp1_1 then
					--{0,-1}����
					return 1, 2, 8, 3
				else
					return 2, 1, 3, 8
				end				
			end			
		end
	else
		disX = -disX
		if disY == 0 then
			--{-1,0}, {-1,1}, {-1,-1}
			return 7, 6, 8
		elseif disY > 0 then   
			if disX == disY then
				--{-1,1}, {0,1}, {-1,0}
				return 6, 5, 7
			elseif disX > disY then
				--{-1,1}���Ȼ���{-1,0}����
--				local tmp_11 = radical2_2 * (disX - disY)
--				local tmp_10 = disY
				local tmp_11 = (disX - disY) / (disX + disY)
				local tmp_10 = disY / disX
				if tmp_11 <= tmp_10 then
					--{-1,1}����
					return 6, 7, 5, 8
				else
					return 7, 6, 8, 5
				end
			else
				--{0,1}���Ȼ���{-1,1}����
--				local tmp01 = disX
--				local tmp_11 = radical2_2 * (disY - disX)
				local tmp01 = disX / disY
				local tmp_11 = (disY - disX) / (disX + disY)
				if tmp01 <= tmp_11 then
					--{0,1}����
					return 5, 6, 4, 7
				else
					return 6, 5, 7, 4
				end				
			end
		else
			disY = -disY
			if disX == disY then
				--{-1,-1}, {-1,0}, {0,-1}
				return 8, 7, 1
			elseif disX > disY then
				--{-1,-1}���Ȼ���{-1,0}����
--				local tmp_1_1 = radical2_2 * (disX - disY)
--				local tmp_10 = disY
				local tmp_1_1 = (disX - disY) / (disX + disY)
				local tmp_10 = disY / disX
				if tmp_1_1 <= tmp_10 then
					--{-1,-1}����
					return 8, 7, 1, 6
				else
					return 7, 8, 6, 1
				end
			else
				--{0,-1}���Ȼ���{-1,-1}����
--				local tmp0_1 = disX
--				local tmp_1_1 = radical2_2 * (disY - disX)
				local tmp0_1 = disX / disY
				local tmp_1_1 = (disY - disX) / (disX + disY)
				if tmp0_1 <= tmp_1_1 then
					--{0,-1}����
					return 1, 8, 2, 7
				else
					return 8, 1, 7, 2
				end				
			end			
		end		
	end
end

PublicGetPriorityDir = GetPriorityDir

------------------����ĳ��AI�ࣨ���;�б��˴��м��ʻ�׷���ˣ�-----------------------------
--ע�⣬�����ĳ���в�����ǰ��ƽ��׷�Ļ���ֻ����ǽ�ڲ���Ҫ������ߣ���
--1.��¼������꣬�����1����		������������
--2.ѭ��ֱ���߳����������ǻص��������Ļ�����ϴ��������+1���ߡ���������ϴ��Ǹ����޷�����ص�1
clsAIWalkToCharacter = AI_BASE.clsAIBase:Inherit({__ClassType = "<clsAIWalkToCharacter>"})
function clsAIWalkToCharacter:__init__(charObj, tarCharId, radius, fradius, wTime, aTime, walkGrid)
	Super(clsAIWalkToCharacter).__init__(self, charObj)
	
	self.tarCharId = tarCharId
	self.radius = radius			--���ٰ뾶�������Ͳ�����
	self.fradius = fradius			--�������������پ�ֹͣ����
	
	self.wTime = wTime
	self.retTime = wTime
	
	self.aTime = aTime
	self.walkGrid = walkGrid or 1
	self:SetActiveAIInit()
end

function clsAIWalkToCharacter:GetTime()
	return self.retTime
end

function clsAIWalkToCharacter:GetWalkTime()
	return self.wTime
end

function clsAIWalkToCharacter:SetRetTime(time)
	self.retTime = time
end

function clsAIWalkToCharacter:IsFollowAI()
	return false
end

function clsAIWalkToCharacter:IsWalkToPos()
	return false
end

function clsAIWalkToCharacter:IsWalkCSheep()
	return false
end

function clsAIWalkToCharacter:SetActiveAIInit()
	self.cantMoveToTar = nil						--�޷��ƶ���Ŀ����Χ
	self.blockX = nil
	self.blockY = nil
	self.nowBlockMaxStep = c_nBlockCnt				--���������������
	self.nowBlockStep = 0							--��ǰ�ߵĲ���
	self.isBlock = false
end

local function GetLeftDir(dir)
	if dir >= 7 then
		return (dir + 2) % 8
	else
		return dir + 2
	end
end
local function GetRightDir(dir)
	local dir = dir - 2
	if dir <= 0 then
		return dir + 8
	end
	return dir
end
local function GetBackDir(dir)
	if dir <= 4 then
		return dir + 4
	else
		return (dir + 4) % 8
	end
end

function clsAIWalkToCharacter:Run()
	self:SetRetTime(self:GetWalkTime())
	local sCharObj = self.charObj
	self.cantMoveToTar = nil
--	assert(self.tarCharId, "not tarCharId in clsAIWalkToCharacter:Run!")
	local tarCharObj = nil
	
	local ox = sCharObj:GetX()				
	local oy = sCharObj:GetY()				
--	local speed = 1			--npc���ٶȹ涨1һ�񣨲���1���Ӻܶ࣬Ҫ�ж��м���û�������յ��������м���ܹ���
	local speed = self.walkGrid 
	
	local dx = nil
	local dy = nil
	
	if self:IsWalkToPos() then
		dx = self:GetDX()
		dy = self:GetDY()
	elseif self:IsWalkCSheep() then
		dx = self:GetDX()
		dy = self:GetDY()
		if not dx or not dy then	--�����һ��
			return AI_CONTINUE
		end		
	else
		tarCharObj = sCharObj:FindCharObjByRId(self.tarCharId)					--��ȡ������
		if not tarCharObj then
			return AI_EXCEPTION
		end
		
		if tarCharObj:IsDie() then									--��ȡ�����˵�Ѫ��
			return AI_EXCEPTION
		end
		
		dx = tarCharObj:GetX()				
		dy = tarCharObj:GetY()	
	end	
	
	if self:IsFollowAI() then			--�����ͬ���׷�ٵ����Ǳ�������,�޸ĸ���λ��
		local fCnt, fPos = sCharObj:GetFollowPos()
		for i = 1, 8 do
			local nx = dx + c_aPoint[i][1]
			local ny = dy + c_aPoint[i][2]
			
			if not sCharObj:IsBlockPoint(nx, ny) then
				dx, dy = nx, ny
				break
			end		
		end
	end	
	local disX = mabs(ox - dx)
	local disY = mabs(oy - dy)
	
	local tRadius = nil
	local dTRadius = nil
	local minBRadius = nil
	local dMinBRadius = nil
	if self:IsFollowAI() then				--�����0,0��ֹͣ
		if disX == 0 and disY == 0 then
			return AI_NEXT
		end
	elseif self:IsWalkToPos() then
		if disX == 0 and disY == 0 then
			return AI_EXCEPTION
		end	
	elseif self:IsWalkCSheep() then
		if disX == 0 and disY == 0 then
			return AI_CONTINUE
		end				
	else
--		local fradius = self.fradius
--		local tBRadius = tarCharObj:GetBattleRadius()
--		local sBRadius = sCharObj:GetBattleRadius()		
--		local tRadius = gmax(gmax(tBRadius, sBRadius), fradius)

--		if disX == 1 and disY == 1 then		--���tRadius = 1, ��ô1,1��λ�þͲ��ڷ�Χ��.����Ҳ�ܴ�,���Է���AI_NEXT
--			return AI_NEXT
--		end
		local fradius = self.fradius
		local sBRadius = sCharObj:GetBattleRadius()	
		tRadius = gmax(fradius, sBRadius)
		dTRadius = tRadius ^ 2
	
		--�жϵжԵĹ�����Χ���Լ��Ĺ�����Χ��fradius,ȡ����,Ȼ�����������disx��disy��AI_NEXT
		--������ڵĵ��disX,disY��1���򷵻�AI_NEXT
--		if disX <= tRadius and disY <= tRadius and (disX ~= 0 or disY ~= 0) then
--			return AI_NEXT
--		end
		minBRadius = sCharObj:GetMinBattleRadius()
		dMinBRadius = minBRadius ^ 2
		local selfId = sCharObj:GetId()
		local dxy2 = disX ^ 2 + disY ^ 2
		if dxy2 >= dMinBRadius then
			if dxy2 <= dTRadius and (disX ~= 0 or disY ~= 0) then
				if BASECHAR.AdjustHasObj(sCharObj:GetMapLayer(), ox, oy, selfId) then		--��obj
					for i = 1, 8 do
						local nx = ox + c_aPoint[i][1]
						local ny = oy + c_aPoint[i][2]
						if not BASECHAR.AdjustHasObj(sCharObj:GetMapLayer(), nx, ny, selfId) and not sCharObj:IsBlockPoint(nx, ny) and sCharObj:CanMoveToOneGrid(ox, oy, nx, ny)  then
							local tmpDis = (nx - dx) ^ 2 + (ny - dy) ^ 2
							if tmpDis >= dMinBRadius and tmpDis <= dTRadius then
								if sCharObj:MoveTo(nx, ny, nil, speed) then
									return AI_CONTINUE
								end
							end
						end
					end
					return AI_NEXT
				else
					return AI_NEXT
				end
			end
		elseif (disX ~= 0 or disY ~= 0) and dxy2 < dMinBRadius then
			if self.mbattlemCnt	< 2 then
				self.mbattlemCnt = self.mbattlemCnt + 1
			else
				return AI_NEXT
			end
		end
	end
	
	--�жϸ��ٵ��˻��ڷ�Χ�ڲ�
	if not self:IsWalkToPos() then
		if disX > self.radius or disY > self.radius then
			return AI_EXCEPTION
		end
	end
	
	--������ڴ�������߶�������߶�
	if self.isBlock then
		if self.nowBlockStep >= self.nowBlockMaxStep then
			self.nowBlockStep = 0
			self.isBlock = false
		else
			for i = 1, 16 do	--ѭ����û�ƶ������޷��ƶ�					
				local randDir = nil
				if i <= 8 then
					randDir = mrandom(8)
				else
					randDir = i - 8
				end
--				local nx = ox + c_aPoint[randDir][1] * speed
--				local ny = oy + c_aPoint[randDir][2] * speed
--				
--				--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
--				if sCharObj:MoveTo(nx, ny, nil, speed) then
--					self.nowBlockStep = self.nowBlockStep + 1
--					return AI_CONTINUE
--				end
				
				local tx, ty = ox, oy
				for j = 1, speed do
					local nx = tx + c_aPoint[randDir][1]
					local ny = ty + c_aPoint[randDir][2]
					if sCharObj:CanMoveToOneGrid(tx, ty, nx, ny) then
						tx, ty = nx, ny
					end
				end
				if tx ~= ox or ty ~= oy then
					--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
					if sCharObj:MoveTo(tx, ty, nil, speed, true) then
						self.nowBlockStep = self.nowBlockStep + 1
						return AI_CONTINUE
					end				
				end
			end
			
			return AI_CONTINUE	
		end
	end
	
	--��������,ѡ����ӽ�ox,oy��dx+-[0,1],dy+-[0,1]��û����λ��
	--������ڵĵ��dX,dYһ����													
	--		1.�����Χ��npc,����ǽ,�������ʹ���޷��߶�,��ô����0, nil, nil
	--		2.�����Χ��+-[0,1]���߶����򷵻�0, dX+-[0,1], dY+-[0,1]
	--������ڵĵ��dX,dY��һ����
	--		1.�����Χ��npc,����ǽ,�������ʹ���޷��߶�,��ô����1, nil, nil, Ȼ������dX,dYǰ��(������ƽ��),û�����
	--		2.�����Χ��+-[0,1]���߶����򷵻�1, dX+-[0,1], dY+-[0,1], 
	local rtNum, adjustdx, adjustdy = nil, nil, nil
	if self:IsFollowAI() then
		rtNum = 1
	elseif self:IsWalkToPos() then
		rtNum = 1
	elseif self:IsWalkCSheep() then
		rtNum = 1
	else
		rtNum, adjustdx, adjustdy = tarCharObj:AdjustPointNoItemClient(dMinBRadius, dTRadius, ox, oy)
	end
	
--	_RUNTIME("1 clsAIWalkToCharacter:Run:", sCharObj:GetId(), rtNum, adjustdx, adjustdy)
	if rtNum == 0 then
		if adjustdx and adjustdy then
			dx, dy = adjustdx, adjustdy
			sCharObj:MoveTo(dx, dy, nil, speed)
		end
		return AI_CONTINUE
	elseif rtNum == 1 then
		--��ȡ��һ����λ�ã�Ȼ���жϵ�ͼ���Ƿ�����ߣ����ǰ����ǽ����������npc���Ļ�����Ҫ����ߣ�
		if adjustdx and adjustdy then
			dx, dy = adjustdx, adjustdy
		end
		
		local dir1, dir2, dir3, dir4 = GetPriorityDir(ox, oy, dx, dy)
		local testRandomStep = true
		local function TestOneGridMove(tox, toy, ...)
			local num_args = select("#", ...)
			local arg = {}
			for i = 1, num_args do
				arg[i] = select(i, ...)
			end
			arg['n'] = num_args
			for i = 1, num_args do
				if arg[i] then
					local tnx = tox + c_aPoint[arg[i]][1]
					local tny = toy + c_aPoint[arg[i]][2]
					
					if sCharObj:CanMoveToOneGrid(tox, toy, tnx, tny) then
						return true, tnx, tny
					end
				end
			end
		end
		local function TestDirMove(testDir)
			if testDir then
--				local nx = ox + c_aPoint[testDir][1] * speed
--				local ny = oy + c_aPoint[testDir][2] * speed
--				if sCharObj:MoveTo(nx, ny, nil, speed) then
--					return AI_CONTINUE
--				elseif not sCharObj:IsBlockPoint(nx, ny) and BASECHAR.CanMoveBySlope(ox, oy, nx, ny) then	--����ǽҲ������
--					testRandomStep = false
--				end 

				local nx = ox + c_aPoint[testDir][1]
				local ny = oy + c_aPoint[testDir][2]				
				--�����2����ƶ�,�ƶ����ܴ�slope
				if sCharObj:CanMoveToOneGrid(ox, oy, nx, ny) then
--					if self:GetWalkTime() < 4 then		--0.4��Ĳ��ƶ�2��
					if speed ~= 1 then
						local tarx, tary
						if tarCharObj then
							tarx, tary = tarCharObj:GetX(), tarCharObj:GetY()
						else
							tarx, tary = dx, dy
							dTRadius = 0
						end
						local dxy2 = (tarx - nx) ^ 2 + (tary - ny) ^ 2
						if dxy2 > dTRadius then
							local tdisX = mabs(nx - dx)
							local tdisY = mabs(ny - dy)		
							if tdisX ~= 0 or tdisY ~= 0 then		--0,0�ﵽ��dx,dy�Ͳ����ж���2��
								local tdir1, tdir2, tdir3, tdir4 = GetPriorityDir(nx, ny, dx, dy)
								local isOk, tnx, tny = TestOneGridMove(nx, ny, tdir1, tdir2, tdir3, tdir4)
								if isOk and tnx and tny then
									--�ж������2������ƶ�2��
									tdisX = mabs(ox - tnx)
									tdisY = mabs(oy - tny)
									local tLen = tdisX ^ 2 + tdisY ^ 2
									if tLen == 4 or tLen == 5 or tLen == 8 then
										if sCharObj:MoveTo(tnx, tny, nil, speed, true) then
											self:SetRetTime(self:GetWalkTime() * 2)			--����aiʱ��
											return AI_CONTINUE
										end
									end
								end
							end
						end
					end
					sCharObj:MoveTo(nx, ny, nil, speed, true)
					return AI_CONTINUE
				elseif not sCharObj:IsBlockPoint(nx, ny) and BASECHAR.CanMoveBySlope(ox, oy, nx, ny) then	--����ǽҲ������
					testRandomStep = false
				end
			end
		end
		local rtTestDir = TestDirMove(dir1) or TestDirMove(dir2) or TestDirMove(dir3) or TestDirMove(dir4)
		if rtTestDir then return rtTestDir end
		
		self.cantMoveToTar = true			--�����߲���ȥ�ˣ��Ѿ��ж�����·��
		
		if testRandomStep then	--ǰ���Ķ���ǽ���Ǿ��������ʼ
			if self.blockX == ox and self.blockY == oy then
				if self.nowBlockMaxStep >= c_nBlockMaxCnt then
					self.nowBlockMaxStep = c_nBlockMaxCnt
				else
					self.nowBlockMaxStep = self.nowBlockMaxStep + 1
				end		
			else
				self.nowBlockMaxStep = c_nBlockCnt
			end
			self.nowBlockStep = 0
			self.isBlock = true
			self.blockX = ox
			self.blockY = oy
			
			for i = 1, 16 do	--ѭ����û�ƶ������޷��ƶ�					
				local randDir = nil
				if i <= 8 then
					randDir = mrandom(8)
				else
					randDir = i - 8
				end
--				local nx = ox + c_aPoint[randDir][1] * speed
--				local ny = oy + c_aPoint[randDir][2] * speed
--				
--				--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
--				if sCharObj:MoveTo(nx, ny, nil, speed) then
--					self.nowBlockStep = self.nowBlockStep + 1
--					return AI_CONTINUE
--				end
				
				local tx, ty = ox, oy
				for j = 1, speed do
					local nx = tx + c_aPoint[randDir][1]
					local ny = ty + c_aPoint[randDir][2]
					if sCharObj:CanMoveToOneGrid(tx, ty, nx, ny) then
						tx, ty = nx, ny
					end
				end
				if tx ~= ox or ty ~= oy then
					--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
					if sCharObj:MoveTo(tx, ty, nil, speed, true) then
						self.nowBlockStep = self.nowBlockStep + 1
						return AI_CONTINUE
					end				
				end
				
			end
			
			return AI_CONTINUE			
		else
			for i = 1, 16 do	--ѭ����û�ƶ������޷��ƶ�					
				local randDir = nil
				if i <= 8 then
					randDir = mrandom(8)
				else
					randDir = i - 8
				end
--				local nx = ox + c_aPoint[randDir][1] * speed
--				local ny = oy + c_aPoint[randDir][2] * speed
--				
--				--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
--				if sCharObj:MoveTo(nx, ny, nil, speed) then
--					return AI_CONTINUE
--				end

				local tx, ty = ox, oy
				for j = 1, speed do
					local nx = tx + c_aPoint[randDir][1]
					local ny = ty + c_aPoint[randDir][2]
					if sCharObj:CanMoveToOneGrid(tx, ty, nx, ny) then
						tx, ty = nx, ny
					end
				end
				if tx ~= ox or ty ~= oy then
					--MoveTo���������з���true,false���������true�����Ѿ��ƶ���
					if sCharObj:MoveTo(tx, ty, nil, speed, true) then
						return AI_CONTINUE
					end				
				end
			end	
		end
	end
	
	return AI_CONTINUE
end

function clsAIWalkToCharacter:SetTarCharId(tarCharId)
	self:SetActiveAIInit()	--������߶����
	self.mbattlemCnt = 0
	self.tarCharId = tarCharId
end