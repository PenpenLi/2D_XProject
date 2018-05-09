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
		[1] = { -3.176, 19.76, 11.912 }, 
		[2] = { -22.4, 7.43, 28.82 }, 
		[3] = { -25.08, -2.13, 2.85 }, 
		[4] = { -43.5, -1.873, 14.5 },
	},

	------------------------------
	--@ 对应目标点的起始垂直速度
	------------------------------
	["startVertSpeed"] = 
	{
		[1] = 6,
		[2] = 6,
		[3] = 6,
		[4] = 12,
	},

	-----------------------------------------------------------------
	--@ 对应目标点的垂直方向加速度(小于0或者等于0则默认为重力加速度)
	-----------------------------------------------------------------
	["vertAccSpeed"] = 
	{
		[1] = 18,
		[2] = 18,
		[3] = 18,
		[4] = 14,
	},

	-----------------------------------------------------------------
	--@ 跳跃使用动作, 1-jump01, 2-jump02, 3-jump03
	-----------------------------------------------------------------
	["action"] = 
	{
		[1] = 1,
		[2] = 3,
		[3] = 3,
		[4] = 2,
	},
}

return data