PLAYER_TYPE 		= 1
NPC_TYPE 			= 2
ITEM_TYPE 			= 3
PARTNER_TYPE		= 4		

CHANGE_MAPPOS_ADD	= 1			--�����ͼ
CHANGE_MAPPOS_MOVE	= 2			--�ƶ�
CHANGE_MAPPOS_LEAVE = 3			--�뿪��ͼ

BATTLE_CAMP_1 = 1				--������Ӫ
BATTLE_CAMP_2 = 2				--������Ӫ

NORMAL_SLOPE 		= 0.8
NORMAL_NPC_RADIUS 	= 10			--��ͨnpc��Ұ
CAN_ATTACK_RADIUS 	= 12			--���ܱ�8��,��Ϊһ�����ӵĿ����С��8									ע�⣬��ҹ�����ʱ����Ҫ�ж�

CHAR_TYPE_TBL = {
	[PLAYER_TYPE] = true,
	[NPC_TYPE] = true,
	[ITEM_TYPE] = true,
	[PARTNER_TYPE] = true,
}

--          ^ +y
-- 6  	    5          4
--          |
--          |            +x
---7-------------------3-->
--		  	|           
--		  	|
-- 8	    1          2
MOVE_DIR = {
	{0,-1},			--1
	{1,-1},			--2
	{1,0},			--3
	{1,1},			--4
	{0,1},			--5
	{-1,1},			--6
	{-1,0},			--7
	{-1,-1},		--8
}

MOVE_ADJUST = {			--Ŀ��pos-��ǰpos
	[1] = {
		[1] = {MOVE_DIR[8], MOVE_DIR[1], MOVE_DIR[7], MOVE_DIR[2], MOVE_DIR[6], MOVE_DIR[3], MOVE_DIR[5], MOVE_DIR[4]},
		[0] = {MOVE_DIR[7], MOVE_DIR[8], MOVE_DIR[6], MOVE_DIR[1], MOVE_DIR[5], MOVE_DIR[2], MOVE_DIR[4], MOVE_DIR[3]},
		[-1] = {MOVE_DIR[6], MOVE_DIR[7], MOVE_DIR[5], MOVE_DIR[8], MOVE_DIR[4], MOVE_DIR[1], MOVE_DIR[3], MOVE_DIR[2]},
	},
	[0] = {
		[1] = {MOVE_DIR[1], MOVE_DIR[2], MOVE_DIR[8], MOVE_DIR[3], MOVE_DIR[7], MOVE_DIR[4], MOVE_DIR[6], MOVE_DIR[5]},
		[-1] = {MOVE_DIR[5], MOVE_DIR[6], MOVE_DIR[4], MOVE_DIR[3], MOVE_DIR[7], MOVE_DIR[2], MOVE_DIR[8], MOVE_DIR[1]},
	},
	[-1] = {
		[1] = {MOVE_DIR[2], MOVE_DIR[3], MOVE_DIR[1], MOVE_DIR[4], MOVE_DIR[8], MOVE_DIR[5], MOVE_DIR[7], MOVE_DIR[6]},
		[0] = {MOVE_DIR[3], MOVE_DIR[4], MOVE_DIR[2], MOVE_DIR[5], MOVE_DIR[1], MOVE_DIR[6], MOVE_DIR[8], MOVE_DIR[7]},
		[-1] = {MOVE_DIR[4], MOVE_DIR[5], MOVE_DIR[3], MOVE_DIR[2], MOVE_DIR[6], MOVE_DIR[1], MOVE_DIR[7], MOVE_DIR[8]},
	}
}

Z_ACCURATE = 0.11				--z�ᾫȷ��

--��ͼ����
MAP_FIGNT = 1

---------------------------��������
DIE_WORLDBOSS = 1;
DIE_RANDOMBOSS = 2;

---------------------------��������
RELIVE_WORLDBOSS = 1;
RELIVE_RANDOMBOSS = 2;
RELIVE_FORBIDDENPVE = 3;

ACTIVE_NPC = 1

