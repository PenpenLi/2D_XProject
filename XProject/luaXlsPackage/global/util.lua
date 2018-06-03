--$Id: util.lua 65945 2008-12-15 06:26:49Z tony $--__auto_local__start--
local string=string
local table=table
local math=math
local io=io
local pairs=pairs
local ipairs=ipairs
local tostring=tostring
--__auto_local__end--


--����һ������ģ��ĺ���
function RunFun(Obj, Fun, arg)
	if type(Obj) == "string" then
		local TmpModule = Import(Obj)
		if not TmpModule then
			return nil
		end
		--print(Obj, Fun,TmpModule,arg)
		local Args = unpack(arg)
		if type(Fun) == "string" then 
			local RealFun = TmpModule[Fun]
			if RealFun then
				return RealFun(Args)
			else
				return nil
			end
		--ֱ��ע��һ��function���ܻᵼ�²������߸���
		elseif type(Fun) == "function" then
			return Fun(unpack(arg))
		end
	elseif type(Obj) == "table" then
		if type(Fun) == "function" then
			return Fun(Obj, unpack(arg))
		else
			return Obj[Fun](Obj, unpack(arg))
		end
	else return nil
	end
end


function _Serialize(Object)
	local function ConvSimpleType(v)
		if type(v)=="string" then
			return string.format("%q",v)
		end
		return tostring(v)
	end

	local function RealFun(Object, Depth)
		--TODO: gxzou ѭ������û�д���
		Depth = Depth or 0
		Depth = Depth + 1
		assert(Depth<20, "too long Depth to serialize")

		if type(Object) == 'table' then
			--if Object.__ClassType then return "<Object>" end
			local Ret = {}
			table.insert(Ret,'{')
			for k, v in pairs(Object) do
				--print ("serialize:", k, v)
				local _k = ConvSimpleType(k)
				if _k == nil then
					error("key type error: "..type(k))
				end
				table.insert(Ret,'[' .. _k .. ']')
				table.insert(Ret,'=')
				table.insert(Ret,RealFun(v, Depth))
				table.insert(Ret,',')
			end
			table.insert(Ret,'}')
			return table.concat(Ret)
		else
			return ConvSimpleType(Object)
		end
	end
	
	return RealFun(Object)
end

Serialize = _Serialize
if engine then
	Serialize = engine.Serialize
end

--Data�����л�������(�ַ���)
function UnSerialize(Data)
	return assert(loadstring("return "..Data))()
end

--����һ��TableΪֻ��
--Sample: Wizard = ReadOnly{"gm001","gm002","gm003"}
function ReadOnly(t)
	local proxy = {}
	local mt = {       -- create metatable
		__index = t,
		__newindex = function (t,k,v)
			error("attempt to update a read-only table", 2)
		end
	}
	setmetatable(proxy, mt)
	return proxy
end

function Copy(src, rel)
	local rel = rel or {}
	if type(src) ~= "table" then
		return rel
	end
	for k, v in pairs(src) do
		rel[k] = v
	end
	return rel
end

function ArrayCopy(src)
	local ret = {}
	if type(src) ~= "table" then
		return ret
	end
	for k, v in ipairs(src) do
		ret[k] = v
	end
	return ret
end

function DeepCopy(src, quiet)
	if type(src) ~= "table" then
		return src
	end
	local cache = {}
	local function clone_table(t, level)
		if not level then
			level = 0
		end

		if level > 20 then
			if not quiet then
				error("table clone failed, "..
						"source table is too deep!")
			else
				return t
			end
		end

		local k, v
		local rel = {}
		for k, v in pairs(t) do
			--if k == "Name" then print(k, tostring(v)) end
			if type(v) == "table" then
				if cache[v] then
					rel[k] = cache[v]
				else
					rel[k] = clone_table(v, level+1)
					cache[v] = rel[k]
				end
			else
				rel[k] = v
			end
		end
		setmetatable(rel, getmetatable(t))
		return rel
	end
	return clone_table(src)
end


