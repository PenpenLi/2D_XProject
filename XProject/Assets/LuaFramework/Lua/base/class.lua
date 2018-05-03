require "base.utils"
require "base.string"
require "base.table"

--ȫ�������б�
ClassTypeList = {}
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




--[[--
����һ����
~~~ lua
-- ������Ϊ Shape �Ļ�����
local Shape = class("Shape")
-- ctor() ����Ĺ��캯�����ڵ��� Shape.new() ���� Shape ����ʵ��ʱ���Զ�ִ��
function Shape:ctor(shapeName)
    self.shapeName = shapeName
    printf("Shape:ctor(%s)", self.shapeName)
end
-- Ϊ Shape �������Ϊ draw() �ķ���
function Shape:draw()
    printf("draw %s", self.shapeName)
end
--
-- Circle �� Shape �ļ̳���
local Circle = class("Circle", Shape)
function Circle:ctor()
    -- ����̳��า���� ctor() ���캯������ô�����ֶ����ø��๹�캯��
    -- ����.super ���Է���ָ����ĸ���
    Circle.super.ctor(self, "circle")
    self.radius = 100
end
function Circle:setRadius(radius)
    self.radius = radius
end
-- ���Ǹ����ͬ������
function Circle:draw()
    printf("draw %s, raidus = %0.2f", self.shapeName, self.raidus)
end
--
local Rectangle = class("Rectangle", Shape)
function Rectangle:ctor()
    Rectangle.super.ctor(self, "rectangle")
end
--
local circle = Circle.new()             -- ���: Shape:ctor(circle)
circle:setRaidus(200)
circle:draw()                           -- ���: draw circle, radius = 200.00
local rectangle = Rectangle.new()       -- ���: Shape:ctor(rectangle)
rectangle:draw()                        -- ���: draw rectangle
~~~
### �߼��÷�
class() ���˶��崿 Lua ��֮�⣬�����Դ� C++ ����̳��ࡣ
������Ҫ����һ����������������Ӱ�ťʱ�Զ��������еİ�ť����ô���ǿ���ʹ�����µĴ��룺
~~~ lua
-- �� CCNode �������� Toolbar �࣬������� CCNode ���������Ժ���Ϊ
local Toolbar = class("Toolbar", function()
    return display.newNode() -- ����һ�� CCNode ����
end)
-- ���캯��
function Toolbar:ctor()
    self.buttons = {} -- ��һ�� table ����¼���еİ�ť
end
-- ���һ����ť�������Զ����ð�ťλ��
function Toolbar:addButton(button)
    -- ����ť������� table
    self.buttons[#self.buttons + 1] = button
    -- ��Ӱ�ť���� CCNode �У��Ա���ʾ�ð�ť
    -- ��Ϊ Toolbar �Ǵ� CCNode �̳еģ����Կ���ʹ�� addChild() ����
    self:addChild(button)
    -- ���հ�ť�������������а�ť��λ��
    local x = 0
    for _, button in ipairs(self.buttons) do
        button:setPosition(x, 0)
        -- �������а�ť��ÿ����ť֮���� 10 ��
        x = x + button:getContentSize().width + 10
    end
end
~~~
class() �������÷������ǿ����� C++ ���������������չ��Ϊ��
��Ȼ�Ǽ̳У���Ȼ�Ϳ��Ը��� C++ ����ķ�����
~~~ lua
function Toolbar:setPosition(x, y)
    -- ������ Toolbar �̳����и����� CCNode ����� setPosition() ����
    -- ��������Ҫ��������ʽ���ܵ��õ� CCNode ԭ���� setPosition() ����
    getmetatable(self).setPosition(self, x, y)
    printf("x = %0.2f, y = %0.2f", x, y)
end
~~~
**ע��:** Lua �̳��า�ǵķ��������ܴ� C++ ���õ���Ҳ����˵ͨ�� C++ ���������� CCNode ����� setPosition() ����ʱ��������ִ�������� Lua �ж���� Toolbar:setPosition() ������
@param string classname ����
@param [mixed super] ������ߴ�������ʵ���ĺ���
@return table

]]
function class(classname, super)
    local superType = type(super)
    local cls

    if superType ~= "function" and superType ~= "table" then
        superType = nil
        super = nil
    end

    if superType == "function" or (super and super.__ctype == 1) then
        -- inherited from native C++ Object
        cls = {}

        if superType == "table" then
            -- copy fields from super
            for k,v in pairs(super) do cls[k] = v end
            cls.__create = super.__create
            cls.super    = super
        else
            cls.__create = super
            cls.ctor = function() end
        end

        cls.__cname = classname
        cls.__ctype = 1

        function cls.new(...)
            local instance = cls.__create(...)
            -- copy fields from class to native object
            for k,v in pairs(cls) do instance[k] = v end
            instance.class = cls
            instance:ctor(...)
            return instance
        end

    else
        -- inherited from Lua Object
        if super then
            cls = {}
            setmetatable(cls, {__index = super})
            cls.super = super
        else
            cls = {ctor = function() end}
        end

        cls.__cname = classname
        cls.__ctype = 2 -- lua
        cls.__index = cls

        function cls.new(...)
            local instance = setmetatable({}, cls)
            instance.class = cls
            instance:ctor(...)
            return instance
        end
    end

    return cls
end


-- �ṩ�����Ա���� moonscript ������ͻ
function quick_class(classname, super)
  return class(classname, super)
end


--[[--
���������ָ������������ʵ�������� true�����򷵻� false
~~~ lua
local Animal = class("Animal")
local Duck = class("Duck", Animal)
print(iskindof(Duck.new(), "Animal")) -- ��� true
~~~
@param mixed obj Ҫ���Ķ���
@param string classname ����
@return boolean
]]
function iskindof(obj, classname)
    local t = type(obj)
    local mt
    if t == "table" then
        mt = getmetatable(obj)
    elseif t == "userdata" then
        mt = tolua.getpeer(obj)
    end

    while mt do
        if mt.__cname == classname then
            return true
        end
        mt = mt.super
    end

    return false
end


function asClass(obj , classname)
    return iskindof(obj , classname) and obj or nil
end

function implement( srcObj , interface )
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif srcObj[object] then
            return srcObj[object]
        end

        for key, value in pairs(object) do
            srcObj[_copy(key)] = _copy(value)
        end
    end
    _copy(interface)
end