-------------------------------------------------------------ai----------------------------------------------------------------------
--radical2_2 = 0.7			--����2/2
c_nBlockCnt = 1
c_nBlockMaxCnt = 3
c_nHaltCnt = 40				--׷�����ڱ�׷�����Աߵ�ͣ������c_nHaltCnt���ƶ�һ��
c_nSleepCnt = 3				--npc��Χ�ߵ�ֹͣ����

--AI,EVENT״̬--
AI_CONTINUE 		= 1
AI_NEXT 			= 2
AI_EXCEPTION 		= 3
AI_CANCELTARGET		= 4
AI_NULL 			= 5

EVENT_BEATTACK		= 1					--������
EVENT_TOATTACK		= 2					--ָʹ׷����(�������)����

AI_WALK_TIME 		= 30
AI_ATTACK_TIME 		= 36
AI_DESTROY_TIME 	= 30

SPEED_SLOW			= 3.5
SPEED_NORMAL		= 7
SPEED_FAST			= 14

SPEED_TIME = {
	[SPEED_SLOW] = 4,
	[SPEED_NORMAL] = 2,
	[SPEED_FAST] = 1,
}

DISTANCE_ADJUST_SPEED = {
	[1] = function(speed)
		return speed / 1.4
	end,
	[2] = function(speed)
		return speed
	end,
	[4] = function(speed)
		return speed / 1.4
	end,
	[5] = function(speed)
		return speed / 1.4
	end,
	[8] = function(speed)
		return (speed / 1.4 + speed) / 2
	end,
}

--��ͼ����״̬
DIE_STATE_GHOST = 1				--����Ϊ����״̬

--ս���Զ���״̬
AUTOFIGHT_TYPE_NORMAL = 0		--�ֶ�����
AUTOFIGHT_TYPE_ATTACK = 1		--�Զ�����
AUTOFIGHT_TYPE_SKILL = 2		--�Զ�����

-------------------------------------------------------------ս������------------------------------------------------------
FIGHT_SHOW_HP 		= "ShowHp"
FIGHT_SHOW_ADDBUFF 	= "ShowABuff"

SKILL_ALL_COOLTIME = 0.3						--����

--�˺�����
HURT_TYPE_00 	= 0 	--��ͨ�˺�
HURT_TYPE_01	= 1		--�����˺�
HURT_TYPE_02	= 2		--�Ƹ��˺�
HURT_TYPE_03	= 3		--�����Ƹ��˺�
HURT_TYPE_04	= 4		--miss
HURT_TYPE_05 	= 5		--�޵�
HURT_TYPE_06	= 6		--�ǹ������ܼ�Ѫ
HURT_TYPE_07	= 7		--���buff
HURT_TYPE_08	= 8		--����
HURT_TYPE_09	= 9		--buff�Ӽ�Ѫ
HURT_TYPE_10	= 10	--������Ѫ
HURT_TYPE_11	= 11	--�����˺�
HURT_TYPE_12	= 12	--�����޵��˺�
HURT_TYPE_13	= 13	--����Ѫ��

--ս��ָ��
FIGHT_PHYSIC_ATTACK 	= 1 	--������
FIGHT_MAGIC_ATTACK 		= 2 	--��������

SKILL_MTYPE_NORMAL = 1			--��ͨ
SKILL_MTYPE_MAGIC = 2			--����
SKILL_MTYPE_HETIJI = 3			--���弼

SKILL_TYPE_INITIATIVE = 1		--��������
SKILL_TYPE_PASSIVE = 2			--��������

PANELSKILL_TYPE_INITIATIVE 	= 1	--��������
PANELSKILL_TYPE_ARTIFACT 	= 2	--��������
PANELSKILL_TYPE_ANGER 		= 3	--ŭ������
PANELSKILL_TYPE_FLY			= 4	--�Ṧ����
PANELSKILL_TYPE_PASSIVE		= 5	--��������
PANELSKILL_TYPE_OTHPASSIVE	= 6 --������������

