--$Id: gen.lua 45927 2008-07-09 06:30:35Z zhj $
--__auto_local__start--
local string=string
local table=table
local math=math
local io=io
local debug=debug
local pairs=pairs
local ipairs=ipairs
local tostring=tostring
local tonumber=tonumber
--__auto_local__end--


local Actions ={}


local function TellUser(who,...)
	if not who then return end
	local msg = UTIL.Serialize(...) 
	who:TellMe(msg)
end 


local function GenNormal(who, File)
	local GenFile=Import(File)
	GenFile.DoGen(who)
end

--������ת��
local function GenTele(who)
	local GenFile=Import("autocode/gen/npc/gen_scene_tele.lua")
	GenFile.DoGen(who)
end

--����NPC���ݱ�
function GenNpcDat(who)
	local GenFile=Import("autocode/gen/npc/gen_npcdata.lua")
	GenFile.DoGen(who)
	GenFightNpcDat(who)
	GenLanguageData(who)
	GenGoblinData(who)
	return true
end

--����ս��NPC���ݱ�
function GenFightNpcDat(who)
	local GenFile=Import("autocode/gen/npc/gen_fightnpcdata.lua")
	GenFile.DoGen(who)
	return true
end

--���ɳ���NPC
function GenSceneNpc()
	local GenFile=Import("autocode/gen/npc/gen_scene_npc.lua")
	GenFile.DoGen(who)
	return true
end 

--���ɳ�������
function GenSceneData()
	local GenFile=Import("autocode/gen/npc/gen_scene_data.lua")
	GenFile.DoGen(who)
	return true
end

--������
function GenLineUpData(who)
	local GenFile=Import("autocode/gen/lineup/gen_lineup_expdata.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/lineup/gen_lineup_data.lua")
	GenFile.DoGen(who)
	GenLineUpPosData(who)
	return true
end

function GenLineUpPosData()
	local GenFile=Import("autocode/gen/lineup/gen_lineup_pos.lua")
	GenFile.DoGen(who)
	return true
end


--������������
function GenAreaData()
	local GenFile=Import("autocode/gen/npc/gen_scene_area.lua")
	GenFile.DoGen(who)
	GenTele(who)
	return true
end

--�������԰�
function GenLanguageData()
	local GenFile=Import("autocode/gen/language/npc.lua")
	GenFile.DoGen(who)
	local GenFile2=Import("autocode/gen/language/npc2.lua")
	GenFile2.DoGen(who)
	local GenFile2=Import("autocode/gen/language/name.lua")
	GenFile2.DoGen(who)
	GenTalkData()
	return true
end

--���ɾ����
function GenExpData()
	local GenFile=Import("autocode/gen/exp/gen_expdata.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/exp/gen_matialexpdata.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/exp/gen_skillexpdata.lua")
	GenFile.DoGen(who)
	return true
end

--�����л���
function GenTalkData()
	local GenFile=Import("autocode/gen/talk/gen_talkdata.lua")
	GenFile.DoGen(who)
	return true
end

--����װ������
function GenEquipData()
	local GenFile=Import("autocode/gen/equip/gen_equipdata.lua")
	GenFile.DoGen(who)
	return true
end

--����buff�����
function GenBuffData()
	local GenFile=Import("autocode/gen/skill/gen_buffdata.lua")
	GenFile.DoGen(who)
	return true
end 

--���ɽ�ɫ��ʼ������
function GenHeroData()
	local GenFile=Import("autocode/gen/hero/gen_herodata.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/hero/gen_newbiedata.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/hero/gen_photo.lua")
	GenFile.DoGen(who)
	return true
end 

--������ѧ���Ա�
function GenMartialData()
	local GenFile=Import("autocode/gen/skill/gen_martialdata.lua")
	GenFile.DoGen(who)
	return true
end


function GenTrunkTaskData(who, s)
--	--��������Ի�����
--	_DEBUG("begin talkdata")
--	local GenFile=Import("autocode/gen/task/trunk_task/gen_trunk_task_talkdata.lua")
--	GenFile.DoGen(who)
--	_DEBUG("end talkdata")
--	
--	--����������������
--	_DEBUG("begin task_desc")
--	GenFile = Import("autocode/gen/task/trunk_task/gen_trunk_task_desc.lua")
--	GenFile.DoGen(who)
--	_DEBUG("end task_desc")

	--������������
	_DEBUG("begin task_data")
	local GenFile = Import("autocode/gen/task/trunk_task/gen_trunk_task_data.lua")
	GenFile.DoGen(who)
	_DEBUG("end task_data")
	return true
end

--����ͬ�����ݱ�
function GenPartnerData(who)
	local GenFile=Import("autocode/gen/partner/gen_partnerdata.lua")
	GenFile.DoGen(who)
	return true
end

--������ѧ���ķ�����ʽ���ݱ�����ʽ�ļ�
function GenMartialAll(who)
	local GenFile=Import("autocode/gen/skill/gen_martialskill.lua")
	GenFile.DoGen(who)
	GenSkillData(who)
	GenSkillBuff(who)
	local GenFile=Import("autocode/gen/skill/gen_martialprop.lua")
	GenFile.DoGen(who)
	return true
