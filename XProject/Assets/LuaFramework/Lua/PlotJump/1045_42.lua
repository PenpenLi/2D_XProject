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
		[1] = { -44.629, 33.57, 8.47 }, 
		[2] = { -42.05, 37.058, 1.25 }, 
		[3] = { -69.84, 46.541, 2.17 }, 
		[4] = { -76.5, 43.998, -0.5 }, 
	},

	------------------------------
	--@ 对应目标点的起始垂直速度
	------------------------------
	["startVertSpeed"] = 
	{
		[1] = 13,
		[2] = 12,
		[3] = 30,
		[4] = 8,
	},

	-----------------------------------------------------------------
	--@ 对应目标点的垂直方向加速度(小于0或者等于0则默认为重力加速度)
	-----------------------------------------------------------------
	["vertAccSpeed"] = 
	{
		[1] = 15,
		[2] = 14,
		[3] = 27,
		[4] = 15,
	},

	-----------------------------------------------------------------
	--@ 跳跃使用动作, 1-jump01, 2-jump02, 3-jump03
	-----------------------------------------------------------------
	["action"] = 
	{
		[1] = 3,
		[2] = 2,
		[3] = 3,
		[4] = 1,
	},
}

return data