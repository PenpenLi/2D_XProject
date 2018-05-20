mMAX_NUMBER = 2000000000 --protobuff int32 �����
mSTRINGTYPE = type("string")	--�ַ�������
mNUMBERTYPE = type(1)			--��������
mTABLETYPE =  type({})			--��������
mFUNCTYPE = type(function() end)

---------------------------------------------------------------------------------------------
--ְҵ����
PROFESSION_SWORD = 1	--��
PROFESSION_LANCE = 2	--ǹ
PROFESSION_THORN = 3	--��

--��������
ITEM_TYPE_NORMAL = 1		--��Ʒ
ITEM_TYPE_EQUIP  = 2		--װ��

--����������
ITEM_NORMAL_OTHER 		= 99	--������Ʒ
ITEM_NORMAL_RECOVER		= 1		--�ָ���

---װ������
EP_NULL			=	0		--δװ��
EP_WEAPON		=	1		--����
EP_RING			=   2		--��ָ
EP_NECKLACE		=	3		--����
EP_HEAD			=	4		--ͷ��
EP_ARMOR		=   5		--����
EP_SHOULDER		=	6		--����
EP_BELT			=	7		--����
EP_SHOES		=	8		--Ь��
EP_TALISMAN		=	9		--����
EP_MEDAL		=	10		--ѫ��
EP_FASHION		=	11		--ʱװ
EP_WEDRING		=	12		--���

--���߰�
mUNBIND = 0	--δ��
mBINDED = 1	--�Ѱ�
--�������ͱ��
mNORMAL_FRAME 		= 1		--����
mMAJOREQUIP_FRAME	= 2		--����װ��

--�����
QUESTION_ANSWER_YES		= 1		--ͬ��
QUESTION_ANSWER_NO		= 2		--�ܾ�
QUESTION_ANSWER_CANCEL  = 3		--ȡ��

--����Ի�������
QUESTION_TYPE_NORMAL    = 100 		--��ͨ������

--NPC�Ի��ش�ť����
NPCTALK_BTN_TYPE0 = 0				--û��ȷ��,û��ȡ��
NPCTALK_BTN_TYPE1 = 1				--��ȷ��,û��ȡ��
NPCTALK_BTN_TYPE2 = 2				--û��ȷ��,��ȡ��
NPCTALK_BTN_TYPE3 = 3				--��ȷ��,��ȡ��
NPCTALK_BTN_TYPE4 = 4				--��һ���Ի�
--NPC�Ի��ش�����
NPCTALK_ANS_TYPE0 = 0				--��
NPCTALK_ANS_TYPE1 = 1				--��
NPCTALK_ANS_TYPE2 = 2				--��һ���Ի�
NPCTALK_ANS_TYPE3 = 3				--���õ�
NPCTALK_ANS_TYPE4 = 4				--���õ�
NPCTALK_ANS_TYPE5 = 5				--���õ�

--������ǩ
REWARD_TAG_CASH = "cash"				--����
REWARD_TAG_EXP = "exp"					--��ɫ����
REWARD_TAG_EXP_PARTNER = "exp_partner"	--��Ӿ���
REWARD_TAG_ITEM = "item"				--����
REWARD_TAG_PARTNER = "partner"			--���
REWARD_TAG_VIGOR = "vigor"				--����
REWARD_TAG_PHYSICAL = "physical"		--����
REWARD_TAG_BINDYUANBAO = "bindyuanbao"	--��Ԫ��
REWARD_TAG_YUANBAO = "yuanbao"			--Ԫ��

REWARD_TAG_TBL = {
	[REWARD_TAG_CASH] = mNUMBERTYPE,
	[REWARD_TAG_EXP] = mNUMBERTYPE,
	[REWARD_TAG_EXP_PARTNER] = mNUMBERTYPE,
	[REWARD_TAG_ITEM] = mTABLETYPE,
	[REWARD_TAG_PARTNER] = mTABLETYPE,
	[REWARD_TAG_VIGOR] = mNUMBERTYPE,
	[REWARD_TAG_PHYSICAL] = mNUMBERTYPE,
	[REWARD_TAG_BINDYUANBAO] = mNUMBERTYPE,
	[REWARD_TAG_YUANBAO] = mNUMBERTYPE,
}