end

function GenSkillData(who)
	local GenFile=Import("autocode/gen/skill/gen_martial.lua")
	GenFile.DoGen(who)
	return true
end

function GenSkillBuff(who)
	local GenFile=Import("autocode/gen/skill/gen_skillbuff.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/skill/gen_martial_zizhe.lua")
	GenFile.DoGen(who)
	return true
end 

function GenItemFile(who, s)
	--local GenFile=Import("autocode/gen/item/gen_item.lua")
	local GenFile=Import("autocode/gen/item/gen_item_new.lua")
	GenFile.DoGen(who)
	return true
end

function GenItemData(who, s)
	local GenFile=Import("autocode/gen/item/gen_item_data.lua")
	GenFile.DoGen(who)
	return true
end


function GenFamilyData(who, s)
	local FAMILY_GEN_FILE = {
		"autocode/gen/family/gen_family_data.lua", 		--��������
		"autocode/gen/family/gen_master_npc_data.lua", 		--��ѧNPC����
		"autocode/gen/family/gen_learning_martial_data.lua", 	--��ѧ����
		"autocode/gen/family/gen_family_new_data.lua", 	--����������
	}
	for _, GenFilePath in pairs(FAMILY_GEN_FILE) do
		local GenFile=Import(GenFilePath)
		GenFile.DoGen(who)
	end
	return true
end


function GenPotentialData(who, s)
	local GenFile = Import("autocode/gen/potential/gen_equip_potential_data.lua")
	GenFile.DoGen(who)
	return true
end


function GenSellData(who, s)
	local GenFile=Import("autocode/gen/trade/gen_sell_data.lua")
	GenFile.DoGen(who)
	return true
end


function GenYunBiaoData(who, s)
	local GenFile=Import("autocode/gen/task/yun_biao/gen_yun_biao_data.lua")
	GenFile.DoGen(who)
	return true
end


function GenAllScene()
	GenSceneData()
	GenAreaData()
	GenTele()
	GenSceneNpc()
end

function GenAccPasswd(who)
	local GenFile=Import("autocode/gen/acc/gen_acc.lua")
	GenFile.DoGen(who)
	return true
end 


function GenBonusData(who)
	local GenFile=Import("autocode/gen/bonus/gen_bonus_data.lua")
	GenFile.DoGen(who)
	return true
end 

function GenGoblinData(who)
	local GenFile=Import("autocode/gen/goblin/gen_goblindata.lua")
	GenFile.DoGen(who)
	return true
end 

function GenFaqData(who)
local GenFile=Import("autocode/gen/faq/gen_faq_data.lua")
	GenFile.DoGen(who)
	return true
end 

function GenReward(who)
	local GenFile=Import("autocode/gen/reward/gen_reward.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/reward/gen_stat_reward.lua")
	GenFile.DoGen(who)
	return true
end 

function GenReward2(who)
	local GenFile=Import("autocode/gen/reward/gen_stat_reward.lua")
	GenFile.DoGen(who)
	return true
end

function GenItemMerge(who)
	local GenFile=Import("autocode/gen/item/gen_item_merge_data.lua")
	GenFile.DoGen(who)
	return true
end 


