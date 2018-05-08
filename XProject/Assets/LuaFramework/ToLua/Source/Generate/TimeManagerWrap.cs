﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class TimeManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(TimeManager), typeof(Riverlake.Singleton<TimeManager>));
		L.RegFunction("SetServerTime", SetServerTime);
		L.RegFunction("FormatDateTime", FormatDateTime);
		L.RegFunction("TotalSecondsToCurrentTime", TotalSecondsToCurrentTime);
		L.RegFunction("TotalMilliSecondsToCurrentTime", TotalMilliSecondsToCurrentTime);
		L.RegFunction("TotalMilliSeconds", TotalMilliSeconds);
		L.RegFunction("GetRealTimeSinceStartUp", GetRealTimeSinceStartUp);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("instance", get_instance, null);
		L.RegVar("CurServerTime", get_CurServerTime, null);
		L.RegVar("CurServerTotalSeconds", get_CurServerTotalSeconds, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetServerTime(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			TimeManager obj = (TimeManager)ToLua.CheckObject(L, 1, typeof(TimeManager));
			string arg0 = ToLua.CheckString(L, 2);
			uint arg1 = (uint)LuaDLL.luaL_checknumber(L, 3);
			obj.SetServerTime(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FormatDateTime(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.DateTime arg0 = StackTraits<System.DateTime>.Check(L, 1);
			string arg1 = ToLua.CheckString(L, 2);
			string o = TimeManager.FormatDateTime(arg0, arg1);
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TotalSecondsToCurrentTime(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			double o = TimeManager.TotalSecondsToCurrentTime();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TotalMilliSecondsToCurrentTime(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			double o = TimeManager.TotalMilliSecondsToCurrentTime();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TotalMilliSeconds(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.DateTime arg0 = StackTraits<System.DateTime>.Check(L, 1);
			double o = TimeManager.TotalMilliSeconds(arg0);
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetRealTimeSinceStartUp(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			float o = TimeManager.GetRealTimeSinceStartUp();
			LuaDLL.lua_pushnumber(L, o);
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

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_instance(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, TimeManager.instance);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_CurServerTime(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			TimeManager obj = (TimeManager)o;
			System.DateTime ret = obj.CurServerTime;
			ToLua.PushValue(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index CurServerTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_CurServerTotalSeconds(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			TimeManager obj = (TimeManager)o;
			ulong ret = obj.CurServerTotalSeconds;
			LuaDLL.tolua_pushuint64(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index CurServerTotalSeconds on a nil value");
		}
	}
}

