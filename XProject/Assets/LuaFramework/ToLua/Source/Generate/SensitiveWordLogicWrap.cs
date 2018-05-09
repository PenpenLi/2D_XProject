﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class SensitiveWordLogicWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(SensitiveWordLogic), typeof(Riverlake.Singleton<SensitiveWordLogic>));
		L.RegFunction("GetInstance", GetInstance);
		L.RegFunction("filter", filter);
		L.RegFunction("RemoveSensitiveWord", RemoveSensitiveWord);
		L.RegFunction("AddSensitiveWord", AddSensitiveWord);
		L.RegFunction("isSensitive", isSensitive);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetInstance(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			SensitiveWordLogic o = SensitiveWordLogic.GetInstance();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int filter(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				SensitiveWordLogic obj = (SensitiveWordLogic)ToLua.CheckObject<SensitiveWordLogic>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				string o = obj.filter(arg0);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 3)
			{
				SensitiveWordLogic obj = (SensitiveWordLogic)ToLua.CheckObject<SensitiveWordLogic>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				string arg1 = ToLua.CheckString(L, 3);
				string o = obj.filter(arg0, arg1);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: SensitiveWordLogic.filter");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveSensitiveWord(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			SensitiveWordLogic obj = (SensitiveWordLogic)ToLua.CheckObject<SensitiveWordLogic>(L, 1);
			LuaTable arg0 = ToLua.CheckLuaTable(L, 2);
			obj.RemoveSensitiveWord(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddSensitiveWord(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			SensitiveWordLogic obj = (SensitiveWordLogic)ToLua.CheckObject<SensitiveWordLogic>(L, 1);
			LuaTable arg0 = ToLua.CheckLuaTable(L, 2);
			obj.AddSensitiveWord(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int isSensitive(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			SensitiveWordLogic obj = (SensitiveWordLogic)ToLua.CheckObject<SensitiveWordLogic>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			bool o = obj.isSensitive(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