function GenGuideData(who)
	local GenFile=Import("autocode/gen/guide/gen_guide_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenMartyr(who)
	local GenFile=Import("autocode/gen/martyr/gen_martyr.lua")
	GenFile.DoGen(who)
	return true
end
function GenWorldBossData(who)
	local GenFile=Import("autocode/gen/worldboss/gen_worldboss.lua")
	GenFile.DoGen(who)
	return true
end 
function GenWulinData(who)
	local GenFile=Import("autocode/gen/wulin/gen_wulin.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/wulin/gen_wulinreward.lua")
	GenFile.DoGen(who)
	local GenFile=Import("autocode/gen/wulin/gen_wulin_cham.lua")
	GenFile.DoGen(who)
	return true
end 

local function GenXinMoData(who)
	local GenFile=Import("autocode/gen/xinmo/gen_xinmo_data.lua")
	GenFile.DoGen(who)
	return true
end 


local function GenBattleData(who)
	local GenFile=Import("autocode/gen/battle/gen_battle_data.lua")
	GenFile.DoGen(who)
	return true
end


local function GenDynamicNpcData(who)
	local GenFile=Import("autocode/gen/npc/gen_dynamic_npc_data.lua")
	GenFile.DoGen(who)
	return true
end

local function GenAIData(who)
	local GenFile=Import("autocode/gen/ai/gen_aidata.lua")
	GenFile.DoGen(who)
	return true
end

function GenItemProp(who)
	local GenFile=Import("autocode/gen/item/gen_item_prop.lua")
	GenFile.DoGen(who)
	return true
end

function GenTaolin(who)
	local GenFile=Import("autocode/gen/taolin/gen_taolin.lua")
	GenFile.DoGen(who)
	return true
end 

function GenShengxiao(who)
	local GenFile=Import("autocode/gen/shengxiao/gen_shengxiao.lua")
	GenFile.DoGen(who)
	return true
end

function GenWizard(who)
	local GenFile=Import("autocode/gen/wiz/gen_wiz.lua")
	GenFile.DoGen(who)
	return true
end


function GenBuff(who)
	local File = "autocode/gen/buff/gen_buff_data.lua"
	GenNormal(who, File)
end


function GenEnYiData(who)
	local FileList  = {"autocode/gen/enyi/gen_enyi_data.lua", "autocode/gen/enyi/gen_enyi_name.lua", "autocode/gen/enyi/gen_enyi_qa.lua"}
	for _, File in pairs(FileList) do
		GenNormal(who, File)
	end
end


function GenItem(who)
	
	local GenFile=Import("autocode/gen/item/gen_item_data.lua")
	GenFile.DoGen(who)
	
--	local GenFile=Import("autocode/gen/item/gen_item.lua")
	local GenFile=Import("autocode/gen/item/gen_item_new.lua")
	GenFile.DoGen(who)
	
	
	local GenFile=Import("autocode/gen/item/gen_item_prop.lua")
	GenFile.DoGen(who)
	
	return true
end

--�̳�����
function GenShopData(who)
	local GenFile=Import("autocode/gen/trade/gen_shop_data.lua")
	GenFile.DoGen(who)
end

function GenPartyBonus(who)
	local GenFile=Import("autocode/gen/partybonus/gen_corp_host.lua")
	GenFile.DoGen(who)
end 

function GenRidefashion(who)
	local GenFile=Import("autocode/gen/ridefashion/gen_ridefashion.lua")
	GenFile.DoGen(who)
end

function GenBranchTask(who)
	GenNormal(who, "autocode/gen/task/branch_task/gen_branch_task_data.lua")
end

function GenFuBen(who)
	local FileList = {"autocode/gen/fuben/gen_fuben_task_data.lua", "autocode/gen/fuben/gen_fuben_data.lua"} 
	for _, File in pairs(FileList) do
		GenNormal(who, File)
	end
end


function GenGridCost(who)
	local GenFile = Import("autocode/gen/item/gen_grid_cost.lua")
	GenFile.DoGen(who)
end

function GenAll(who)
		for key,func in pairs(Actions) do
			if key ~= "help" and key ~= "genall" and key ~= "martial_all" and key ~= "reward" and key ~= "reward2" then
				GenAutoCode(who,key)
			end
		end
end

function GenItemXlProp(who)
	local GenFile = Import("autocode/gen/item/gen_item_xl_prop.lua")
	GenFile.DoGen(who)
end

function GenItemXlUpgrade(who)
	local GenFile = Import("autocode/gen/item/gen_item_xl_upgrade.lua")
	GenFile.DoGen(who)
end


function GenJiBu(who)
	local GenFile = Import("autocode/gen/jibu/gen_jibu_data.lua")
	GenFile.DoGen(who)
end

function GenItemValue(who)
	local GenFile = Import("autocode/gen/item/gen_item_value.lua")
	GenFile.DoGen(who)
end

function GenItemStreng(who)
	local GenFile = Import("autocode/gen/item/gen_item_streng.lua")
	GenFile.DoGen(who)
	local GenFile = Import("autocode/gen/item/gen_item_streng_move.lua")
	GenFile.DoGen(who)
end

function GenVip(who)
	local GenFile = Import("autocode/gen/vip/gen_vip.lua")
	GenFile.DoGen(who)
end 

function GenGiftBox(who)
	local GenFile = Import("autocode/gen/giftbox/gen_giftbox_data.lua")
	GenFile.DoGen(who)
end

function GenVipShop(who)
	local GenFile = Import("autocode/gen/vip/gen_vip_shop.lua")
	GenFile.DoGen(who)
end

function GenActivity(who)
	local GenFile = Import("autocode/gen/activity/gen_activity.lua")
	GenFile.DoGen(who)
end 

function GenItemKindProp(who)
	local GenFile = Import("autocode/gen/item/gen_item_kind_prop.lua")
	GenFile.DoGen(who)
end


function GenOrg(who)
	local GenFile = Import("autocode/gen/org/gen_org_data.lua")
	GenFile.DoGen(who)
end

function GenLeague(who)
	local GenFile = Import("autocode/gen/league/gen_league_data.lua")
	GenFile.DoGen(who)
end

--add by ����
--���ɲر�ͼ
function GenCangBaoDat(who)
	local GenFile=Import("autocode/gen/cangbao/gen_cang_bao_data.lua")
	GenFile.DoGen(who)
	return true
end

--���ɶԴ���
function GenDuilianDat(who)
	local GenFile=Import("autocode/gen/duilian/gen_duilian_data.lua")
	GenFile.DoGen(who)
	return true
end

--�������а�
function GenRankListDat(who)
	local GenFile=Import("autocode/gen/ranklist/gen_ranklist_data.lua")
	GenFile.DoGen(who)
	return true
end

--����ͬ����ļ
function GenBuyPartnerDat(who)
	local GenFile=Import("autocode/gen/buypartner/gen_buypartner_data.lua")
	GenFile.DoGen(who)
	return true
end

--���ɼ���Ӣ��
function GenYingLieDat(who)
	local GenFile=Import("autocode/gen/yinglie/gen_yinglie_data.lua")
	GenFile.DoGen(who)
	return true
end

--��������
function GenMountsDat(who)
	local GenFile=Import("autocode/gen/mounts/gen_mounts_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenLoginReward(who)
	local GenFile=Import("autocode/gen/loginreward/gen_loginreward_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenUserName(who)
	local GenFile=Import("autocode/gen/user/gen_user_name.lua")
	GenFile.DoGen(who)
	return true
end

function GenXiaZhiLu(who)
	local GenFile=Import("autocode/gen/xiazhilu/gen_xiazhilu_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenEveryday(who)
	local GenFile=Import("autocode/gen/everyday/gen_everyday_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenMingYang(who)
	local GenFile=Import("autocode/gen/mingyang/gen_mingyang_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenEffect(who)
	local GenFile=Import("autocode/gen/effect/gen_effect_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenSaima(who)
	local GenFile=Import("autocode/gen/saima/gen_saima_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenSihai(who)
	local GenFile=Import("autocode/gen/sihai/gen_sihai_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenGradeReward(who)
	local GenFile=Import("autocode/gen/gradereward/gen_gradereward_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenJishou(who)
	local GenFile=Import("autocode/gen/jishou/gen_jishou_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenLeaTask(who)
	local GenFile=Import("autocode/gen/leatask/gen_leatask_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenPata(who)
	local GenFile=Import("autocode/gen/pata/gen_pata_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenOrgFuben(who)
	local GenFile=Import("autocode/gen/orgfuben/gen_orgfuben_data.lua")
	GenFile.DoGen(who)
	return true
end

function GenQA(who)
	local GenFile=Import("autocode/gen/qa/gen_qa_data.lua")
	GenFile.DoGen(who)
end

function GenChongzhiRoll(who)
	local GenFile=Import("autocode/gen/chongzhiroll/gen_chongzhiroll_data.lua")
	GenFile.DoGen(who)
end
---------����

--���ɳɾ�����
function GenAchieve(who)
	local GenFile=Import("autocode/gen/achieve/gen_achieve.lua")
	GenFile.DoGen(who)
	return true
end

--���ɳƺ�����
function GenTitle(who)
	local GenFile=Import("autocode/gen/title/gen_title.lua")
	GenFile.DoGen(who)
	return true
end

function GenForbitLogin(who)
	local GenFile = Import("autocode/gen/forbitlogin/gen_forbitlogin.lua")
	GenFile.DoGen(who)
end

function GenItemTzProp(who)
	local GenFile = Import("autocode/gen/item/gen_item_tz_prop.lua")
	GenFile.DoGen(who)
end

function GenSuitUpgrade(who)
	local GenFile = Import("autocode/gen/item/gen_suit_upgrade.lua")
	GenFile.DoGen(who)
end

function GenGemData(who)
	local GenFile = Import("autocode/gen/gem/gen_gem_data.lua")
	GenFile.DoGen(who)
end


function GenEquipEff(who)
	local GenFile = Import("autocode/gen/item/gen_equip_eff.lua")
	GenFile.DoGen(who)
end

function GenItemUpgrade(who)
	local GenFile = Import("autocode/gen/item/gen_item_upgrade.lua")
	GenFile.DoGen(who)
end

function GenTimeControl(who)
	local GenFile = Import("autocode/gen/timecontrol/gen_time_control.lua")
	GenFile.DoGen(who)
end

function GenSkillZizhi(who)
	local GenFile = Import("autocode/gen/skill/gen_skill_zizhi.lua")
	GenFile.DoGen(who)
end

function GenCarryData(who)
	local GenFile = Import("autocode/gen/trade/gen_carry_data.lua")
	GenFile.DoGen(who)
end

function GenBroadcast(who)
	local GenFile = Import("autocode/gen/broadcast/gen_broadcast.lua")
	GenFile.DoGen(who)
end

function GenMingWang(who)
	local GenFile = Import("autocode/gen/trade/gen_mingwang_data.lua")
	GenFile.DoGen(who)
end

function GenShengWang(who)
	local GenFile = Import("autocode/gen/trade/gen_shengwang_data.lua")
	GenFile.DoGen(who)
end

function GenShouXi(who)
	local GenFile = Import("autocode/gen/shouxi/gen_shouxi_data.lua")
	GenFile.DoGen(who)
end

function GenUnionBattle(who)
	local GenFile = Import("autocode/gen/unionbattle/gen_unionbattle.lua")
	GenFile.DoGen(who)
end 

function GenKey(who)
	local GenFile = Import("autocode/gen/key/gen_key.lua")
	GenFile.DoGen(who)
end

function GenJHTitle(who)
	local GenFile = Import("autocode/gen/jhtitle/gen_jhtitle_data.lua")
	GenFile.DoGen(who)
end

function GenSignin(who)
	local GenFile = Import("autocode/gen/signin/gen_signin.lua")
	GenFile.DoGen(who)
end

function GenTreasure(who)
	local GenFile = Import("autocode/gen/treasure/gen_treasure.lua")
	GenFile.DoGen(who)
end

function GenNewactivity(who)
	local GenFile = Import("autocode/gen/newactivity/gen_newactivity.lua")
	GenFile.DoGen(who)
end

function GenMountsSkin(who)
	local GenFile = Import("autocode/gen/mounts/gen_mounts_skin.lua")
	GenFile.DoGen(who)
end

function GenMergeBonus(who)
	local GenFile = Import("autocode/gen/merge/gen_merge.lua")
	GenFile.DoGen(who)
end

function GenFieldBoss(who)
	local GenFile = Import("autocode/gen/fieldboss/gen_fieldboss.lua")
	GenFile.DoGen(who)
end


function GenDanji(who)
	local GenFile=Import("autocode/gen/danji/gen_danji.lua")
	GenFile.DoGen(who)
	return true
end 

function GenLeagueLunch(who)
	local GenFile = Import("autocode/gen/league/gen_league_npc_data.lua")
	GenFile.DoGen(who)
end

function GenLeaguereward(who)
	local GenFile = Import("autocode/gen/league/gen_league_reward.lua")
	GenFile.DoGen(who)
end

function GenOrgBuilding(who)
	local GenFile = Import("autocode/gen/org/gen_org_building.lua")
	GenFile.DoGen(who)
end

function GenOrgTask(who)
    local GenFile = Import("autocode/gen/org/gen_org_task.lua")
    GenFile.DoGen(who)
end

function GenOrgTalk(who)
    local GenFile = Import("autocode/gen/org/gen_org_talk.lua")
    GenFile.DoGen(who)
end

function GenBobin(who)
	local GenFile = Import("autocode/gen/bobin/gen_bobin.lua")
	GenFile.DoGen(who)
end

function GenZhongQiulData(who)
	local GenFile = Import("autocode/gen/zhongqiu/gen_zhongqiu_data.lua")
	GenFile.DoGen(who)
	return true
end 

function GenActiveDegree(who)
	local GenFile = Import("autocode/gen/activedegree/gen_activedegree.lua")
	GenFile.DoGen(who)
	return true
end

function GenOrgSnatch(who)
	local GenFile = Import("autocode/gen/orgsnatch/gen_orgsnatch.lua")
	GenFile.DoGen(who)
	return true
end

function GenLeagueFight(who)
    local GenFile = Import("autocode/gen/leaguefight/gen_league_fight.lua")
    GenFile.DoGen(who)
    return true
end

function GenPayRule(who)
	local GenFile = Import("autocode/gen/pay/gen_pay_rule.lua")
	GenFile.DoGen(who)
	return true
end

--��̨��Ӫ�����  by���
function GenpartybaseData(who)
	local GenFile = Import("autocode/gen/partybase/gen_partybase_data.lua")
	GenFile.DoGen(who)
end

--�ۼƳ�ֵ����� by���
function GenP1001Data(who)
	local GenFile = Import("autocode/gen/partybase/p1001/gen_p1001_data.lua")
	GenFile.DoGen(who)
end

--ÿ�����߻���� by�ǻ�
function GenP1002Data(who)
	local GenFile = Import("autocode/gen/partybase/p1002/gen_p1002_data.lua")
	GenFile.DoGen(who)
end

--������Ӫ����� by�ǻ�
function GenP1003Data(who)
	local GenFile = Import("autocode/gen/partybase/p1003/gen_p1003_data.lua")
	GenFile.DoGen(who)
end

--ͬ����Ӫ����� by���
function GenP1004Data(who)
	local GenFile = Import("autocode/gen/partybase/p1004/gen_p1004_data.lua")
	GenFile.DoGen(who)
end

--���ʳ�ֵ����� by���
function GenP1005Data(who)
	local GenFile = Import("autocode/gen/partybase/p1005/gen_p1005_data.lua")
	GenFile.DoGen(who)
end

--��ʱ�̳ǻ���� by���
function GenP1006Data(who)
	local GenFile = Import("autocode/gen/partybase/p1006/gen_p1006_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ����������  �ǻ�
function GenP1007Data(who)
	local GenFile = Import("autocode/gen/partybase/p1007/gen_p1007_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ���ϡ����ʯ  �ǻ�
function GenP1008Data(who)
	local GenFile = Import("autocode/gen/partybase/p1008/gen_p1008_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ����ۼ�����  �ǻ�
function GenP1009Data(who)
	local GenFile = Import("autocode/gen/partybase/p1009/gen_p1009_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ�����������  �ǻ�
function GenP1010Data(who)
	local GenFile = Import("autocode/gen/partybase/p1010/gen_p1010_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ����Ϸ�� ���ְ� by���
function GenP1011Data(who)
	local GenFile = Import("autocode/gen/partybase/p1011/gen_p1011_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ����Ϸ�� Ӣ���� by���
function GenP1012Data(who)
	local GenFile = Import("autocode/gen/partybase/p1012/gen_p1012_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ����Ϸ�� Я�ִ��չ� by���
function GenP1013Data(who)
	local GenFile = Import("autocode/gen/partybase/p1013/gen_p1013_data.lua")
	GenFile.DoGen(who)
end

--��Ӫ������˻ by���
function GenP1014Data(who)
	local GenFile = Import("autocode/gen/partybase/p1014/gen_p1014_data.lua")
	GenFile.DoGen(who)
end
-- ��Ӫ���ͬ����ļ� by fj
function GenP1015Data(who)
	local GenFile = Import("autocode/gen/partybase/p1015/gen_p1015_data.lua")
	GenFile.DoGen(who)
end
-- ��Ӫ���װ��ǿ��� by fj
function GenP1016Data(who)
	local GenFile = Import("autocode/gen/partybase/p1016/gen_p1016_data.lua")
	GenFile.DoGen(who)
end
-- ��Ӫ������������ by fj
function GenP1017Data(who)
	local GenFile = Import("autocode/gen/partybase/p1017/gen_p1017_data.lua")
	GenFile.DoGen(who)
end
-- ��Ӫ���ͬ�龳������ by fj
function Genp1018Data(who)
	local GenFile = Import("autocode/gen/partybase/p1018/gen_p1018_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ�����ֵ���� by fj
function GenP1019Data(who)
	local GenFile = Import("autocode/gen/partybase/p1019/gen_p1019_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ������� add by fj
function GenP1020Data(who)
	local GenFile = Import("autocode/gen/partybase/p1020/gen_p1020_data.lua")
	GenFile.DoGen(who)
end
function GenP1021Data(who)
	local GenFile = Import("autocode/gen/partybase/p1021/gen_p1021_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ�: add by fj
function GenP1022Data(who)
	local GenFile = Import("autocode/gen/partybase/p1022/gen_p1022_data.lua")
	GenFile.DoGen(who)
end
-- ��Ӫ�: add by fj
function GenP1023Data(who)
	local GenFile = Import("autocode/gen/partybase/p1023/gen_p1023_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ����ռ��ֽ��� add by fj
function GenP1025Data(who)
	local GenFile = Import("autocode/gen/partybase/p1025/gen_p1025_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ������ add by fj
function GenP1026Data(who)
	local GenFile = Import("autocode/gen/partybase/p1026/gen_p1026_data.lua")
	GenFile.DoGen(who)
end
--��Ӫ������ add by fj
function GenP1028Data(who)
	local GenFile = Import("autocode/gen/partybase/p1028/gen_p1028_data.lua")
	GenFile.DoGen(who)
end
--�����
function GenUnifyAct(who)
	local GenFile = Import("autocode/gen/unifyact/gen_unifyact.lua")
	GenFile.DoGen(who)    
end
function GenOrgWallFight(who)
    local GenFile = Import("autocode/gen/orgwallfight/gen_orgwallfight.lua")
    GenFile.DoGen(who)
    return true
end
--��Ӫ�����ʯ��Ӯ��
function GenP1030Data(who)
	local GenFile = Import("autocode/gen/partybase/p1030/gen_p1030_data.lua")
	GenFile.DoGen(who)
end

function GenAllParty(who)
	GenP1001Data(who)
	GenP1002Data(who)
	GenP1003Data(who)
	GenP1004Data(who)
	GenP1005Data(who)
	GenP1006Data(who)
	GenP1007Data(who)
	GenP1008Data(who)
	GenP1009Data(who)
	GenP1010Data(who)
	GenP1011Data(who)
	GenP1012Data(who)
	GenP1013Data(who)
	GenP1014Data(who)
	GenP1015Data(who)
	GenP1016Data(who)
	GenP1017Data(who)
	Genp1018Data(who)
	GenP1019Data(who)
	GenP1020Data(who)
	GenP1021Data(who)
	GenP1022Data(who)
	GenP1023Data(who)
	GenP1025Data(who)
	GenP1026Data(who)
	GenP1028Data(who)
	GenP1030Data(who)
end

function GenFanhuanData(who)
	local GenFile = Import("autocode/gen/fanhuan/gen_fanhuan.lua")
	GenFile.DoGen(who)
end 

function GenTrainData(who)
	local GenFile = Import("autocode/gen/user/gen_user_train.lua")
	GenFile.DoGen(who)
end

--���ս����
function GenServerBattle(who)
	local GenFile = Import("autocode/gen/serverbattle/gen_serverbattle.lua")
	--GenFile.DoGen(who)
	local GenFile = Import("autocode/gen/serverbattle/gen_battleshop.lua")
	GenFile.DoGen(who)
	local GenFile = Import("autocode/gen/serverbattle/gen_battlebonus.lua")
	GenFile.DoGen(who)
end

--����ϵͳ
function GenMagicSys(who)
    local GenFile = Import("autocode/gen/magicsys/gen_exclusive_props.lua")
    GenFile.DoGen(who)
    local GenFile = Import("autocode/gen/magicsys/gen_stone.lua")
    GenFile.DoGen(who)
end

function GenZhuanShu(who)
	local GenFile = Import("autocode/gen/zhuanshu/gen_zhuanshu.lua")
	GenFile.DoGen(who)
end


function GenRewardRoll(who)
	local GenFile = Import("autocode/gen/reward/gen_reward_roll.lua")
	GenFile.DoGen(who)
end

function GenChatTitle(who)
	local GenFile = Import("autocode/gen/chattitle/gen_chat_title.lua")
	GenFile.DoGen(who)    
end

function GenChuangguan(who)
	local GenFile = Import("autocode/gen/chuangguan/gen_chuangguan.lua")
	GenFile.DoGen(who)    
end 

function GenFuncMgr(who)
    local GenFile = Import("autocode/gen/funcmgr/gen_func_mgr.lua")
    GenFile.DoGen(who)
end

--������ʾ by���
function GenNewBieData(who)
	local GenFile = Import("autocode/gen/newbie/gen_newbie_data.lua")
	GenFile.DoGen(who)
end

--���鶯���ű�  by���
function GenanimscriptData(who)
	local GenFile = Import("autocode/gen/animscript/gen_animscript_data.lua")
	GenFile.DoGen(who)
end

--��������
function GenMysBusinessData(who)
	local GenFile = Import("autocode/gen/mysbusiness/gen_mysbusiness.lua")
	GenFile.DoGen(who)
end

function GetEsotericaData(who)
	local GenFile = Import("autocode/gen/esoterica/gen_esoterica_data.lua")
	GenFile.DoGen(who)
end

function GenMailData(who)
	local GenFile = Import("autocode/gen/mail/gen_mail_data.lua")
	GenFile.DoGen(who)
end

----Function 02/06/13 By Xxy----------------------------------
-- ս����ʾ
function GenFightTips(who)
	local GenFile = Import("autocode/gen/fighttips/gen_fighttips.lua")
	GenFile.DoGen(who)
end

--�����ӿ�
Actions = 
{ 
	help = "help",
	genall = GenAll,
	
	--scene_data = GenSceneData, --���ɳ��������볡���ļ�
	--scene_area = GenAreaData,  --���ɳ�������
	--scene_tele = GenTele,      --������ת��
	--scene_npc  = GenSceneNpc,  --���ɳ���NPC
	scene_all  = GenAllScene,  --�������г����������
	npc_data = GenNpcDat,      --����NPC���ݱ���NPC�ļ�
	equip_eff = GenEquipEff,   --
	
	--add by ����
	cangbao_data = GenCangBaoDat, --���ɲر�ͼ�������
	duilian_data = GenDuilianDat, --���ɶԴ����������
	ranklist = GenRankListDat,    --�������а���������
	buypartner = GenBuyPartnerDat,--����ͬ����ļ����
	yinglie = GenYingLieDat,	  --���ɼ���Ӣ������
	mounts = GenMountsDat,		  --������������
	loginreward = GenLoginReward, --����ÿ�յ�½
	username = GenUserName,		  --�����������
	xiazhilu = GenXiaZhiLu,		  --������֮·
	everyday = GenEveryday,		  --����ÿ���Ƽ�
	mingyang = GenMingYang, 	  --������������
	effect = GenEffect,			  --����������Ч
	saima = GenSaima,			  --�����������
	sihai = GenSihai,			  --�����ĺ�����
	gradereward = GenGradeReward, --���ɹ��ܿ���Ԥ��
	jishou = GenJishou,			  --���ɼ�����
	leatask = GenLeaTask,		  --�����˻�����
	pata = GenPata,				  --��������
	orgfuben = GenOrgFuben,		  --�����ɸ���
	qa = GenQA,					  --������������
	chongzhiroll = GenChongzhiRoll, --���ɳ�ֵ����
	---------����
	
	--fight_npc_data = GenFightNpcDat,      --����ս��NPC���ݱ�
	lineup = GenLineUpData,
	language = GenLanguageData,
	exp_data = GenExpData,		--���ɾ����
	--talk_data = GenTalkData,	--�����л���
	--equip_data = GenEquipData,	--����װ������
	--buff_data = GenBuffData,	--����Buff�����
	hero_data = GenHeroData,	--���ɽ�ɫ��ʼ������
	--lineup_pos = GenLineUpPosData, --ս����λ��
	--martial_data = GenMartialData, --������ѧ���Ա�
	trunk_task_data = GenTrunkTaskData,  	--������������
	partner_data = GenPartnerData,		--����ͬ�����ݱ�
	
	--item_file = GenItemFile,  --��Ʒ�ļ�����
	--item_data = GenItemData,  --��Ʒ����
	--goblin_data = GenGoblinData,  --Ұ������ݱ�

	family_data = GenFamilyData,  --��������

	--potential_data = GenPotentialData,  --�������������ʶ�Ӧ����
	martial_all = GenMartialAll,	--������ѧ���ݱ�����ʽ�ļ�
	--acc_data = GenAccPasswd,		--�����˺������,���ڲ���
	sell_data = GenSellData,--��������NPC����������
	yun_biao_data = GenYunBiaoData, --������������
	--bonus_data = GenBonusData,--���ɽ�������
	faq_data = GenFaqData, --����ʮ�����
	reward= GenReward,--���ɽ���������
	reward2 = GenReward2,
	item_merge= GenItemMerge,--���ɽ���������
	guide = GenGuideData,--����ָ������
	battle = GenBattleData ,--NPCս����������
	dynamic_npc = GenDynamicNpcData, --��̬ս��NPC��������
	worldboss = GenWorldBossData,--����Boss����
	martyr = GenMartyr,--����Ӣ���淨����
	xinmo = GenXinMoData,--��ħ����
	aidata = GenAIData,--AI����
	item = GenItem,--Item��������
	item_prop = GenItemProp,--item prop����
	taolin = GenTaolin, --���ָ�������
	shengxiao = GenShengxiao, --��Ф����
	wiz = GenWizard, --������ʦȨ��
	buff = GenBuff, --����BUFF����
	wulin = GenWulinData, --��������
	enyi = GenEnYiData, --����������
	shop = GenShopData,--�̳�����
	--skilldata = GenSkillData, --��ʽ����
	--skillbuff = GenSkillBuff, --��ʽBUFF
	--partybonus = GenPartyBonus, --���ɼ�����
	branch_task = GenBranchTask, --����֧������
	gridcost = GenGridCost, --���ɸ�����չ����
	fuben = GenFuBen, --���ɸ�������
	itemxlprop = GenItemXlProp, --������Ʒϴ�����Ա�
	itemxlupgrade = GenItemXlUpgrade, --������Ʒϴ����
	jibu = GenJiBu, --���ɼ������������
	itemvalue = GenItemValue, --����װ�����ֱ�
	itemstreng = GenItemStreng, --����ǿ��ת�Ʊ�
	vip = GenVip,
	giftbox = GenGiftBox, --���ɱ���
	vipshop = GenVipShop,	--vip��Ʒ
	activity = GenActivity, --���ɻ����
	itemkindprop = GenItemKindProp,	--������Ʒ�������Ա�
	org = GenOrg,	--��������
	league = GenLeague, --�˻�����
	achieve = GenAchieve, --���ɳɾ�����
	title = GenTitle, --���ɳƺ�����
	forbitlogin = GenForbitLogin, --��ֹ��¼
	itemtzprop = GenItemTzProp, --��װ����
	suitupgrade = GenSuitUpgrade, --��װ����
	gem = GenGemData, --��ʯ
	itemupgrade = GenItemUpgrade, --װ������
	timecontrol = GenTimeControl, --�ʱ����Ʊ�
	skillzizhi = GenSkillZizhi,	--��ѧ���ʱ�
	carryshop = GenCarryData, --�����̵�
	broadcast = GenBroadcast, --������Ϣ����
	mingwang = GenMingWang, --����
	shengwang = GenShengWang, --����
	shouxi = GenShouXi, --��ϯ����
	unionbattle = GenUnionBattle,	--�ݺ�
	key = GenKey,
	jhtitle = GenJHTitle, --��������
	treasure = GenTreasure, --�۱���
	signin = GenSignin, --ÿ��ǩ��
	newactivity = GenNewactivity, --7�¿����
	mountsskin = GenMountsSkin, --���ﻻ��
	mergeserver = GenMergeBonus, --�Ϸ�����
	danji = GenDanji,
	fieldboss = GenFieldBoss,   --Ұ��boss
	leaguelunch = GenLeagueLunch, --�˻����
	leaguereward = GenLeaguereward, --���罱��
	orgbuilding = GenOrgBuilding, --���ɽ���
	orgtask = GenOrgTask, --��������
	orgtalk = GenOrgTalk, --��������Ի�
	bobin = GenBobin, --�����
	zhongqiu = GenZhongQiulData, --��������
	
	activedegree = GenActiveDegree,
	orgsnatch = GenOrgSnatch, --����֮������
	leaguefight = GenLeagueFight, --��ս
	pay = GenPayRule, --�۷ѱ��
	partybase = GenpartybaseData,  --	��̨��Ӫ�����
	allparty = GenAllParty,
	fanhuan = GenFanhuanData, --����Ԫ��

	user_train = GenTrainData, --��ɫ����
	serverbattle = GenServerBattle, --���ս����

	zhuanshu = GenZhuanShu,
	rewardroll = GenRewardRoll,

	magicsys = GenMagicSys, --����ϵͳ
    unifyact = GenUnifyAct, --�����
    chattitle = GenChatTitle, --�������
    chuangguan = GenChuangguan, --���ظ���
    funcmgr = GenFuncMgr,   --����ܿ���
  
    newbie = GenNewBieData, --������ʾ
    animscript = GenanimscriptData, --���鶯���ű�����
    mysbusiness = GenMysBusinessData, --��������
    
    esoterica = GetEsotericaData,		--�������̼�������
    ridefashion = GenRidefashion , 		--��������Ƥ����ʱװ���ƺ���ؾ�̬����
    orgwallfight = GenOrgWallFight,     --���ɳ�ǽս
    fighttips = GenFightTips,			--ս����ʾ
    mail = GenMailData,				--�ʼ���� by���
}

local ActionKeys = table.keys(Actions)
table.sort(ActionKeys)
local USAGE = "Usage List:\n\t\t\t"..table.concat(ActionKeys, "\n\t\t\t")..'\n'

function GenAutoCode(who,s)
	if s == "help" then
		TellUser(who,USAGE)
		return
	end
	local File = Actions[s]
	if not File then
		TellUser(who,USAGE)
		return
	end
	if type(File) == 'function' then
		TellUser(who,string.format("Generating %s Start...",s))
		File(who,s)
		TellUser(who,string.format("Generating %s End...",s))
		return
	end
end

function MainGen(who,arg)
	local p = arg or "help"
	GenAutoCode(who,p)
end
