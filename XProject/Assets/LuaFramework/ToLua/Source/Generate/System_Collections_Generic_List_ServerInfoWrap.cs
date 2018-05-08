﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class System_Collections_Generic_List_ServerInfoWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(System.Collections.Generic.List<ServerInfo>), typeof(System.Object), "List_ServerInfo");
		L.RegFunction("Add", Add);
		L.RegFunction("AddRange", AddRange);
		L.RegFunction("AsReadOnly", AsReadOnly);
		L.RegFunction("BinarySearch", BinarySearch);
		L.RegFunction("Clear", Clear);
		L.RegFunction("Contains", Contains);
		L.RegFunction("CopyTo", CopyTo);
		L.RegFunction("Exists", Exists);
		L.RegFunction("Find", Find);
		L.RegFunction("FindAll", FindAll);
		L.RegFunction("FindIndex", FindIndex);
		L.RegFunction("FindLast", FindLast);
		L.RegFunction("FindLastIndex", FindLastIndex);
		L.RegFunction("ForEach", ForEach);
		L.RegFunction("GetEnumerator", GetEnumerator);
		L.RegFunction("GetRange", GetRange);
		L.RegFunction("IndexOf", IndexOf);
		L.RegFunction("Insert", Insert);
		L.RegFunction("InsertRange", InsertRange);
		L.RegFunction("LastIndexOf", LastIndexOf);
		L.RegFunction("Remove", Remove);
		L.RegFunction("RemoveAll", RemoveAll);
		L.RegFunction("RemoveAt", RemoveAt);
		L.RegFunction("RemoveRange", RemoveRange);
		L.RegFunction("Reverse", Reverse);
		L.RegFunction("Sort", Sort);
		L.RegFunction("ToArray", ToArray);
		L.RegFunction("TrimExcess", TrimExcess);
		L.RegFunction("TrueForAll", TrueForAll);
		L.RegFunction(".geti", get_Item);
		L.RegFunction("get_Item", get_Item);
		L.RegFunction(".seti", set_Item);
		L.RegFunction("set_Item", set_Item);
		L.RegFunction("New", _CreateSystem_Collections_Generic_List_ServerInfo);
		L.RegVar("this", _this, null);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("Capacity", get_Capacity, set_Capacity);
		L.RegVar("Count", get_Count, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateSystem_Collections_Generic_List_ServerInfo(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				System.Collections.Generic.List<ServerInfo> obj = new System.Collections.Generic.List<ServerInfo>();
				ToLua.PushSealed(L, obj);
				return 1;
			}
			else if (count == 1 && TypeChecker.CheckTypes<int>(L, 1))
			{
				int arg0 = (int)LuaDLL.lua_tonumber(L, 1);
				System.Collections.Generic.List<ServerInfo> obj = new System.Collections.Generic.List<ServerInfo>(arg0);
				ToLua.PushSealed(L, obj);
				return 1;
			}
			else if (count == 1 && TypeChecker.CheckTypes<System.Collections.Generic.IEnumerable<ServerInfo>>(L, 1))
			{
				System.Collections.Generic.IEnumerable<ServerInfo> arg0 = (System.Collections.Generic.IEnumerable<ServerInfo>)ToLua.ToObject(L, 1);
				System.Collections.Generic.List<ServerInfo> obj = new System.Collections.Generic.List<ServerInfo>(arg0);
				ToLua.PushSealed(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: System.Collections.Generic.List<ServerInfo>.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _get_this(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			ServerInfo o = obj[arg0];
			ToLua.PushObject(L, o);
			return 1;

		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _set_this(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			ServerInfo arg1 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 3);
			obj[arg0] = arg1;
			return 0;

		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _this(IntPtr L)
	{
		try
		{
			LuaDLL.lua_pushvalue(L, 1);
			LuaDLL.tolua_bindthis(L, _get_this, _set_this);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Add(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
			obj.Add(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddRange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Collections.Generic.IEnumerable<ServerInfo> arg0 = (System.Collections.Generic.IEnumerable<ServerInfo>)ToLua.CheckObject<System.Collections.Generic.IEnumerable<ServerInfo>>(L, 2);
			obj.AddRange(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AsReadOnly(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Collections.ObjectModel.ReadOnlyCollection<ServerInfo> o = obj.AsReadOnly();
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int BinarySearch(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int o = obj.BinarySearch(arg0);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				System.Collections.Generic.IComparer<ServerInfo> arg1 = (System.Collections.Generic.IComparer<ServerInfo>)ToLua.CheckObject<System.Collections.Generic.IComparer<ServerInfo>>(L, 3);
				int o = obj.BinarySearch(arg0, arg1);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 5)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				ServerInfo arg2 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 4);
				System.Collections.Generic.IComparer<ServerInfo> arg3 = (System.Collections.Generic.IComparer<ServerInfo>)ToLua.CheckObject<System.Collections.Generic.IComparer<ServerInfo>>(L, 5);
				int o = obj.BinarySearch(arg0, arg1, arg2, arg3);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.BinarySearch");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Clear(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			obj.Clear();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Contains(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
			bool o = obj.Contains(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CopyTo(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo[] arg0 = ToLua.CheckObjectArray<ServerInfo>(L, 2);
				obj.CopyTo(arg0);
				return 0;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo[] arg0 = ToLua.CheckObjectArray<ServerInfo>(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				obj.CopyTo(arg0, arg1);
				return 0;
			}
			else if (count == 5)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				ServerInfo[] arg1 = ToLua.CheckObjectArray<ServerInfo>(L, 3);
				int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
				int arg3 = (int)LuaDLL.luaL_checknumber(L, 5);
				obj.CopyTo(arg0, arg1, arg2, arg3);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.CopyTo");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Exists(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			bool o = obj.Exists(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Find(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			ServerInfo o = obj.Find(arg0);
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FindAll(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			System.Collections.Generic.List<ServerInfo> o = obj.FindAll(arg0);
			ToLua.PushSealed(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FindIndex(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
				int o = obj.FindIndex(arg0);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				System.Predicate<ServerInfo> arg1 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 3);
				int o = obj.FindIndex(arg0, arg1);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 4)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				System.Predicate<ServerInfo> arg2 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 4);
				int o = obj.FindIndex(arg0, arg1, arg2);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.FindIndex");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FindLast(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			ServerInfo o = obj.FindLast(arg0);
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FindLastIndex(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
				int o = obj.FindLastIndex(arg0);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				System.Predicate<ServerInfo> arg1 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 3);
				int o = obj.FindLastIndex(arg0, arg1);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 4)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				System.Predicate<ServerInfo> arg2 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 4);
				int o = obj.FindLastIndex(arg0, arg1, arg2);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.FindLastIndex");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ForEach(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Action<ServerInfo> arg0 = (System.Action<ServerInfo>)ToLua.CheckDelegate<System.Action<ServerInfo>>(L, 2);
			obj.ForEach(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetEnumerator(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Collections.IEnumerator o = obj.GetEnumerator();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetRange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			System.Collections.Generic.List<ServerInfo> o = obj.GetRange(arg0, arg1);
			ToLua.PushSealed(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int IndexOf(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int o = obj.IndexOf(arg0);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				int o = obj.IndexOf(arg0, arg1);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 4)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
				int o = obj.IndexOf(arg0, arg1, arg2);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.IndexOf");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Insert(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			ServerInfo arg1 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 3);
			obj.Insert(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int InsertRange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			System.Collections.Generic.IEnumerable<ServerInfo> arg1 = (System.Collections.Generic.IEnumerable<ServerInfo>)ToLua.CheckObject<System.Collections.Generic.IEnumerable<ServerInfo>>(L, 3);
			obj.InsertRange(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LastIndexOf(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int o = obj.LastIndexOf(arg0);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				int o = obj.LastIndexOf(arg0, arg1);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else if (count == 4)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
				int o = obj.LastIndexOf(arg0, arg1, arg2);
				LuaDLL.lua_pushinteger(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.LastIndexOf");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Remove(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			ServerInfo arg0 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 2);
			bool o = obj.Remove(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveAll(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			int o = obj.RemoveAll(arg0);
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveAt(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.RemoveAt(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveRange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			obj.RemoveRange(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Reverse(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				obj.Reverse();
				return 0;
			}
			else if (count == 3)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				obj.Reverse(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.Reverse");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Sort(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				obj.Sort();
				return 0;
			}
			else if (count == 2 && TypeChecker.CheckTypes<System.Comparison<ServerInfo>>(L, 2))
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				System.Comparison<ServerInfo> arg0 = (System.Comparison<ServerInfo>)ToLua.ToObject(L, 2);
				obj.Sort(arg0);
				return 0;
			}
			else if (count == 2 && TypeChecker.CheckTypes<System.Collections.Generic.IComparer<ServerInfo>>(L, 2))
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				System.Collections.Generic.IComparer<ServerInfo> arg0 = (System.Collections.Generic.IComparer<ServerInfo>)ToLua.ToObject(L, 2);
				obj.Sort(arg0);
				return 0;
			}
			else if (count == 4)
			{
				System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				System.Collections.Generic.IComparer<ServerInfo> arg2 = (System.Collections.Generic.IComparer<ServerInfo>)ToLua.CheckObject<System.Collections.Generic.IComparer<ServerInfo>>(L, 4);
				obj.Sort(arg0, arg1, arg2);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: System.Collections.Generic.List<ServerInfo>.Sort");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ToArray(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			ServerInfo[] o = obj.ToArray();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TrimExcess(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			obj.TrimExcess();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int TrueForAll(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			System.Predicate<ServerInfo> arg0 = (System.Predicate<ServerInfo>)ToLua.CheckDelegate<System.Predicate<ServerInfo>>(L, 2);
			bool o = obj.TrueForAll(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Item(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			ServerInfo o = obj[arg0];
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Item(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)ToLua.CheckObject(L, 1, typeof(System.Collections.Generic.List<ServerInfo>));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			ServerInfo arg1 = (ServerInfo)ToLua.CheckObject<ServerInfo>(L, 3);
			obj[arg0] = arg1;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Capacity(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)o;
			int ret = obj.Capacity;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Capacity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Count(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)o;
			int ret = obj.Count;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Count on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_Capacity(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			System.Collections.Generic.List<ServerInfo> obj = (System.Collections.Generic.List<ServerInfo>)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.Capacity = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index Capacity on a nil value");
		}
	}
}