BUFF_DIZZINESS 		= 7			--ѣ��
BUFF_BIND			= 8			--����
BUFF_FREEZE			= 9			--����
BUFF_PETRIFACTION	= 10		--ʯ��
BUFF_INVINCIBLE		= 11		--�޵�
BUFF_IMM_CONTROL	= 12		--���߿�����
BUFF_IMM_DEBUFF		= 13		--����debuff��
BUFF_IMM_CONTROL2	= 40000501	--���߿�����
BUFF_IMM_DEBUFF2	= 40000511	--����debuff��

BUFF_TYPE1 = 1					--������
BUFF_TYPE2 = 2					--����
BUFF_TYPE3 = 3					--����
BUFF_TYPE4 = 4					--����
BUFF_TYPE5 = 5					--��ս������
BUFF_TYPE6 = 6					--����
BUFF_TYPE7 = 7					--�޵�
BUFF_TYPE8 = 8					--����buff
BUFF_TYPE9 = 9					--����buff
BUFF_TYPE10 = 10				--�������buff
BUFF_TYPE11	= 11				--����ѣ��buff

BUFF_SUBTYPE1 = 1				-- �������е�ѣ����buff

SP_MAX = 500
COST_SP_TYPE = 1

SINGLE_TARGET_TYPE = 100			--���幥��
MULTI_TARGET_TYPE = 101				--���幥��

SKILL_SHAPE_LINE = 1				--���ܹ�����Χ����
SKILL_SHAPE_CIRCLE = 2				--���ܹ�����Χ��Բ
SKILL_SHAPE_SECTOR = 3				--���ܹ�����Χ������
SKILL_SHAPE_ALL = 4					--����������������Ӻ����,�����npc��������npc
SKILL_ATTAREA_MAX = 30				--��󹥻���Χ�뾶Ϊ20

FIGHT_EFF_NAME 		= "feff"				--ս����ʱ����
FIGHT_STILLEFF_NAME = "fseff"				--ս����ʱ��������

--��������
CMD_DO 			= "cmd_do"
CMD_DO_HIT		= "cmd_do_hit"
--��������
PASS_HP			= "pass_hp"			--������hp���ڣ���ע��:�з��Ĳ��жϣ�
PASS_BATTLE		= "pass_battle"		--������ս��ģʽ
PASS_DO			= "pass_do"			--ָ��ִ�н׶�
PASS_SDO		= "pass_sdo"		--����ָ��ִ�н׶�
PASS_HIT		= "pass_hit"		--���е���ʱ
PASS_SHIT		= "pass_shit"		--�������е���ʱ(ǰһ��������ͨ�ͺ��弼��)
PASS_BEHIT		= "pass_behit"		--�ܻ�ʱ
PASS_DIE		= "pass_die"		--������ʱ��
PASS_DAPPSHIELD	= "pass_dappshield"	--������ʧʱ
OVER_PASSHIT	= "over_passhit"	--���ӱ������ܴ���
PASS_RELIVE		= "pass_relive"		--����ʱ��
PASS_ADDBUFF	= "pass_addbuff"	--���buffʱ��
CMD_FUBEN_S		= "cmd_fuben_s"		--���븱��

mFIGHT_Id 			= 	"Id"			--սʿID
mFIGHT_Grade		= 	"Grade"			--սʿ�ȼ�
mFIGHT_Name			=	"Name"			--����
mFIGHT_Ap			=	"Ap"         	--����	
mFIGHT_Dp			=	"Dp"         	--����
mFIGHT_Ma			=	"Ma"			--ħ��
mFIGHT_Mr			=	"Mr"			--ħ��
mFIGHT_Hp			=	"Hp"         	--����	
mFIGHT_HpMax		=	"HpMax"	  		--�������
mFIGHT_Speed		=	"Speed"      	--�ж��ٶ�	

mFIGHT_HitRate		=	"HitRate"    	--����	
mFIGHT_Dodge		=	"Dodge"      	--���

mFIGHT_Double		=	"Double"	    --�������� 
mFIGHT_Tenacity		=	"Tenacity"	    --�������� 
mFIGHT_Parry		=	"Parry"			--��
mFIGHT_ReParry		=	"ReParry"		--�Ƹ�

