require "lfs"
dofile("autocode/gen/read_xls/xls_base.lua")
--local XLS_FILE = "D:/x6design/���ݱ�/���ݱ�-�߻�/"
--local OUT_FILE = "D:/mobileClient/tools/xlsPackage/gen/data/"		--����ļ��б������
--local CFG_PATH = "D:/mobileClient/tools/xlsPackage/gen/cfg"

local string = string
local tonumber = tonumber
local table = table
local pairs = pairs

function GetXlsInstAndData(xlsPath, sheet, beforeProcess)
	local DATA_FILE    = XLS_FILE .. xlsPath

	local VarDescNo 					= 1	--���������б��
	local VarRowNo          = 2	--�����б��
	local TypeRowNo          = 3	--�����б��
	local NullRowNo          = 4	--���б��
	local DATA_START_ROW = 5	--���ݿ�ʼ����

	--print(DATA_FILE)
	local XlsInst = clsXlsBase:New(DATA_FILE, VarRowNo, TypeRowNo, NullRowNo, VarDescNo)
	if XlsInst._XlsInst == nil then
		print("ERROR:", xlsPath, sheet)
		print( DATA_FILE)
		print("���ñ����ڻ���·���д�����cfg�����ļ��д�")
		return
	end

	XlsInst:ClearSave()

	if beforeProcess then
		beforeProcess(XlsInst)
	end

	-- ����sheetdata��ԭ������˶�������ݣ�descdata���¼�1234�е����ݣ��ṹ����
	--desedata = {
	--	["ShopPos"] = {["var"] = "ShopPos", ["type"] = "Number", ["isNull"] = true/false, ["varDesc"] = "�̵���λ",},
	--
	--}
	
	local SheetData
	local IsSheetList = false
	if type(sheet) == "string" then
		--print("-----------------")
		SheetData = XlsInst:GenDataByName(sheet,DATA_START_ROW)
	elseif type(sheet) == "number" then
		--print("=================".. sheet)
		SheetData = XlsInst:GenDataByIndex2(sheet,DATA_START_ROW)
	elseif type(sheet) == "table" then
		--print("-=-=-=-=-=-=-=-=-")
		SheetData = {}
		if #sheet == 0 then
			local sheetCnt = XlsInst:GetXlsSheetCount()
			for _sheet = 1, sheetCnt do
				SheetData[_sheet] = XlsInst:GenDataByIndex2(_sheet,DATA_START_ROW)
			end
		else
			for _,_sheet in pairs(sheet) do
				SheetData[_sheet] = XlsInst:GenDataByIndex2(_sheet,DATA_START_ROW)
			end
		end
		IsSheetList = true
	end
	
	return XlsInst, SheetData, IsSheetList
end

--����������
function DoGen(xlsPath, sheet, columns, outputName, postProcess, desc, key, beforeProcess, needJson, className)
	local OUT_FILE   = OUT_FILE .. outputName .. ".lua"
	local columnsNeed = {}
	if columns ~= nil then
		for k, v in pairs(columns) do
			columnsNeed[v] = 1
		end
	end

	local xlsData = {}
	local IsSheetList = false
	local XlsInst
	if type(xlsPath) == "string" then
		XlsInst, xlsData, IsSheetList = GetXlsInstAndData(xlsPath, sheet, beforeProcess)
	elseif type(xlsPath) == "table" then
		if type(sheet) ~= "table" then
			print("SheetList must be table!!!")
			return
		end
		
		if #sheet ~= #xlsPath then
			print("SheetList must be as long as xlsPath!!!")
			return
		end
		
		xlsData = {}
		for _index,_xlsPath in pairs(xlsPath) do
			local sheetData
			XlsInst, sheetData, IsSheetList = GetXlsInstAndData(_xlsPath, sheet[_index], beforeProcess)
			xlsData[_xlsPath] = sheetData
		end
	end
	 
	local data = {}
	if not IsSheetList then
		for rowno,rowdata in pairs(xlsData) do
			local rowdataNew
			if columns ~= nil then
				rowdataNew = {}
				for k,v in pairs(rowdata) do
					if columnsNeed[k] then
						rowdataNew[k] = v
					end
				end
			end
	
			rowdata = rowdataNew or rowdata
			data[rowno] = rowdata
		end
	else
		data = xlsData
	end
	
	if postProcess then
		print("-------", XlsInst)
		data = postProcess(data, XlsInst)
	else
		if IsSheetList then
			print("SheetList must has postProcess!!!")
			return
		end
	end
	
	local keyData = {}
	--print("----------" .. key)
	if key then
		for rowno,rowdata in pairs(data) do
			if rowdata and rowdata[key] then
				--print("----------" .. rowdata[key])
				keyData[rowdata[key]] = rowdata
			end
		end
	else
		keyData = data
	end

	if needJson then
		SaveToFileClient(XlsInst, outputName, data, className)
	end

	--XlsInst:SaveToFileClient(OUT_FILE, outputName, data)
	XlsInst:SaveData(OUT_FILE, keyData,"Data")
	--XlsInst:SaveToFile(OUT_FILE, data)
	desc = desc or outputName
	
	print(desc)
