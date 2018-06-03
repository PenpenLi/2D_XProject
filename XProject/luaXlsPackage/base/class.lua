
--�������

--��ȡһ��class�ĸ���
function Super(TmpClass)
	return TmpClass.__SuperClass
end

--�ж�һ��class���߶����Ƿ�
function IsSub(clsOrObj, Ancestor)
	local Temp = clsOrObj
	while  1 do
		local mt = getmetatable(Temp)
		if mt then
			Temp = mt.__index
			if Temp == Ancestor then
				return true
			end
		else
			return false
		end
	end
end

--��ʱû��һ���ȽϺõķ�������ֹ��Class��table����һ��ʵ����ʹ��
--�������һ��Class��ʱ��һ��Ҫ���������ʵ����������
clsObject = {
		--���������Ƿ���һ������ or Class or ��ͨtable
		__ClassType = "<base class>"
	}
		
function clsObject:Inherit(o)	
	o = o or {}

	--û�ж�table���������������������table����Ӧ����init�����г�ʼ��
	--��Ӧ�ð�һ��table���Էŵ�class�Ķ�����

	if not self.__SubClass then
		self.__SubClass = {}
		setmetatable(self.__SubClass, {__mode="v"})
	end
	table.insert(self.__SubClass, o)

	--���ﲻ������metatable������ᵼ��UTIL.copy�ᵼ�´��󣡣�������Ҫ����metatable����ŵ�������ȥŪ
	--setmetatable(o, {__index = self})
	for k, v in pairs(self) do
		if not o[k] then
			o[k]=v
		end
	end
	o.__SubClass = nil
	o.__SuperClass = self

	return o
end

function clsObject:AttachToClass(Obj)
	setmetatable(Obj, {__ObjectType="<base object", __index = self})
	return Obj
end

function clsObject:New(...)
	local o = {}

	--û�г�ʼ����������ԣ���������Ӧ����init��������ʾ��ʼ��
	--��������࣬Ӧ�����Լ���init�������ȵ��ø����init����

	self:AttachToClass(o)

	if o.__init__ then
		o:__init__(...)
	end
	return o
end

function clsObject:__init__()
	--nothing
end

function clsObject:IsClass()
	return true
end

function clsObject:Destroy()
	--���ж����ͷŵ�ʱ��ɾ��callout
	CALLOUT.RemoveAll(self)
end

function clsObject:Update( OldSelf )
	if not self.__SubClass then
		return
	end
	for _, Sub in pairs(self.__SubClass) do
		local OldSub = UTIL.Copy(Sub)
		for k, v in pairs(self) do
			if Sub[k] == OldSelf[k] then
				Sub[k] = self[k]
			end
		end
		Sub:Update(OldSub)
	end
end
