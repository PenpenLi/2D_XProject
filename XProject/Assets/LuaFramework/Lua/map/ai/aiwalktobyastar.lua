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

------------------ȥĳλ��(��WalkToCharacter��һ��)���AI��------------------------
clsAIWalkToByAStar = AI_BASE.clsAIBase:Inherit()
function clsAIWalkToByAStar:__init__(charObj, wTime, pathNo)
	assert(charObj:IsNpc(), "only npc can use clsAIWalkToByAStar")
	Super(clsAIWalkToByAStar).__init__(self, charObj)
	self.wTime = wTime

	local PATHDATA = Import("setting/astarpath/astarpath_data.lua").GetPathData()
	assert(PATHDATA[pathNo] and #PATHDATA[pathNo] > 1, "not pathNo:" .. pathNo)
	assert(PATHDATA[pathNo].MapNo == MAP_NO, "not same mapno in pathNo:" .. pathNo)

	self.pathData = PATHDATA[pathNo]
	self.pathMaxCnt = #self.pathData
	self.pathCnt = 1
	
	charObj:SetConvoyInfo({
		lostDistance = PATHDATA[pathNo].LostDistance,
		destPos = self.pathData[self.pathMaxCnt],
	})
end

function clsAIWalkToByAStar:Run()
	local sCharObj = self.charObj
	
	if self.pathCnt < self.pathMaxCnt then
		local npathCnt = self.pathCnt + 1
		self.pathCnt = npathCnt
		sCharObj:MoveTo(self.pathData[npathCnt][1], self.pathData[npathCnt][2], nil, nil, true)
	end
	
	return AI_CONTINUE
end