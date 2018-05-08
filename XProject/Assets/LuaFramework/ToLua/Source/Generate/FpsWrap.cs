﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FpsWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(Fps), typeof(Riverlake.Singleton<Fps>));
		L.RegFunction("Init", Init);
		L.RegFunction("TickToMilliSec", TickToMilliSec);
		L.RegFunction("StopCheckFps", StopCheckFps);
		L.RegFunction("ContinueCheckFps", ContinueCheckFps);
		L.RegFunction("StartCheckFps", StartCheckFps);
		L.RegFunction("CancelCheckFps", CancelCheckFps);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("mLastFps", get_mLastFps, set_mLastFps);
		L.RegVar("needCheckFps", get_needCheckFps, set_needCheckFps);
		L.RegVar("checkFps", get_checkFps, set_checkFps);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Init(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Fps obj = (Fps)ToLua.CheckObject<Fps>(L, 1);
			obj.Init();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TickToMilliSec(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			long arg0 = LuaDLL.tolua_checkint64(L, 1);
			long o = Fps.TickToMilliSec(arg0);
			LuaDLL.tolua_pushint64(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StopCheckFps(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Fps obj = (Fps)ToLua.CheckObject<Fps>(L, 1);
			obj.StopCheckFps();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ContinueCheckFps(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Fps obj = (Fps)ToLua.CheckObject<Fps>(L, 1);
			obj.ContinueCheckFps();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StartCheckFps(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Fps obj = (Fps)ToLua.CheckObject<Fps>(L, 1);
			obj.StartCheckFps();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CancelCheckFps(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			Fps obj = (Fps)ToLua.CheckObject<Fps>(L, 1);
			obj.CancelCheckFps();
			return 0;
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
	static int get_mLastFps(IntPtr L)
	{
		try
		{
			LuaDLL.tolua_pushint64(L, Fps.mLastFps);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_needCheckFps(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Fps obj = (Fps)o;
			bool ret = obj.needCheckFps;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index needCheckFps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_checkFps(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Fps obj = (Fps)o;
			bool ret = obj.checkFps;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index checkFps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_mLastFps(IntPtr L)
	{
		try
		{
			long arg0 = LuaDLL.tolua_checkint64(L, 2);
			Fps.mLastFps = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_needCheckFps(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Fps obj = (Fps)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.needCheckFps = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index needCheckFps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_checkFps(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			Fps obj = (Fps)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.checkFps = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index checkFps on a nil value");
		}
	}
}

