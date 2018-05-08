local table = table
local math = math
local pairs = pairs
local mceil = math.ceil
MAP_NO, MAP_ID = ... 


IS_DELAY_RETMOVE = true			--�ӳٷ����ƶ�
IS_FIGHT_MAP = true
IS_RET_MOVE = true				--���ж������ƶ������߼�
--����һ��ȫ�ֵ�ģ�飬��Ϸ������ʱ���һ������Ľű���

IS_MAPSTATE = true
IS_SERVER = true
function IsServer()
	return IS_SERVER
end
function IsClient()
	return
end

EVILCAL = true			--�����ƶ�ֵ

function _SkillVarNoFunc(value, tbl)
	for _, _tbl in pairs(tbl) do
		if _tbl[1] <= value and value <= _tbl[2] then
			return _tbl[3]
		end
	end
	return 0
end

debug.excepthook = debug.traceback
Reversion = 14177
BootTime = nil
os.exit = nil 

func_call = {}

local p = "3rd/pbc" 
local old_path = package.path
package.path = string.format("%s;%s/?.lua;%s/?/init.lua;",old_path,p,p)
local json_path = "3rd/cjson/?.so;"
local protobuff_path = "3rd/protobuf/?.so;"
package.cpath = string.format("%s;%s;%s",json_path,protobuff_path,package.cpath)
dofile("3rd/pbc/pbc.lua")

PBC = require "pbc"

CALLOUT = {
	RemoveAll = function() end
}

--����������ڵ�λ��	
--layer = {																			
--	x = {
--		y = {}		--����
--	}
--}
MAP_LAYER_CHAR = {}

MAP_DATA_OBJ, MAP_MAX_X, MAP_MAX_Y = lmapdata.hasmap(MAP_NO)
assert(MAP_DATA_OBJ and MAP_MAX_X and MAP_MAX_Y, "not MAP_DATA_OBJ, MAP_MAX_X, MAP_MAX_Y")

require "setting/map/map_data"
require "map/map_const"
local allData = GetMapData()
local oneData = allData[MAP_NO]

SCENE_TYPE = oneData.SceneType
SECURITY_AREAS = oneData.SecurityAreas
SCENE_NAME = oneData.Name
ENTER_POS = oneData.EnterPos
DIDUISECNE = {}
FLAG = nil
SHOW_YELLOW = nil
for mapNo, data in pairs(allData) do
	if data.DiduiScene == 1 then 
		if mapNo == MAP_NO then 
			FLAG = true
			if not data.DiduiShowYellow or data.DiduiShowYellow == 1 then
				SHOW_YELLOW = true
			end
		end	
	end
end

ONE_GRID_X, ONE_GRID_Y = oneData.GridSize[1], oneData.GridSize[2]
if oneData.FightType ~= MAP_FIGNT then
	IS_FIGHT_MAP = false
end
if not ONE_GRID_X then
	ONE_GRID_X = 12
end
if not ONE_GRID_Y then
	ONE_GRID_Y = 12
end
MIN_GRID_XY = ONE_GRID_X > ONE_GRID_Y and ONE_GRID_Y or ONE_GRID_X
MAP_LAYER_DATA = {}
local MAP_OBJ = laoi.map_new(MAP_MAX_X, MAP_MAX_Y, ONE_GRID_X, ONE_GRID_Y)	--����map����
assert(MAP_OBJ, "not MAP_OBJ")
MAP_LAYER_DATA[1] = MAP_OBJ	
MAP_LAYER_CHAR[1] = {}		

MAP_MOVE_BC_CNT = oneData.MoveBroadcastCnt
if oneData.FightType == MAP_FIGNT then
	MAP_MOVE_BC_CNT = nil
end

MAP_DIE_TYPE = oneData.DieState
if oneData.IsCreateStart == 1 then
	IS_RET_MOVE = true
end

if oneData.EvilCal and oneData.EvilCal == 0 then
	EVILCAL = false
end

PK_ENEMY = oneData.Enemy == 1  --��ɱģ��

IS_K3V3MAP = MAP_NO == 1164  --3V3��ͼ

function lua_PreloadClear()
	MAP_LAYER_DATA = {}
	MAP_LAYER_CHAR = {}
	local MAP_OBJ = laoi.map_new(MAP_MAX_X, MAP_MAX_Y, ONE_GRID_X, ONE_GRID_Y)	--����map����
	assert(MAP_OBJ, "not MAP_OBJ")
	MAP_LAYER_DATA[1] = MAP_OBJ	
	MAP_LAYER_CHAR[1] = {}	
end

--ģ�������˳�������е�
--��Ҿ�����ʹ��dofile�����Ǳ���ȫ����������ģ��
--��Table�ᱻ����ģ����ʣ���Щģ�鲻����Import
--dofile���õ�ģ�鲻����ʹ��__FILE__��

-----------------------------------------------------------ע�⣬�����ټ���û�õ��Ķ�������Ϊ���������˿����ڴ�����ӱȽϿ�

DOFILELIST = 
{
		"global/engine_export.lua",--���浼�뺯��
		"base/class.lua",
--		"base/import.lua",
		"base/extend.lua",
		"common/common_const.lua",
		"map/map_const.lua",
		"map/engine2lua.lua",								--���浽lua�ĺ���
		"map/timer.lua",									
		"base/log.lua",
		"map/protocol.lua",
		"base/cross.lua",
		"base/net.lua",
		"base/efun.lua",
		"map/global.lua",--�ŵ������
}

local function OnStart()
	BootTime = os.time()
	sys = sys or {}
	sys.path = sys.path or {}
	table.insert(sys.path,posix.getcwd())

	--��ʼ����������� 
	math.randomseed(os.time()+17423987)
end

local function do_preload ()
	for _,file in pairs(DOFILELIST) do
--		print ("preload ..... ",file)
		dofile(file)
	end
	--���Լ�Ҳ��ӽ�ȥ
	table.insert(DOFILELIST, "map/preload.lua")
end

--�������������ص��Ļص�������������
--����
function perform_gc()
--	print("perform_gc", os.time(),collectgarbage("count"), MAP_NO, MAP_ID)
	collectgarbage("step", 512)
end

-----��ʼִ�м����߼�----
OnStart()
do_preload()
local ext_tbl = extdata2table(_ExtData) or {}
_WorldGrade = ext_tbl.worldgrade or 0

local IsTestServer = cfgData.IsTestServer
local function tracebackAndVarieble(msg)  
    local allMsg = msg .. "\n" .. debug.traceback()
    if IsTestServer then
    	print(allMsg)
    end
    go_log_go_error("../log/calllua.log", -2, allMsg)
end  

__G__TRACKBACK__ = tracebackAndVarieble