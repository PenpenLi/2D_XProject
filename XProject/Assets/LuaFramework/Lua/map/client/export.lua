local tinsert = table.insert
local mabs = math.abs
local NORMAL_FUNC = function() end

local function FileInfo()
	--�����ش�����־��¼�ļ���line��Ϣ
	local dinfo = debug.getinfo(3, 'Sl')
	local CallFile = dinfo.short_src
	local CurLine = dinfo.currentline
	return CallFile.." line:"..CurLine
end
--��ӡ����̨����������Ϣ
function _RUNTIME(...)
	print("[RUNTIME]",FileInfo(),...)
end 
function _RUNTIME_ERROR(...)
	_RUNTIME(...)
end

CHAR_ID = 0
--�ͻ��˴�-1��ʼ,����˵���Զ����Ϊ����,����ͻ��˲��Ǹ������ܻ������˵ĳ�ͻ
function _export_newid()
	CHAR_ID = CHAR_ID - 1
	return CHAR_ID
end

function _export_sid()
	CHAR_ID = CHAR_ID - 1
	return tostring(CHAR_ID)
end

function lua_ExportClear()
	CHAR_ID = 0
end

function lua_ChangeNpcSpeed(rid, speed)
	local pObj = CHAR_MGR.GetCharById(rid)
	if pObj and pObj:IsNpc() then
		pObj:SetSpeed(speed)
	end	
end

lmapdata = {}
lmapdata.getz = function(mapNo, x, y)									--�ͻ���д��ȡz����
	--print("-===============", x, y)
	if x <= 0 or x >= MAP_MAX_X 
		or y <= 0 or y >= MAP_MAX_Y then
		return
	end
	return GetMapYByXAndZ(x,y)
end
lmapdata.realtogrid = function(mapNo, x, y)								--�ͻ������Ӹú�������				
	--error("to add lmapdata.realtogrid in client")
	return GetMapPosByRealPos(x, y)
end
lmapdata.torealpos = function(mapNo, gx, gy)
	--������ʵ����
	return GetRealPosByMapPos(gx, gy)
end

lretmap = {}
lretmap.useradd = NORMAL_FUNC
lretmap.usermove = NORMAL_FUNC
lretmap.userleave = NORMAL_FUNC
lretmap.userdmleave = NORMAL_FUNC
lretmap.userjump = NORMAL_FUNC
lretmap.static_npcadd = NORMAL_FUNC
lretmap.static_npcleave = NORMAL_FUNC
lretmap.static_npcdmleave = NORMAL_FUNC
lretmap.itemadd = NORMAL_FUNC
lretmap.itemleave = NORMAL_FUNC
lretmap.itemdmleave = NORMAL_FUNC
lretmap.hp = NORMAL_FUNC
lretmap.die = NORMAL_FUNC
lretmap.other = function (protoMsg)							--todo ��������˵���Ϣ
	Network.send("C2s_fuben_retother", protoMsg)
end

laoi = {}
laoi.obj_new = NORMAL_FUNC
laoi.obj_sethp = NORMAL_FUNC
laoi.obj_setcomp = NORMAL_FUNC
laoi.obj_setpkmode = NORMAL_FUNC
laoi.obj_setteamid = NORMAL_FUNC
laoi.obj_setclubid = NORMAL_FUNC
laoi.obj_setevilstate = NORMAL_FUNC
laoi.obj_setserverid = NORMAL_FUNC
laoi.obj_ishittarget = function(self, tarObj)
	if self == tarObj then return end		
	if tarObj:IsDie() then return end	--�����Ѿ��Ѿ�̬npc������	
	local sNpc = self:IsNpc()
	local tNpc = tarObj:IsNpc()
	
	if sNpc then
		return self:GetComp() ~= tarObj:GetComp()		--1��npcһ������npc
	else
		if tNpc then 									--1��npcһ������npc
			return self:GetComp() ~= tarObj:GetComp()
		end	
		
		--���2����player�Ļ���Ҫ�ж�����self�Ĺ���ģʽ
		if self:GetComp() ~= tarObj:GetComp() then	--��ͬ����Ӫ��Ϊ�з�
			return true
		end
		
		--ͬ��Ӫ���жϹ���ģʽ
		local pkmode = self:GetPkMode()
		if pkmode == PKMODE_PEACE then 
			return
		elseif pkmode == PKMODE_WHOLE then
			return true
		elseif pkmode == PKMODE_TEAM then
			local atId = self:GetTeamId() or 0
			local ttId = tarObj:GetTeamId() or 0
			if atId == ttId and atId ~= 0 then
				return
			else
				return true
			end
		elseif pkmode == PKMODE_CLUB then
			local acId = self:GetClubId() or 0
			local tcId = tarObj:GetClubId() or 0
			if acId == tcId and acId ~= "" then
				return
			else
				return true
			end
		elseif pkmode == PKMODE_EVIL then
			if tarObj:GetEvilState() == EVILSTATE_RED then
				return true
			end
			return
		elseif pkmode == PKMODE_SERVER then
			return self:GetServerId() ~= tarObj:GetServerId()
		end
		
		return 
	end	