--touchһ���ļ����������û�����·�������Զ�����
function Touch(PathFile)
	if posix.stat(PathFile) then
		return
	end

	local Start = 1
	while 1 do
		local TmpStart, TmpEnd = string.find(PathFile, "%/", Start)
		if TmpStart and TmpEnd then
			local Path = string.sub(PathFile, 1, TmpEnd)
			if not posix.stat(Path) then
				posix.mkdir(Path)
			end
			Start = TmpEnd+1
		else
			break
		end
	end
	if not posix.stat(PathFile) then
		local fh = io.open(PathFile, "a+")
		fh:close()
	end
end

--�����binary�Ľṹ
BinPath = "../binary/"
function DumpFile(PathFile, ToPathFile)
	local s1 = posix.stat(PathFile)
	local s2 = posix.stat(ToPathFile)
	if s1 and s2 then
		if s2.mtime >= s1.mtime then
			return 
		end
	end
	print("compiling ", PathFile)

	local fh = io.open(PathFile)
	
	local FileData = fh:read("*a")
	
	--������Ҫ
	--FileData = string.gsub(FileData, '([%(%s%,])__FILE__', 
	--	'%1"'..PathFile..'"')

	local func, err = loadstring(FileData, PathFile)
	assert(func, err)
	
	if not ToPathFile then
		ToPathFile = BinPath..PathFile
	end
	
	--��ʱ���ø���
	--ToPathFile = string.gsub(ToPathFile, "%.[%w_-]+$", ".bin")
	Touch(ToPathFile)
	local Handler = io.open(ToPathFile,"w+")
	if not Handler then
		print("no such file", ToPathFile)
		return
	end
	Handler:write(string.dump(func))	
	Handler:close()	
	fh:close()
end

function CopyFile(PathFile, ToPathFile)
	--os.execute(string.format('cp %s %s',PathFile,ToPathFile))	
	os.execute(string.format('copy %s %s',PathFile,ToPathFile))	
end

function DumpPath(Path, ToPath)
	if not ToPath then
		ToPath = BinPath
	end
	--print("Dumping path from "..Path.." to "..ToPath)
	--ǿ������topath
	os.execute(string.format("rm -rf %s/*", ToPath))
	posix.mkdir(ToPath)
	for file in posix.files(Path) do
		if file ~= "." and file ~= ".." and file ~=".svn" and file ~="autocode" and file ~= "data" and file ~= "log" and file ~= "tools" and file ~= "xlsdata" then
			local PathFile = Path.."/"..file
			local ToPathFile = ToPath.."/"..file
			local filetype = posix.stat(PathFile).type

			if filetype == "directory" then
				DumpPath(PathFile, ToPathFile)
			
			--�ļ�����
			elseif filetype == "regular" then
				if string.endswith(PathFile, ".lua") then
					DumpFile(PathFile, ToPathFile)
				--Э���ļ�
				elseif string.endswith(PathFile, ".proto") then
					--DumpFile(PathFile, ToPathFile)
				elseif string.endswith(PathFile, ".conf") then
					--nothing
				elseif string.endswith(PathFile, ".as") then
				elseif string.endswith(PathFile, ".xls") then
					--nothing
				else --�������͵��ļ�ֱ��copy��ȥ
					CopyFile(PathFile, ToPathFile)
				end
			else
				print("filetype:"..filetype..",filename:"..PathFile )
			end
		end
	end
end

-- �ڳ�������չ��ΪEndSwith���ļ�
function ListTree( Path, EndSwith, Exclude )
	assert(Path)

	local Res = {}
	local ExcludeDirs = { ".", "..", ".svn", }
	array.merge( ExcludeDirs, Exclude or {} )

	for file in posix.files(Path) do
		if not table.member_key( ExcludeDirs, file ) then
			local PathFile 
			if not string.endswith(Path, "/") then
				PathFile = Path.."/"..file
			else
				PathFile = Path..file
			end	
			local filetype = posix.stat(PathFile).type

			if filetype == "directory" then
				for k, v in pairs(ListTree(PathFile, EndSwith, Exclude)) do
					table.insert( Res, v )
				end

			elseif filetype == "regular" then
				if string.endswith(PathFile, EndSwith) then
					if string.beginswith( PathFile, "./" ) then
						PathFile = string.sub( PathFile, 3 )
					end
					table.insert( Res, PathFile )
				end
			end	
		end	
	end		

	return Res
end

-- should only use in initializing phase
-- such as ciritcal error happen when loading network protocol 
function Exit (Code)
end