mFIGHT_HitOk		=   "HitOk"         --�ض�����
mFIGHT_AbsHurt		=	"AbsHurt"		--�����˺�
mFIGHT_SkillRate	=	"SkillRate"		--����ϵ��
mFIGHT_DoubleHurt	=	"DoubleHurt"	--�����˺�
mFIGHT_ReDoubleHurt	=	"ReDoubleHurt"	--��������
mFIGHT_Hurt			=	"Hurt"			--�˺��ӳ�
mFIGHT_ReHurt		=	"ReHurt"		--�˺�����

mFIGHT_AbsDouble	=	"AbsDouble"		--�ض�����
mFIGHT_DoubleOtherHurt = "DoubleOtherHurt"	--�����˺��������

mFIGHT_PartnerAp		=	"PartnerAp"			--��鹥��
mFIGHT_PartnerHurt		=	"PartnerHurt"		--����˺�
mFIGHT_PartnerReHurt	=	"PartnerReHurt"		--����˺�����
mFIGHT_ReSlow			=	"ReSlow"			--��������
mFIGHT_ReDizzy			=	"ReDizzy"			--ѣ������
mFIGHT_ReBleed			=	"ReBleed"			--��Ѫ����
mFIGHT_PartnerExtraHurt	=	"PartnerExtraHurt"	--�������˺�
mFIGHT_MagicAp		=	"MagicAp"		--��������
mFIGHT_MagicHurt	=	"MagicHurt"		--�����˺�


mFIGHT_MovePush				=	"MovePush"			--��
mFIGHT_MovePull				=	"MovePull"			--��
mFIGHT_AddSelfHurt			=	"AddSelfHurt"		--���������˺�
mFIGHT_AddOtherHurt 		= 	"AddOtherHurt"		--���������˺�
mFIGHT_SubSelfHurt			=	"SubSelfHurt"		--��������˺�
mFIGHT_SubOtherHurt			=	"SubOtherHurt"		--���˼����˺�
mFIGHT_ReHpRate				=	"ReHpRate"			--��Ѫ�������ӱ���Ч��
mFIGHT_ReHpValue			=	"ReHpValue"			--��Ѫ�������ֵЧ��
mFIGHT_SubReHpRate			=	"SubReHpRate"		--��Ѫ���ܼ��ٱ���Ч��
mFIGHT_SubReHpValue			=	"SubReHpValue"		--��Ѫ���ܼ���ֵЧ��
mFIGHT_BackHurtRate			=	"BackHurtRate"		--�ܵ�������x%������������
mFIGHT_DelBuffType			=	"DelBuffType"		--��ɢĳ�����͵�buff
mFIGHT_AbsorbHpRateByHurt	= 	"AbsorbHpRateByHurt"--�����˺���X%������Ѫ
mFIGHT_AbsorbHpRateByHpMax	=	"AbsorbHpRateByHpMax" --�������Ѫ����X%������Ѫ
mFIGHT_ExtraSkill			=	"ExtraSkill"		--������һ������
mFIGHT_Shield				=	"Shield"			--����
mFIGHT_WarBowman			=	"WarBowman"			--սʿ���ƹ���		��ֱ�
mFIGHT_BowmanWizard			=	"BowmanWizard"		--���ֿ��Ʒ�ʦ		��ֱ�
mFIGHT_WizardWar			=	"WizardWar"			--��ʦ����սʿ		��ֱ�
mFIGHT_AddNpcProp			=	"AddNpcProp"		--����npc����
mFIGHT_ControlCUseSkill		=	"ControlCUseSkill"	--�������Ƿ���Գ�ĳ����
mFIGHT_NotDie				=	"NotDie"			--����
mFIGHT_STILLPROPHP			=	"StillPropByHp"		--���Գ�����Ѫ��
mFIGHT_FixedShield			=	"FixedShield"		--�̶�����
mFIGHT_FixedShieldAddHurt	=	"FixedShieldAddHurt"--�̶�����ÿ�μ��˺�
mFIGHT_FixedShieldSubHurt	=	"FixedShieldSubHurt"--�̶�����ÿ�μ��˺�
mFIGHT_FrameRate			=	"FrameRate"			--�����˺�ϵ��
mFIGHT_FixedShieldHpMax		=	"FixedShieldHpMax"	--���̶��˺�
mFIGHT_FixedHpHurt			=	"FixedHpHurt"		--�̶��˺�

