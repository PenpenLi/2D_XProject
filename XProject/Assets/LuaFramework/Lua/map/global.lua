DISTANCE_SORT = Import("setting/skill/distance_sort.lua").GetDistanceSort()

--CHAR
CHAR_MGR = Import("map/char/char_mgr.lua")		--��������� 
BASECHAR = Import("map/char/basechar.lua")		--���ж������

UTIL = Import("global/util.lua")

ITEM 		= Import("map/char/item.lua")			--item
NPC 		= Import("map/char/npc.lua")			--npc
STATICNPC 	= Import("map/char/staticnpc.lua")		--��̬npc
YEWAIBOSSNPC = Import("map/char/yewaibossnpc.lua")	--Ұ��boss npc
SECRETBOSSNPC = Import("map/char/secretbossnpc.lua")	--�ܾ�boss npc
PARTNER 	= Import("map/char/partner.lua")		--partner
MAGIC 		= Import("map/char/magic.lua")			--magic
USER 		= Import("map/char/user.lua")			--user
USER_MIRROR	= Import("map/char/user_mirror.lua")	--user����
ARTIFACTDATA = Import("setting/user/artifact_data.lua")

--����
SKILL_DATA  = Import("setting/skill/skill_data.lua")

--��ͼ
MAP_DATA = Import("setting/map/map_data.lua")

--ս��
FIGHT 		= Import("map/module/fight/fight.lua")
FIGHT_EVENT	= Import("map/module/fight/event.lua")
CHECKEND	= Import("map/module/fight/checkend.lua")

local isOk, msg = pcall(Import, string.format("setting/npc/npc_battle_data/%d.lua", MAP_NO))
NPC_BATTLE_DATA = isOk and msg or {GetAllNpcData = function () return {} end}

------ai��������------
AI_BASE 				= Import("map/ai/aibase.lua")
AI_WALKTOCHAR 			= Import("map/ai/aiwalktochar.lua")
AI_ATTACK 				= Import("map/ai/aiattack.lua")
AI_WALKTOCHARANDATTACK 	= Import("map/ai/aiwalktocharandattack.lua")
AI_WALKAROUND			= Import("map/ai/aiwalkaround.lua")
AI_FOLLOW				= Import("map/ai/aifollow.lua")
------aiʹ������------
AI_WALKAROUNDBEATTACK	= Import("map/ai/aiwalkaroundbeattack.lua")
AI_WALKAROUNDATTACK		= Import("map/ai/aiwalkaroundattack.lua")
AI_FOLLOWATTACK			= Import("map/ai/aifollowattack.lua")
AI_WBOSSATTACK			= Import("map/ai/aiwbossattack.lua")
AI_WALKTOPOS			= Import("map/ai/aiwalktopos.lua")
AI_WALKTOBYASTAR		= Import("map/ai/aiwalktobyastar.lua")
AI_WALKCSHEEP			= Import("map/ai/aiwalkcsheep.lua")
AI_CWARBOSSATTACK		= Import("map/ai/aicwarbossattack.lua")
AI_WALKATTACKTIME		= Import("map/ai/aiwalkattacktime.lua")
AI_AIATTACKEXTSKILL		= Import("map/ai/aiattackextskill.lua")
AI_SHOUWEIPLAYERFIRST	= Import("map/ai/aishouweiplayerfirst.lua")
AI_WALKSHOW				= Import("map/ai/aiwalkshow.lua")
AI_YEWAIBOSS			= Import("map/ai/aiyewaiboss.lua")

NPC_AUTOCREATE = Import("map/module/npc/autocreate.lua")