----------------------------����ϵͳ-------------------------
--��ҷ�����Ϣ�����
WORLD_CHANNEL 		= 	1		--����
CLUB_CHANNEL		= 	2		--����
TEAM_CHANNEL 		= 	3		--���
PRIVATE_CHANNEL		=	4		--˽��
AREA_CHANNEL		=	5		--����
CAMP_CHANNEL		=	8		--��Ӫ
ALL_CHANNEL			=	9		--�ۺ�

--ϵͳ������Ϣ�����
SYS_ROLL 				= 1			--ϵͳ�㲥����������ƣ�
SYS_PROMT_BOX 			= 2			--��ʾ��Ϣ����������,����(UserObj:Notify(msg))��
SYS_DIALOG 				= 3			--��Ϣ��,��Ҫȷ����ʧ
SYS_SYSTEM				= 4			--ϵͳ��Ϣ
SYS_NOTICE 				= 5			--������Ϣ
SYS_NOTICE_SPEC			= 6			--����ϵͳ��Ϣ(��������Ϣ��ʾ, �����������)

LOG_ITEM_TBL = {
    [mNORMAL_FRAME] 	= "item_logchange",
    [mMAJOREQUIP_FRAME] = "item_logchange",
}

--��ͼ״̬:
S_MAP_NOT 	= 1					--���ڵ�ͼ
S_MAP_ADD	= 2					--�ڽ���
S_MAP_IN	= 3					--�ڵ�ͼ
S_MAP_LEAVE	= 4					--���뿪��ͼ

--Ĭ�ϵ�ͼ
MAP_START = 1001				--���ִ�
MAP_NORMAL = 1001				--Ĭ�ϵ�ͼ
CONVEY_DOOR_DIS = 10			--�����Ŵ�������

--��npc�Ի���xy����
NPCTALK_DISTANCE = 5		

HEARTBEAT_SOCKET = 5		--�ͻ�������ʱ��

--�������� ��������
SKILL_TYPE_ACTIVE = 1
SKILL_TYPE_PASSIVE = 2

---------------�����ֶ�
IS_RELOGIN = "relogin"

---------------��������
ATTACK_TYPE_PHYSICAL 	= 1		--����
ATTACK_TYPE_MAGIC		= 2		--ħ��

--------------�ʼ�����
MAIL_KIND_SYSTEM = 1	--ϵͳ
MAIL_KIND_USER   = 2	--���

--------------�ʼ������Ƿ�ɾ��
READ_DEL	=	1				--�����ɾ
READ_UN_DEL =	0				--����ɾ

----------------boss����
BOSS_TYPE_WORLD 		= 1			--����boss
BOSS_TYPE_BOX			= 2			--����

----------------npcĬ��Ѳ�߷�Χ
NPC_PATROLRANGE = 5

----------------��ת��������
CHANGE_MAP_TYPE_FLY 	= 1			--��Ь
CHANGE_MAP_TYPE_CONVEY	= 2			--���͵�

----------------װ��Ʒ����ɫ
ITEM_COLOR_GREEN 	= 1				--һ����װ(��Ͷ��)
ITEM_COLOR_BLUE		= 2				--������װ
ITEM_COLOR_PURPLE 	= 3				--������װ
ITEM_COLOR_GOLD 	= 4				--�Ľ׽�װ(��Ͷ��)
ITEM_COLOR_ORANGE 	= 5				--��׳�װ	

----------------��ͼ����
SCENE_TYPE = {				-- ע��: loadnmesh.lua��Ϊpreload��Ҫ�ȴ�http���ؼ���, ����û���õ���ֱ��ʹ��2���жϿͻ��˸���
	CITY = 1,						-- �����ೡ��
	CLIENT_FUBEN = 2,				-- �ͻ��˸���
	SERVER_FUBEN = 3,				-- ����˸���
}
