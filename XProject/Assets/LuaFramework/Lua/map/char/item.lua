local string=string
local table=table
local debug=debug
local pairs=pairs
local tostring=tostring
local tonumber=tonumber
local math=math
local MAP_ID = MAP_ID
local MAP_NO = MAP_NO
local tinsert = table.insert

clsItem = BASECHAR.clsBaseChar:Inherit({__ClassType = "ITEM"})

function clsItem:__init__(mlCharId, x, y, z, syncData, ociData, mapLayer)
	assert(mlCharId, "not mlCharId in clsItem")
	Super(clsItem).__init__(self, x, y, z, ITEM_TYPE, syncData, ociData, mapLayer)
	
	lretmap.itemadd(self:GetId(), MAP_ID, self:GetMapLayer(), self:GetX(), self:GetY(), self:GetZ())
	self:SetComp(0)			--���õ�����
end

function clsItem:IsItem()
	return true
end

function clsItem:AddMap()			--��ӽ����ͼ��Ĵ���,��������,��Ȼ����
	local isOk, playerTbl = laoi.map_addobj(self:GetMapObj(), self:GetEngineObj())
	assert(isOk, "item add map error: " .. self:GetName() .. " x,y" .. self:GetX()..","..self:GetY())
	if isOk then
		self:MoveChangeMapPos(CHANGE_MAPPOS_ADD)
		if playerTbl then
			local vfds = {}
			for _, pCharId in pairs(playerTbl) do
				local pCharObj = CHAR_MGR.GetCharById(pCharId)
				if pCharObj then
					tinsert(vfds, pCharObj:GetVfd())
				end
			end
			if #vfds > 0 then
--				pbc_send_msg(vfds, "S2c_aoi_add", {													--���ԣ���ʱû����Ʒ
--					rid = self:GetId(),
--					type = ITEM_TYPE,
--					x = self:GetX(),
--					y = self:GetY(),
--				})		
			end		
		end
	end
end

function clsItem:Move()				--����ƶ���Ĵ���,��������,��Ȼ����(��Ȼ��Ʒû���ƶ�)
--	_RUNTIME("clsItem:Move")
end

function clsItem:MoveTo()			--����ƶ���Ĵ���,��������,��Ȼ����(��Ȼ��Ʒû���ƶ�)
--	_RUNTIME("clsItem:MoveTo")
end

function clsItem:JumpTo()			--����ƶ���Ĵ���,��������,��Ȼ����(��Ȼ��Ʒû���ƶ�)
--	_RUNTIME("clsItem:JumpTo")
end

function clsItem:LeaveMap()			--����뿪��ͼ��Ĵ���,��������,��Ȼ����
	local isOk, playerTbl = laoi.map_removeobj(self:GetMapObj(), self:GetEngineObj())	
	assert(isOk, "clsItem:LeaveMap error: " .. self:GetName())
	
	if playerTbl then
		local vfds = {}
		for _, pCharId in pairs(playerTbl) do
			local pCharObj = CHAR_MGR.GetCharById(pCharId)
			if pCharObj then
				tinsert(vfds, pCharObj:GetVfd())
			end
		end
		if #vfds > 0 then
			pbc_send_msg(vfds, "S2c_aoi_leave", {													--���ԣ�û��д��
				map_no = MAP_NO,
				map_id = MAP_ID,
				id = self:GetId(),
			})		
		end		
	end	
	
	lretmap.itemleave(self:GetId(), MAP_ID, self:GetMapLayer())
	self:MoveChangeMapPos(CHANGE_MAPPOS_LEAVE)
end