mFIGHT_AtkTime 				=	"AtkTime"			--����ʱ����

mFIGHT_AddSelfHurtRate		=	"AddSelfHurtRate"		--���������˺�	��ֱ�
mFIGHT_AddOtherHurtRate		= 	"AddOtherHurtRate"		--���������˺�	��ֱ�
mFIGHT_SubSelfHurtRate		=	"SubSelfHurtRate"		--��������˺�	��ֱ�
mFIGHT_SubOtherHurtRate		=	"SubOtherHurtRate"		--���˼����˺�	��ֱ�

mFIGHT_FixedAddSelfHurtRate		=	"FixedAddSelfHurtRate"		--���������˺�	��ֱ�
mFIGHT_FixedAddOtherHurtRate	= 	"FixedAddOtherHurtRate"		--���������˺�	��ֱ�
mFIGHT_FixedSubSelfHurtRate		=	"FixedSubSelfHurtRate"		--��������˺�	��ֱ�
mFIGHT_FixedSubOtherHurtRate	=	"FixedSubOtherHurtRate"		--���˼����˺�	��ֱ�

mFIGHT_ResetHpMax			=	"ResetHpMax"			--�������Ѫ��
mFIGHT_OldResetHpMax		=	"OldResetHpMax"			--�ɵ����Ѫ��

mFIGHT_ExchangeMartial		=	"ExchangeMartial"		--���ü���
mFIGHT_OldExchangeMartial	=	"OldExchangeMartial"	--�ɵļ���

mFIGHT_FixedHurtRateAvoid	=	"FixedHurtRateAvoid"	--���߹̶��˺�
mFIGHT_RoundAddBuff			=	"RoundAddBuff"			--����Χ���ͼ�buff

mFIGHT_AddBuffProp			=	"AddBuffProp"			--��buff�������

mFIGHT_NotHitOk				=   "NotHitOk"              --�ض�������

--�������Ե�����
WARRIOR_MIRROR_FRATE_NAME = {
	mFIGHT_Ap,
	mFIGHT_Dp,
	mFIGHT_Ma,
	mFIGHT_Mr,
	mFIGHT_Hp,
	mFIGHT_HpMax,
	
	mFIGHT_HitRate,
	mFIGHT_Dodge,
	
	mFIGHT_Double,
	mFIGHT_Tenacity,
	mFIGHT_Parry,
	mFIGHT_ReParry,
	
	mFIGHT_DoubleHurt,
	mFIGHT_ReDoubleHurt,
	
	mFIGHT_Hurt,
	mFIGHT_ReHurt,
	mFIGHT_AbsHurt,
}

WARRIOR_DATA_NAME = {						--ս����Ҫ������
	mFIGHT_Id,
	mFIGHT_Grade,
	mFIGHT_Name,
	mFIGHT_Ap,
	mFIGHT_Dp,
	mFIGHT_Ma,
	mFIGHT_Mr,
	mFIGHT_Hp,
	mFIGHT_HpMax,
	mFIGHT_Speed,
	
	mFIGHT_HitRate,
	mFIGHT_Dodge,
	
	mFIGHT_Double,
	mFIGHT_Tenacity,
	mFIGHT_Parry,
	mFIGHT_ReParry,
	
	mFIGHT_DoubleHurt,
	mFIGHT_ReDoubleHurt,
	
	mFIGHT_Hurt,
	mFIGHT_ReHurt,
	mFIGHT_AbsHurt,
	
	mFIGHT_AtkTime,
	
	mFIGHT_PartnerAp,
	mFIGHT_PartnerHurt,
	mFIGHT_PartnerReHurt,
	mFIGHT_ReSlow,
	mFIGHT_ReDizzy,
	mFIGHT_ReBleed,
	mFIGHT_PartnerExtraHurt,
	mFIGHT_MagicAp,
	mFIGHT_MagicHurt,
}

