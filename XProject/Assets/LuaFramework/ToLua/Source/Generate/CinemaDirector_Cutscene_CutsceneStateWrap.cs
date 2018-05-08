﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class CinemaDirector_Cutscene_CutsceneStateWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(CinemaDirector.Cutscene.CutsceneState));
		L.RegVar("Inactive", get_Inactive, null);
		L.RegVar("Playing", get_Playing, null);
		L.RegVar("PreviewPlaying", get_PreviewPlaying, null);
		L.RegVar("Scrubbing", get_Scrubbing, null);
		L.RegVar("Paused", get_Paused, null);
		L.RegFunction("IntToEnum", IntToEnum);
		L.EndEnum();
		TypeTraits<CinemaDirector.Cutscene.CutsceneState>.Check = CheckType;
		StackTraits<CinemaDirector.Cutscene.CutsceneState>.Push = Push;
	}

	static void Push(IntPtr L, CinemaDirector.Cutscene.CutsceneState arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(CinemaDirector.Cutscene.CutsceneState), L, pos);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Inactive(IntPtr L)
	{
		ToLua.Push(L, CinemaDirector.Cutscene.CutsceneState.Inactive);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Playing(IntPtr L)
	{
		ToLua.Push(L, CinemaDirector.Cutscene.CutsceneState.Playing);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_PreviewPlaying(IntPtr L)
	{
		ToLua.Push(L, CinemaDirector.Cutscene.CutsceneState.PreviewPlaying);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Scrubbing(IntPtr L)
	{
		ToLua.Push(L, CinemaDirector.Cutscene.CutsceneState.Scrubbing);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Paused(IntPtr L)
	{
		ToLua.Push(L, CinemaDirector.Cutscene.CutsceneState.Paused);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int IntToEnum(IntPtr L)
	{
		int arg0 = (int)LuaDLL.lua_tonumber(L, 1);
		CinemaDirector.Cutscene.CutsceneState o = (CinemaDirector.Cutscene.CutsceneState)arg0;
		ToLua.Push(L, o);
		return 1;
	}
}