end

laoi.map_new = NORMAL_FUNC
laoi.map_hasocomp9 = NORMAL_FUNC
laoi.map_hasscomp9 = NORMAL_FUNC
laoi.map_region9player = function()
	local playerTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsPlayer() then
			tinsert(playerTbl, _id)
		end
	end
	return true, playerTbl
end
laoi.map_region9npc = function()
	local npcTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsNpc() then
			tinsert(npcTbl, _id)
		end
	end
	return true, npcTbl
end
laoi.map_nearbyplayer = function(_, Obj, radius, excludeCharId)
	local playerId = nil
	local minDis = 100000000
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:GetHp() > 0 and _CharObj:IsPlayer() and (_CharObj ~= Obj) and (_CharObj:GetId() ~= excludeCharId) then
			local disX = mabs(_CharObj:GetX() - Obj:GetX())
			local disY = mabs(_CharObj:GetY() - Obj:GetY())
			if disX <= radius and disY <= radius then
				local dxy = disX ^ 2 + disY ^ 2
				if dxy < minDis then
					minDis = dxy
					playerId = _id
				end
			end
		end
	end
	if playerId then
		return true, playerId
	end
end
laoi.map_nearbypartner = function(_, Obj, radius, excludeCharId)
	local partnerId = nil
	local minDis = 100000000
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:GetHp() > 0 and _CharObj:IsPartner() and (_CharObj ~= Obj) and (_CharObj:GetId() ~= excludeCharId) then
			local disX = mabs(_CharObj:GetX() - Obj:GetX())
			local disY = mabs(_CharObj:GetY() - Obj:GetY())
			if disX <= radius and disY <= radius then
				local dxy = disX ^ 2 + disY ^ 2
				if dxy < minDis then
					minDis = dxy
					partnerId = _id
				end
			end
		end
	end
	if partnerId then
		return true, partnerId
	end
end
laoi.map_regionsplayer = function()
	local playerTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsPlayer() then
			tinsert(playerTbl, _id)
		end
	end
	if #playerTbl > 0 then
		return playerTbl
	end
end
laoi.map_addobj = function()
	local playerTbl = {}
	local partnerTbl = {}
	local npcTbl = {}
	local itemTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsPlayer() then
			tinsert(playerTbl, _id)
		elseif _CharObj:IsNpc() then
			tinsert(npcTbl, _id)
		elseif _CharObj:IsItem() then
			tinsert(itemTbl, _id)
		end
	end
	return true, playerTbl, partnerTbl, npcTbl, itemTbl
end
laoi.map_removeobj = function(_, Obj)
	local playerTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsPlayer() and _CharObj ~= Obj then			--�Լ�������ӽ�ȥ
			tinsert(playerTbl, _id)
		end
	end
	return true, playerTbl
end
laoi.map_moveobj = function(_, Obj)								--�ͻ��˶�ֻ����ͬһ�����ƶ�
	local playerTbl = {}
	local allCharObj = CHAR_MGR.GetAllCharObj(1)
	for _id, _CharObj in pairs(allCharObj) do
		if _CharObj:IsPlayer() and _CharObj ~= Obj then			--�Լ�������ӽ�ȥ
			tinsert(playerTbl, _id)
		end
	end
	return 0, playerTbl
end

engine = {}
engine.Millisecond = function()
	return 0
end
engine.Microsecond = function()
	return 0
end

function _Serialize(Object)
	local function ConvSimpleType(v)
		if type(v)=="string" then
			return string.format("%q",v)
		end
		return tostring(v)
	end

	local function RealFun(Object, Depth)
		--TODO: gxzou ѭ������û�д���
		Depth = Depth or 0
		Depth = Depth + 1
		assert(Depth<20, "too long Depth to serialize")

		if type(Object) == 'table' then
			--if Object.__ClassType then return "<Object>" end
			local Ret = {}
			table.insert(Ret,'{')
			for k, v in pairs(Object) do
				--print ("serialize:", k, v)
				local _k = ConvSimpleType(k)
				if _k == nil then
					error("key type error: "..type(k))
				end
				table.insert(Ret,'[' .. _k .. ']')
				table.insert(Ret,'=')
				table.insert(Ret,RealFun(v, Depth))
				table.insert(Ret,',')
			end
			table.insert(Ret,'}')
			return table.concat(Ret)
		else
			return ConvSimpleType(Object)
		end
	end
	
	return RealFun(Object)
end

lserialize = {}
lserialize.lua_seri_str = _Serialize 
