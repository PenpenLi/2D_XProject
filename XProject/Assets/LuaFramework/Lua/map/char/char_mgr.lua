local assert = assert
local debug = debug
local table = table
local tinsert = table.insert
local math = math
local mabs = math.abs

CharIdMap = {}
UserVfdMap = {}
VfdMap = {}		--{��=vfds}
KF_VfdMap = {}
NameMap = {}
FIGHT_ID = 0
setmetatable(KF_VfdMap, {__mode = "v"}) --����

function NewId()
	local Id = _export_sid()
	return Id
end

function NewFightId()
	FIGHT_ID = FIGHT_ID + 1
	return FIGHT_ID
end

--�Ƿ���vfd�������
function HasUserObjByVfd(vfd)				--ע��,������жϲ����в��
	if UserVfdMap[vfd] then
		return true
	end
end

--��ȡ��Ҷ���								--ע��,������жϲ����в��
function GetUserByVfd(vfd)
	return UserVfdMap[vfd]
end

function GetAllCharObj(mapLayer)
	assert(mapLayer, "GetAllCharObj not mapLayer")
	local ret = {}
	for _id, _CharObj in pairs(CharIdMap) do
		if _CharObj:GetMapLayer() == mapLayer then
			ret[_id] = _CharObj
		end
	end
	return ret
end

function GetAllPlayerVfds(mapLayer)
	assert(mapLayer, "GetAllPlayerVfds not mapLayer")
	local ret = {}
	for _, _UserObj in pairs(UserVfdMap) do
		local vfd = _UserObj:GetVfd()
		if not _UserObj:IsMirrorPlayer() and _UserObj:GetMapLayer() == mapLayer then
			tinsert(ret, vfd)
		end
	end
	return ret
end

--��ȡ���ŵ�ͼ��������vfd
function GetAllMapPlayerVfds()
	local ret = {}
	for _, _UserObj in pairs(UserVfdMap) do
		local vfd = _UserObj:GetVfd()
		if not _UserObj:IsMirrorPlayer() then
			tinsert(ret, vfd)
		end
	end
	return ret
end

function GetAllPlayerObj(mapLayer)
	assert(mapLayer, "GetAllPlayerUids not mapLayer")
	local ret = {}
	for _, _UserObj in pairs(UserVfdMap) do
		local vfd = _UserObj:GetVfd()
		if not _UserObj:IsMirrorPlayer() and _UserObj:GetMapLayer() == mapLayer then
			tinsert(ret, _UserObj)
		end
	end
	return ret
end

function GetPlayerCnt()
	return table.size(UserVfdMap)
end

function GetMapPlayerCnt(mapLayer)
	if not mapLayer then return 0 end
	return table.size(GetAllPlayerVfds(mapLayer))
end

function GetAllLayerCharObj()
	return CharIdMap
end

--��ȡ����
function GetCharById(charId)				--ע�������Ƿ�����й�,�йصľ�����basechar�����
	if not charId then return nil end
	return CharIdMap[charId]
end

function GetUserName(charId)
	return NameMap[charId]
end

--��ȡһ����Ҷ���
function GetRandomUserObj(mapLayer)
	assert(mapLayer, "GetRandomUserObj not mapLayer")
	for _, _UserObj in pairs(UserVfdMap) do
		if not _UserObj:IsMirrorPlayer() and _UserObj:GetMapLayer() == mapLayer then
			return _UserObj
		end
	end
end

--��ȡ���һ���ͻ���,���ݾ���
function GetRandomUserObjByRadius(mapLayer, radius, x, y)
	assert(mapLayer, "GetRandomUserObjByRadius not mapLayer")
	local tbl = {}
	for _, _UserObj in pairs(UserVfdMap) do
		if not _UserObj:IsMirrorPlayer() and _UserObj:GetMapLayer() == mapLayer then
			local tx, ty = _UserObj:GetX(), _UserObj:GetY()
			if mabs(tx - x) <= radius and mabs(ty - y) <= radius then
				tinsert(tbl, _UserObj)
			end
		end
	end
	local cnt = #tbl
	if cnt > 0 then
		return tbl[math.random(cnt)]
	end
end

--����IDɾ����������
function RemoveCharId(charId)
	if not charId then 
		return 
	end
	local charObj =  CharIdMap[charId]
	if charObj then 
		if charObj.IsPlayer and charObj:IsPlayer() then 
			local vfd = charObj:GetVfd()
			local mapLayer = charObj:GetMapLayer()
			UserVfdMap[vfd] = nil
			KF_VfdMap[vfd] = nil
			for i,v in pairs(VfdMap[mapLayer] or {}) do
				if v==vfd then
					table.remove(VfdMap[mapLayer], i)
				end
			end
		end
	end
	CharIdMap[charId] = nil	 
end

function AddKuaFuCharVfd(vfd, UserObj)
	KF_VfdMap[vfd] = UserObj
end

function GetKuaFuUserObjByVfd(vfd)
	return KF_VfdMap[vfd]
end

--��ӳ�������
function AddCharId(charId, charObj)
	if not charId then 
		_RUNTIME_ERROR("AddCharId id is nil", charObj:GetId(), debug.traceback())
		return 
	end 
	local OldObj = CharIdMap[charId]
	if OldObj then
		_RUNTIME_ERROR("AddCharId add obj twice", charId, charObj:GetName(), MAP_NO, debug.traceback())
--		error("AddCharId add obj twice") 
	end
	
	if charObj.IsPlayer and charObj:IsPlayer() then 
		assert(not UserVfdMap[charObj:GetVfd()], "has vfd charobj Player")
		local vfd = charObj:GetVfd()
		local mapLayer = charObj:GetMapLayer()
		UserVfdMap[vfd] = charObj
		VfdMap[mapLayer] = VfdMap[mapLayer] or {}
		table.insert(VfdMap[mapLayer], vfd)
		NameMap[charId]=charObj:GetName()
	end
	
	CharIdMap[charId] = charObj
end

HurtHpTbl = {}
BearHurtHpTbl = {}			--�����˺�
ReHpTbl = {}				--��Ѫ
function lua_ClearHurtHp()
	HurtHpTbl = {}
	BearHurtHpTbl = {}
	ReHpTbl = {}
end
function GetHurtOtherHp(id)
	if not id then return 0 end
	return HurtHpTbl[id] or 0
end
function AddHurtOtherHp(id, hp)
	if not id then return end
	HurtHpTbl[id] = (HurtHpTbl[id] or 0) + hp
end
function ClearHurtOtherHp(id)
	HurtHpTbl[id] = nil
end

function GetBearHurtHp(id)
	if not id then return 0 end
	return BearHurtHpTbl[id] or 0
end
function AddBearHurtHp(id, hp)
	if not id then return end
	BearHurtHpTbl[id] = (BearHurtHpTbl[id] or 0) + hp
end
function ClearBearHurtHp(id)
	BearHurtHpTbl[id] = nil
end

function GetReHp(id)
	if not id then return 0 end
	return ReHpTbl[id] or 0
end
function AddReHp(id, hp)
	if not id then return end
	ReHpTbl[id] = (ReHpTbl[id] or 0) + hp
end
function ClearReHp(id)
	ReHpTbl[id] = nil
end

