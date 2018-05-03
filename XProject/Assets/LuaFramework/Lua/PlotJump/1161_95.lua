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
		[1] = { 33.5, 1.917, -25.5 }, 
		[2] = { 17.5, 1.514, -18.5 },
		[3] = { 17.5, 4.072, -3.5 },
		[4] = { 28.5, 4.273, 10.5 },		
	},

	------------------------------
	--@ 对应目标点的起始垂直速度
	------------------------------
	["startVertSpeed"] = 
	{
		[1] = 13,
		[2] = 13,
		[3] = 15,
		[4] = 13,
	},

	-----------------------------------------------------------------
	--@ 对应目标点的垂直方向加速度(小于0或者等于0则默认为重力加速度)
	-----------------------------------------------------------------
	["vertAccSpeed"] = 
	{
		[1] = 22,
		[2] = 22,
		[3] = 20,
		[4] = 17,
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