-- group object o and function f together to make functor
function Functor (o, f)
	local o = o or {}
	local mt = getmetatable(o) or {}	
	mt.__call = f or print 
	setmetatable (o, mt) 
	return o 
end

-- note: i do not check validity of input arguments, 
-- do it yourself before you call the following function. 

-- get element count of table
function Getn (t) 
	local n = 0
	for _, _ in pairs(t) do
		n = n + 1
	end
	return  n
end

-- copy and transform
function TranCopy (t, f)
	local o = {} 
	for k, v in pairs(t) do
		o[k] = f (k, v)
	end
	return o
end
-- modify the table elements
function Transform (t, f)
	for k, v in pairs(t) do
		t[k] = f (k, v)
	end
	return t 
end

function ForPair (t, f)
	local f = f or print 
	for i, v in pairs(t) do
		f (i, v)
	end
end

function ForKey (t, f)
	local f = f or print 
	for i in pairs (t) do
		f (i)
	end 
end

function ForValue (t, f)
	local f = f or print 
	for _, v in pairs (t) do
		f (v)
	end 
end

function FindAnyValue (t, f)
	local f = f or print
	for _, v in pairs (t) do
		if f(v) then return v end
	end
end

-- return the hast-table
function FiltT (t, f)
	local r = {} 
	for i, v in pairs (t) do
		if f(i, v) then r[i] = v end
	end
	return r
end

-- return the array
-- conver the hash-table to array if argumen f is nil
function FiltA (t, f)
	local r = {} 
	local f = f or function (i, v) return true end 
	for i, v in pairs (t) do
		if f(i, v) then 
			table.insert (r, v)
		end
	end
	return r
end

function Map (t, f) 
	local r, x = {}, nil
	for _, v in pairs (t) do
		x = f(v)
		if x then table.insert (r, x) end
	end
	return r 
end

-- function : Assign
-- ��Sour�г�Ա��ֵ��ֵ��Dest����Ӧ��Ա
function Assign( Dest, Sour, Recurse, Clear )
	assert( type(Dest) == "table" and type(Sour) == "table" )

	if Sour == nil then
		Sour = Dest
		Dest = {}
	end

	if Clear then
		for k, v in pairs(Dest) do
			Dest[k] = nil
		end
	end

	Visited = {}
	
	local function _Helper( Dest, Sour, Visited )
		for k, v in pairs( Sour ) do			
			if type(v) == "table" then
				if Recurse then
					local WasVisited = false
					for _, t in ipairs(Visited) do
						if t == v then
							WasVisited = true
							break
						end
					end

					if not WasVisited then
						Dest[k] = Dest[k] or {}
						table.insert(Visited,v)
						_Helper( Dest[k], v, Visited )
					end
				end
			else
				Dest[k] = v
			end
		end
	end

	_Helper( Dest, Sour, Visited )
end

--�Ƚ�x1 �� x2 ��� ʱ�䵥λUnit(�죬���ڵ�)��������������
--������Ϊ��׼

--����time���ص���UTC�������������Ƿ������õ���CST��ʱ�䣬
--CST��UTC��8��Сʱ�����ǣ�Ҫ�Ƚ�������
--1, ���ʹ��date��ȡ��ͳһUTC������������Ҫ����������һ������������������
--2,����ƽ��������
--
--��������֮��������,����������
function DiffDay (sec1, sec2 )
	sec2 = sec2 or os.time()
	local Day1 = TIME.GetRelaDayNo(sec1)
	local Day2 = TIME.GetRelaDayNo(sec2)
	return math.abs(Day1 - Day2)
end

---���ַ�������ʾ�ͱȽ�ʱ��. Ϊ���˵ķ���.
--ע��:���Ƚ�ʱ���ǰ��ʱ, ������ʹ��һ�����бȽ�: < <= > >=
--����Ҫ������������,��Ҫ�Ȱ��ַ���ʱ��ת��Ϊ����ʱ��.
--��ʽΪ  :  %Y-%m-%d %H:%M:%S
--ʱ��Ϊ��
function Time(time)
	return os.date ("%Y-%m-%d %H:%M:%S", time)
end
--ʱ��ȡ������
function MinuteTime (time)
	return os.date ("%Y-%m-%d %H:%M", time)