end

function SaveToFileClient(xlsInst, outputName, data, className)
	if not xlsInst then return end
	xlsInst:SaveToFileClient(OUT_CLASS_FILE .. outputName .. ".json", className, data)
end

local function file_exists(path)
	local file = io.open(path, "rb")
	if file then file:close() end
	return file ~= nil
end

--����c#��
function DoGenClass(clsName, clsProps, clsPropTypes, classPath)
	local outfile   = OUT_CLASS_FILE .. classPath .. ".cs"
	local path = string.match(outfile,".+%.cs")
	print("xxxxxx1 " .. path)
	if not path then return end 
	local PathElements = string.split(path, "/")
	PathElements[#PathElements] = nil
	local FullPath = table.concat(PathElements, "/")
	--posix.makedirs(FullPath)
	if string.len(FullPath) > 0 and not file_exists(FullPath) then
		os.execute("mkdir "..FullPath)
	end
	
	local File = (outfile == "-") and io.output() or io.output(outfile)
	
	File:write( "using UnityEngine;\n")
	
	local len = #clsPropTypes
	local needUs = false;
	for i = 1, len do
		if string.match(clsPropTypes[i], "List") then
			needUs = true
		end
	end
	
	if needUs then
		File:write( "using System.Collections.Generic;\n")
	end
	
	--File:write( "\nnamespace table\n")
	--File:write( "{\n")
	File:write( "	public class " .. clsName .. "\n")
	File:write( "	{\n")
	
	local add = ""
	for i = 1, len  do
		if clsPropTypes[i] == "string" then
			add = " = \"\""
		else
			add = ""
		end
	
		File:write( "		public " .. clsPropTypes[i] .. " ".. clsProps[i] .. add .. ";\n")
	end
	
	File:write( "\n		public " .. clsName .. "() {}\n")
	
	File:write( "	}\n")
	--File:write( "}\n")
	
	File:close()
	
	ToUtf8File(outfile)
end

--����
function eachFile( folder, filePattern, callback )
	--local lfs = require "lfs"
	for file in lfs.dir(folder) do
        if file ~= "." and file ~= ".." then				
            local f = folder..'/'..file
            local attr = lfs.attributes (f)
            --assert(type(attr) == "table")
            if( attr.mode == "directory" ) then
                eachFile(f, filePattern, callback)
            elseif( attr.mode=="file" and string.match(f, filePattern) ) then
            	print(f)
                callback(f)
            end
        end
    end
end

function doGenSingleFile(folder, filePattern, callback)
	local count = 0
	for file in lfs.dir(folder) do
        if file ~= "." and file ~= ".." then
			local f = folder..'/'..file
			local attr = lfs.attributes (f)
			if string.match(string.lower(file), string.lower(SPECIAL_XLS_NAME)) then
				if( attr.mode == "directory" ) then
					eachFile(f, filePattern, callback)
				 elseif( attr.mode=="file" and string.match(f, filePattern) ) then
					print(f)
					callback(f)
				end
				count = count + 1
			elseif attr.mode == "directory" then
				for child in lfs.dir(f) do
					if child ~= "." and child ~= ".." then
						local cf = f..'/'..child
						local cattr = lfs.attributes(cf)
						if cattr.mode == "file" and string.match(child, filePattern) and string.match(string.lower(child), string.lower(SPECIAL_XLS_NAME)) then
							print(cf)
							callback(cf)
							count = count + 1
						end
					end
				end
			end					
        end
    end
	if count == 0 then
		print(string.format("%s���û�ҵ�������������", SPECIAL_XLS_NAME))
	end
end

function genAFile(f)
	dofile(f)
	--local xls_inst = read_xls(XLS_FILE .. cfg.xls)
	--print("-----------", xls_inst:get_cell(1, 1, 1))
	
	DoGen(cfg.xls, cfg.sheet, cfg.columns, cfg.outputName, cfg.postProcess, cfg.desc, cfg.key, cfg.beforeProcess, cfg.needJson, classcfg and classcfg.className or nil)
	
	if not classcfg then return end
	
	if #classcfg.props ~= #classcfg.propTypes then
		print("���������͸�����һ��")
		return
	end
	DoGenClass(classcfg.className, classcfg.props, classcfg.propTypes, cfg.outputName)
end

function start()
	print(XLS_FILE)
	print(OUT_FILE)
	print(CFG_PATH)
	print(OUT_CLASS_FILE)
	if SPECIAL_XLS_NAME then
		doGenSingleFile(CFG_PATH, "%.lua$", genAFile)
	else
		eachFile(CFG_PATH, "%.lua$", genAFile)
	end
end