WARRIOR_NOTPARTNER_DATA_NAME = {
	mFIGHT_Ap,
	mFIGHT_Dp,
	mFIGHT_Ma,
	mFIGHT_Mr,
	mFIGHT_Hp,
	mFIGHT_HpMax,
	mFIGHT_Speed,
	
	mFIGHT_HitRate,
	mFIGHT_Dodge,
	
	mFIGHT_Double,
	mFIGHT_Tenacity,
	mFIGHT_Parry,
	mFIGHT_ReParry,		
	
	mFIGHT_DoubleHurt,
	mFIGHT_ReDoubleHurt,
	
	mFIGHT_Hurt,
	mFIGHT_ReHurt,
	mFIGHT_AbsHurt,
}

WARRIOR_BUFFPROP_NAME = {
	[mFIGHT_Ap] = true,
	[mFIGHT_Dp] = true,
	[mFIGHT_Ma] = true,
	[mFIGHT_Mr] = true,
	[mFIGHT_Hp] = true,
	[mFIGHT_HpMax] = true,
	[mFIGHT_Speed] = true,
	
	[mFIGHT_HitRate] = true,
	[mFIGHT_Dodge] = true,
	
	[mFIGHT_Double] = true,
	[mFIGHT_Tenacity] = true,
	[mFIGHT_Parry] = true,
	[mFIGHT_ReParry] = true,		
	
	[mFIGHT_DoubleHurt] = true,
	[mFIGHT_ReDoubleHurt] = true,
	
	[mFIGHT_Hurt] = true,
	[mFIGHT_ReHurt] = true,
	[mFIGHT_AbsHurt] = true,
	[mFIGHT_DoubleOtherHurt] = true,
	[mFIGHT_Shield] = true,
	
	[mFIGHT_AbsHurt] = true,
	[mFIGHT_DoubleHurt] = true,
	[mFIGHT_ReDoubleHurt] = true,
	[mFIGHT_Hurt] = true,
	[mFIGHT_ReHurt] = true,
	[mFIGHT_DoubleOtherHurt] = true,
}

function EliteVarFunc(grade)
	if grade <= 30 then
		return 500
	else
		return 500 + 20 * (grade - 30)
	end
end

-------------------��������߷�Χ
SHEEP_RANGE = 2
-------------------�Ƿ񿴵�����
NOT_SEE_OTHER = 1

-------------------pkģʽ
PKMODE_PEACE 		= 0		--��ƽ
PKMODE_WHOLE 		= 1		--ȫ��
PKMODE_TEAM 		= 2		--����
PKMODE_CLUB 		= 3		--����
PKMODE_EVIL 		= 4		--�ƶ�
PKMODE_SERVER 		= 5		--����
PKMODE_HOSTILECLUB	= 6		--�ж԰���

PK_MODE_CHECK = {
	[PKMODE_PEACE] = true,
	[PKMODE_WHOLE] = true,
	[PKMODE_TEAM] = true,
	[PKMODE_CLUB] = true,
	[PKMODE_EVIL] = true,
	[PKMODE_SERVER] = true,
	[PKMODE_HOSTILECLUB] = true,
}

-------------------�ƶ�״̬
EVILSTATE_WHITE 	= 0		--����
EVILSTATE_YELLOW 	= 1		--����
EVILSTATE_RED 		= 2		--����

-------------------�ƶ�ʱ��
EVIL_COOLTIME		= 300
EVIL_KILLVALUE		= 10			--��ɱһ���˵��ƶ�ֵ���Ӷ���
EVIL_BUFFID			= 100005
EVIL_BUFFID_CLIENT	= 100006
EVIL_REDVALUE		= 40
EVIL_KILLNPC_CNT	= 60

--���Ա�����
CAN_PUSH = 1

PARTNER_HITTYPE = 1
MAGIC_HITTYPE = 2

MAX_FIYTIMENO = 100
-------------------�ƶ�״̬
MOVETYPE_SPRINT	= 1		--���
MOVETYPE_FLY1	= 2		--��Ծ1
MOVETYPE_FLY2	= 3		--��Ծ2
MOVETYPE_FLY3	= 4		--ͬ��״̬
MOVETYPE_FLYF	= 5		--��Ծ����
MOVETYPE_PJUMP	= 6		--������

-------------------���س����߼��������߼���Ϣ
RETMAP_TYPE_NPCDIE_REWARD 	= 1		--npc��������
RETMAP_MARTIALEXP			= 2		--����������
RETMAP_FLYDODGE				= 3		--����ֵ
RETMAP_NOTFIGHT_BUFFHP		= 4		--Ѫ����ֵ
RETMAP_RETHP				= 5		--Ѫ��
RETMAP_TYPE_NPCDIE_TASK 	= 6		--����npc����
RETMAP_WORLDBOSS_DELBUFF	= 7		--����boss ��������
RETMAP_PKMODE_KILL			= 8 	--ս��ģʽɱ�����
RETMAP_DAZUO				= 9 	--����
RETMAP_CLUBBOSS_DELBUFF		= 10	--����boss ��������
RETMAP_SP					= 11	--����sp
RETMAP_DOUBLE_XIULIAN		= 12	--˫��
RETMAP_SHIELDBUFF			= 13	--������Ϣ
RETMAP_CLUBDIDUI			= 14 	--��ɱ�ж԰������
RETMAP_YEWAIBOSS_REWARD		= 15	--Ұ��boss����
RETMAP_YEWAIBOSS_BELONG		= 16	--Ұ��boss����
RETMAP_CLIENT_INSTATE		= 17	--�ͻ��˽����ͼ
RETMAP_SYS_TIPS				= 18	--ϵͳ�㲥
RETMAP_RELIVE				= 19	--�ͻ��˸�������
RETMAP_SHIFTDEL_TER			= 20	--�������ս��е�ӻ���
RETMAP_SHIFTDEL_SIEGE		= 21	--�������ս��е
RETMAP_WALKSHOW				= 22	--�������н����ص�
RETMAP_SYN_CAB_POS			= 23	--������λ��ͬ��
RETMAP_PLAYER_POS			= 24	--��ɫ������Ϣ
RETMAP_JIERIBOSS_DELBUFF	= 25	--����boss ��������
RETMAP_SECRETBOSS_REWARD	= 26	--�ܾ�boss����
-------------------����ֵ
MAX_FLYDODGE = 6
FLYDODGE_COOLTIME = 150
FLYDODGE_COOLTIME_CLIENT = 15

-------------------NPC�Ƿ�ɼ�
CANSEE_TYPE_CANT		= 0			--���ɼ�
CANSEE_TYPE_CAN			= 1			--�ɼ�

BUFFOVER_TYPE_NOT		= 0			--������
BUFFOVER_TYPE_BIGGERE	= 1			--���ڵ���
BUFFOVER_TYPE_BIGGER	= 2			--����

-------------------����npc�Ի���������
FUBEN_TALK_TRIGGER_HURT			= 1			--�״��ܵ��˺�
FUBEN_TALK_TRIGGER_SKILLTIPS	= 2			--����Ԥ��

-------------------��Ҿ�������----------------------
USER_MIRROR_NORMAL		= 0					--Ĭ�ϻ�����
USER_MIRROR_WULIN 		= 1					--���ֻ�����
USER_MIRROR_WALKONLY	= 2					--ֻ�߻�����

-------------------�����������----------------------
FUBEN_CHECK_VAR = {
	[mFIGHT_Ap] = 1.2,
	[mFIGHT_Dp] = 1.2,
	[mFIGHT_PartnerAp] = 1.2,
	[mFIGHT_PartnerHurt] = 1.2,
	[mFIGHT_MagicAp] = 1.2,
	[mFIGHT_MagicHurt] = 1.2,
	[mFIGHT_DoubleHurt] = 1.2,
	[mFIGHT_Hurt] = 1.2,
	[mFIGHT_Double] = 1.2,
}

------------------------3V3״̬���˱�------------------
K3V3_STATE_CONST = {
	{1,1.2,0.8},
	{0.8,1,1.2},
	{1.2,0.8,1}
}