end
--ʱ��ȡ����Сʱ
function HourTime (time)
	return os.date ("%Y-%m-%d %H", time)
end
--ʱ��ȡ������
function DayTime (time)
	return os.date ("%Y-%m-%d", time)
end

function StrToDigit (strftime)
end

-- input {{"1","һ",}, {"2","��"}, {"3","��"}}
-- output example as "һ2��"
-- ��Ϻ���
function Comb(src)
	local function concat(a, b)
		local tbl = {}
		for _,v1 in pairs(a) do
			for _,v2 in pairs(b) do
				table.insert(tbl, string.format("%s%s", v1,v2))
			end
		end
		return tbl
	end
        local tbl = src[1]
        for k=2,#src do
                tbl = concat(tbl, src[k])
        end
        return tbl
end



local function Sort (x, y)
	if x <= y then return x, y else return y, x end
end

function InRectangle (x0, y0, x1, y1, x2, y2)
	x1, x2 = Sort (x1, x2)
	y1, y2 = Sort (y1, y2)
	
	return x1 <= x0 and x0 <= x2 and y1 <= y0 and y0 <= y2
end 


-- is Seta subset of Setb ?
function IsArraySubSet (Seta, Setb)
	for _, v in pairs (Seta) do
		if not table.member_key(Setb, v) then
			return false
		end
	end
	return true
end

function ArrayFiltoutAny (Seta, Setb)
	for _, v in pairs (Seta) do
		if not table.member_key(Setb, v) then
			return v
		end
	end
	return nil
end

--�����ɵ����ݲ��뵽 "autogen-bein" �� "autogen-end" ֮��
function AutoGenSave (File, Data)
	local function Repl (Begin, End) 
		return Begin..Data..End
	end

	local Content 
	local rf = io.open (File, "r")
	if rf then -- File exists
		Content = rf:read ("*a")
		rf:close ()
	end

	if Content then
		-- see lua reference about string.gsub 
		--If repl is a string, then its value is used for replacement. 
		-- The character % works as an escape character.
		-- the statement below will discard the "%"
		--Data, sub = string.gsub (Content, "(%-%-autogen%-begin).-(%-%-autogen%-end)", "%1"..Data.."%2")

		local sub
		Data, sub = string.gsub (Content, "(%-%-autogen%-begin).-(%-%-autogen%-end)", Repl)
		--assert (sub == 1, "must insert into the file:"..File)
		if sub == 0 then
			Log ("Warning:", File.." has exists and has not autogen-region. just skip it.")
		end
	else -- File does not exist
		Data = "--autogen-begin"..Data.."--autogen-end"
	end
	
	local File  = assert(io.open (File, "w"))
	File:write (Data)
	File:flush ()
	File:close ()
end


--�ļ���ʽת��������ϵͳ��iconv����������
function ToUtf8File(FileName,encoding)
	local fromEncoding = encoding or "CP936"
	local utf8file = FileName .. ".utf8"
	
	local obj=io.popen("cd")  --������ڽ���ģʽ�£�ǰ��������local 
	local path=obj:read("*all"):sub(1,-2)    --path��ŵ�ǰ·��
	obj:close()   --�ص����
	
	local iconvstr = string.format("%s/base/iconv -f %s -t UTF-8 %s > %s" ,path, fromEncoding,FileName,utf8file)
	local Ret = os.execute(iconvstr)  --����ļ��Ѿ���utf8��ʽ�ˣ���ôת����ʧ�ܣ�utf8file�Ͳ�������
	
	os.remove(FileName)
	os.rename(utf8file, FileName)
	
	--CopyFile(utf8file,FileName)
	--os.remove(utf8file)
	
	--D:/shouyou/els_package/base/iconv.exe -f CP936 -t UTF-8 battle_shop_data.lua -o battle_shop_data.lua
	--if posix.stat(utf8file) and Ret == 0 then
	--	CopyFile(utf8file,FileName)
	--end
	--if posix.stat(utf8file) then
	--	os.execute("rm ".." "..utf8file)
	--end
end


function IsSameDay(Time1, Time2)
	local RelaDayNo1 = TIME.GetRelaDayNo(Time1)
	local RelaDayNo2 = TIME.GetRelaDayNo(Time2)
	return RelaDayNo1 == RelaDayNo2
end

