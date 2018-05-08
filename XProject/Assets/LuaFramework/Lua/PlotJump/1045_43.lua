---------------------------------
--@ 剧情跳跃相关配置
--@ 注意每个table的长度都必须相同
---------------------------------

local data = 
{
	-----------------------------------------------------
	--@ 剧情跳跃需要经过的目标点(不含起始点, 包含最终点)
	-----------------------------------------------------
	["targetPosition"] = 
	{ 
		[1] = { -69.84, 46.541, 2.17 }, 
		[2] = { -42.05, 37.058, 1.25 }, 
		[3] = { -44.629, 33.57, 8.47 }, 
		[4] = { -37.5, 29.091, 8.5 }, 
	},

	------------------------------
	--@ 对应目标点的起始垂直速度
	------------------------------
	["startVertSpeed"] = 
	{
		[1] = 11,
		[2] = 12,
		[3] = 5,
		[4] = 5,
	},

	-----------------------------------------------------------------
	--@ 对应目标点的垂直方向加速度(小于0或者等于0则默认为重力加速度)
	-----------------------------------------------------------------
	["vertAccSpeed"] = 
	{
		[1] = 16,
		[2] = 14,
		[3] = 13,
		[4] = 15,
	},

	-----------------------------------------------------------------
	--@ 跳跃使用动作, 1-jump01, 2-jump02, 3-jump03
	-----------------------------------------------------------------
	["action"] = 
	{
		[1] = 1,
		[2] = 3,
		[3] = 3,
		[4] = 1,
	},
}

return data