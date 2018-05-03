local string=string
local table=table
local math=math
local io=io
local pairs=pairs
local ipairs=ipairs
local tostring=tostring

---����Э��ģ�����
---Э��ģ��ĵ���
---��base/preload.lua������ʱ���ؽ��뵽ȫ�ֱ���

module('protocol', package.seeall)

local PBC = PBC

function regist_all_pb(proto_path)
	local proto_path = proto_path or "protocol/topbc"
	local PathTbl = posix.dir(proto_path)
	if not PathTbl then
		return
	end
	for k, v in pairs(PathTbl) do
		if v ~= "." and v ~= ".." and v ~= ".svn" then
			local TmpPath = proto_path.."/"..v
			local stat = posix.stat(TmpPath)
			if stat.type == "directory" then
				regist_all_pb(TmpPath)
			elseif stat.type == "regular" then
				if string.match(v, "aoi.pb$") then			--����aoi.pb
					PBC.register_file(TmpPath)
				end
			else
				--nothng
			end
		end
	end
end

function load_protocol_info()
	dofile("protocol/protocol_info.lua")
end

--Ĭ�ϼ������ģ��ʱ���ͼ������е�Э����ģ��
load_protocol_info()
regist_all_pb()
