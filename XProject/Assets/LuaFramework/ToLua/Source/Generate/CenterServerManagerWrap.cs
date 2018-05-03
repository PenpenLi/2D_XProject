﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class CenterServerManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(CenterServerManager), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("HttpRequestSync", HttpRequestSync);
		L.RegFunction("HttpRequestGet", HttpRequestGet);
		L.RegFunction("LoginRequest", LoginRequest);
		L.RegFunction("StepLogRequest", StepLogRequest);
		L.RegFunction("LoginInfoLog", LoginInfoLog);
		L.RegFunction("GetNoticeInfo", GetNoticeInfo);
		L.RegFunction("ChatMonitor", ChatMonitor);
		L.RegFunction("SetLastServer", SetLastServer);
		L.RegFunction("GetCdnData", GetCdnData);
		L.RegFunction("CreateRoleInfo", CreateRoleInfo);
		L.RegFunction("UpgradeInfo", UpgradeInfo);
		L.RegFunction("UpdateRoleInfo", UpdateRoleInfo);
		L.RegFunction("SignGM", SignGM);
		L.RegFunction("ButtonControll", ButtonControll);
		L.RegFunction("AddOrderInfo", AddOrderInfo);
		L.RegFunction("UrlEncode", UrlEncode);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Instance", get_Instance, null);
		L.RegVar("AppID", get_AppID, set_AppID);
		L.RegVar("ChannelID", get_ChannelID, set_ChannelID);
		L.RegVar("UserID", get_UserID, set_UserID);
		L.RegVar("Token", get_Token, set_Token);
		L.RegVar("ImeiOrIdfa", get_ImeiOrIdfa, null);
		L.RegVar("Method", get_Method, set_Method);
		L.RegVar("Pid", get_Pid, set_Pid);
		L.RegVar("Sign", get_Sign, null);
		L.RegVar("Checking", get_Checking, set_Checking);
		L.RegVar("Time", get_Time, set_Time);
		L.RegVar("AccountName", get_AccountName, set_AccountName);
		L.RegVar("LastServer", get_LastServer, set_LastServer);
		L.RegVar("ServerList", get_ServerList, set_ServerList);
		L.RegVar("RoleInfoList", get_RoleInfoList, set_RoleInfoList);
		L.RegVar("ShowAccount", get_ShowAccount, set_ShowAccount);
		L.RegVar("VersionView", get_VersionView, set_VersionView);
		L.RegVar("Access_token", get_Access_token, set_Access_token);
		L.RegVar("AccName", get_AccName, set_AccName);
		L.RegVar("Channel_id", get_Channel_id, set_Channel_id);
		L.RegVar("Sid", get_Sid, set_Sid);
		L.RegVar("ServerName", get_ServerName, set_ServerName);
		L.RegVar("Mac", get_Mac, set_Mac);
		L.RegVar("Version", get_Version, set_Version);
		L.RegVar("PackageUrl", get_PackageUrl, set_PackageUrl);
		L.RegVar("Ip", get_Ip, set_Ip);
		L.RegVar("GuanwangBtnState", get_GuanwangBtnState, set_GuanwangBtnState);
		L.RegVar("KefuBtnState", get_KefuBtnState, set_KefuBtnState);
		L.RegVar("IsWhite", get_IsWhite, set_IsWhite);
		L.RegVar("GameSign", get_GameSign, set_GameSign);
		L.RegVar("GameGuid", get_GameGuid, set_GameGuid);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int HttpRequestSync(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 3)
			{
				CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
				string arg0 = ToLua.CheckString(L, 2);
				string arg1 = ToLua.CheckString(L, 3);
				obj.HttpRequestSync(arg0, arg1);
				return 0;
			}
			else if (count == 4)
			{
				CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
				string arg0 = ToLua.CheckString(L, 2);
				string arg1 = ToLua.CheckString(L, 3);
				System.Action<string> arg2 = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L, 4);
				obj.HttpRequestSync(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 5)
			{
				CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
				string arg0 = ToLua.CheckString(L, 2);
				string arg1 = ToLua.CheckString(L, 3);
				System.Action<string> arg2 = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L, 4);
				int arg3 = (int)LuaDLL.luaL_checknumber(L, 5);
				obj.HttpRequestSync(arg0, arg1, arg2, arg3);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: CenterServerManager.HttpRequestSync");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int HttpRequestGet(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
				string arg0 = ToLua.CheckString(L, 2);
				obj.HttpRequestGet(arg0);
				return 0;
			}
			else if (count == 3)
			{
				CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
				string arg0 = ToLua.CheckString(L, 2);
				System.Action<string> arg1 = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L, 3);
				obj.HttpRequestGet(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: CenterServerManager.HttpRequestGet");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoginRequest(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			System.Action arg0 = (System.Action)ToLua.CheckDelegate<System.Action>(L, 2);
			obj.LoginRequest(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int StepLogRequest(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.StepLogRequest(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoginInfoLog(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			obj.LoginInfoLog(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetNoticeInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			System.Action<string> arg0 = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L, 2);
			obj.GetNoticeInfo(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ChatMonitor(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 4);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			string arg1 = ToLua.CheckString(L, 3);
			string arg2 = ToLua.CheckString(L, 4);
			obj.ChatMonitor(arg0, arg1, arg2);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetLastServer(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			obj.SetLastServer();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetCdnData(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			System.Action<string,string> arg1 = (System.Action<string,string>)ToLua.CheckDelegate<System.Action<string,string>>(L, 3);
			obj.GetCdnData(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CreateRoleInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			string arg2 = ToLua.CheckString(L, 4);
			int arg3 = (int)LuaDLL.luaL_checknumber(L, 5);
			obj.CreateRoleInfo(arg0, arg1, arg2, arg3);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UpgradeInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			obj.UpgradeInfo(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UpdateRoleInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			string arg0 = ToLua.CheckString(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
			string arg3 = ToLua.CheckString(L, 5);
			obj.UpdateRoleInfo(arg0, arg1, arg2, arg3);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SignGM(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			string arg0 = ToLua.CheckString(L, 1);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 2);
			int arg2 = (int)LuaDLL.luaL_checknumber(L, 3);
			string o = CenterServerManager.SignGM(arg0, arg1, arg2);
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ButtonControll(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			obj.ButtonControll();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddOrderInfo(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 5);
			CenterServerManager obj = (CenterServerManager)ToLua.CheckObject(L, 1, typeof(CenterServerManager));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			string arg1 = ToLua.CheckString(L, 3);
			int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
			System.Action<string> arg3 = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L, 5);
			obj.AddOrderInfo(arg0, arg1, arg2, arg3);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UrlEncode(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			string arg0 = ToLua.CheckString(L, 1);
			string o = CenterServerManager.UrlEncode(arg0);
			LuaDLL.lua_pushstring(L, o);
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
	static int get_Instance(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, CenterServerManager.Instance);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_AppID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.AppID;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AppID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ChannelID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.ChannelID;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ChannelID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_UserID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.UserID;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index UserID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Token(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Token;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Token on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ImeiOrIdfa(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.ImeiOrIdfa;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ImeiOrIdfa on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Method(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Method;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Method on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Pid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.Pid;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Pid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Sign(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Sign;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Sign on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Checking(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.Checking;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Checking on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Time(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Time;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_AccountName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.AccountName;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AccountName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_LastServer(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList ret = obj.LastServer;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index LastServer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ServerList(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList ret = obj.ServerList;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ServerList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_RoleInfoList(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList ret = obj.RoleInfoList;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index RoleInfoList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ShowAccount(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool ret = obj.ShowAccount;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ShowAccount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_VersionView(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool ret = obj.VersionView;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index VersionView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Access_token(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Access_token;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Access_token on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_AccName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.AccName;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AccName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Channel_id(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.Channel_id;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Channel_id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Sid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.Sid;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Sid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ServerName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.ServerName;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ServerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Mac(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Mac;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Mac on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Version;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_PackageUrl(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.PackageUrl;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index PackageUrl on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Ip(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.Ip;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Ip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_GuanwangBtnState(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.GuanwangBtnState;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GuanwangBtnState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_KefuBtnState(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int ret = obj.KefuBtnState;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index KefuBtnState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_IsWhite(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool ret = obj.IsWhite;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index IsWhite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_GameSign(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.GameSign;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GameSign on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_GameGuid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string ret = obj.GameGuid;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GameGuid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_AppID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.AppID = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AppID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_ChannelID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.ChannelID = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ChannelID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_UserID(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.UserID = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index UserID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Token(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Token = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Token on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Method(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Method = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Method on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Pid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Pid = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Pid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Checking(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Checking = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Checking on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Time(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Time = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_AccountName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.AccountName = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AccountName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_LastServer(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList arg0 = (System.Collections.ArrayList)ToLua.CheckObject<System.Collections.ArrayList>(L, 2);
			obj.LastServer = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index LastServer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_ServerList(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList arg0 = (System.Collections.ArrayList)ToLua.CheckObject<System.Collections.ArrayList>(L, 2);
			obj.ServerList = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ServerList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_RoleInfoList(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			System.Collections.ArrayList arg0 = (System.Collections.ArrayList)ToLua.CheckObject<System.Collections.ArrayList>(L, 2);
			obj.RoleInfoList = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index RoleInfoList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_ShowAccount(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.ShowAccount = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ShowAccount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_VersionView(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.VersionView = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index VersionView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Access_token(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Access_token = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Access_token on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_AccName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.AccName = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index AccName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Channel_id(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Channel_id = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Channel_id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Sid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Sid = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Sid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_ServerName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.ServerName = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index ServerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Mac(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Mac = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Mac on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Version = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_PackageUrl(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.PackageUrl = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index PackageUrl on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Ip(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.Ip = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Ip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_GuanwangBtnState(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.GuanwangBtnState = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GuanwangBtnState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_KefuBtnState(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.KefuBtnState = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index KefuBtnState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_IsWhite(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.IsWhite = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index IsWhite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_GameSign(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.GameSign = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GameSign on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_GameGuid(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			CenterServerManager obj = (CenterServerManager)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.GameGuid = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index GameGuid on a nil value");
		}
	}
}

