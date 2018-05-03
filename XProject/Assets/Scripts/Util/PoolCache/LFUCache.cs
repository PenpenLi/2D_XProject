﻿/********************************************************************************
** Author： LiangZG
** Email :  game.liangzg@foxmail.com
*********************************************************************************/

using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// 描述：基于引用次数和访问时间的LFU（最少访问算法）
/// <para>创建时间：2016-3-22</para>
/// </summary>
public class LFUCache<K , V> 
{

    /// <summary>
    /// 最大容器值
    /// </summary>
    private int capacityMax;

    private Dictionary<K , LFUNode<K , V>> linked = new Dictionary<K, LFUNode<K, V>>();

    public Action<Node<K , V>> DestroyAction;

    private CacheDestroy<K, V> mDestroy; 
    public LFUCache(int max)
    {
        capacityMax = max;
    }
    /// <summary>
    /// 设置清理策略
    /// </summary>
    /// <param name="cacheDestroy"></param>
    public void SetDestroyStrategy(CacheDestroy<K, V> cacheDestroy)
    {
        mDestroy = cacheDestroy;
    }
    /// <summary>
    /// 添加缓存元素
    /// </summary>
    /// <param name="key"></param>
    /// <param name="value"></param>
    public void Put(K key, V value , int refCount = 1)
    {
        LFUNode<K, V> lfuNode = null;
        if (!linked.ContainsKey(key))
        {
            lfuNode = new LFUNode<K, V>(key, value);
            linked.Add(key ,lfuNode);
        }

        lfuNode = linked[key];
        lfuNode.Value = value;
        lfuNode.UserTime = System.DateTime.UtcNow;
        lfuNode.RefCount+= refCount;
        
        //如果满容，进行排序释放
        if (linked.Count > capacityMax)
            release(lfuNode);
    }


    /// <summary>
    /// 获取缓存数据，如果存在，更新缓存记录
    /// </summary>
    /// <param name="key"></param>
    public Node<K, V> GetNode(K key)
    {
        if (!linked.ContainsKey(key)) return null;
        
        Put(key , linked[key].Value);
        return linked[key];
    }


    public V this[K key]
    {
        get { return GetValue(key); }
    }

    /// <summary>
    /// 获得缓存对象
    /// </summary>
    /// <param name="key"></param>
    /// <param name=""></param>
    /// <returns></returns>
    public V GetValue(K key)
    {
        Node<K, V> node = GetNode(key);
        return node == null ? default(V) : node.Value;
    }
    /// <summary>
    /// 弹出一个缓存对象，并不更新引用
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public V Peek(K key)
    {
        Node<K, V> node = null;
        if (linked.ContainsKey(key))    node = linked[key];
        return node == null ? default(V) : node.Value;
    }

    public bool ContainsKey(K key)
    {
        return linked.ContainsKey(key);
    }

    /// <summary>
    /// 释放使用率最小的结节
    /// </summary>
    private void release(LFUNode<K, V> lastNode)
    {
        LFUNode<K , V>[] nodeArr = new LFUNode<K, V>[linked.Count];
        linked.Values.CopyTo(nodeArr , 0);

        Array.Sort(nodeArr);
        
        for (int i = nodeArr.Length - 1; i >= 0; i--)
        {
            //删除末尾,如果最末尾是最新加入的，则删除前一个
            if (nodeArr[i] == lastNode)  continue;

            if (mDestroy != null)
            {
                bool destroy = mDestroy.CanDestroy(nodeArr[i]);
                if (destroy)
                {
                    linked.Remove(nodeArr[i].Key);
                    mDestroy.DestroyNode(nodeArr[i]);
                    break;
                }
            }
            else
            {
                linked.Remove(nodeArr[i].Key);
                if (DestroyAction != null) DestroyAction.Invoke(nodeArr[i]);
                break;
            }
        }
    }

    public int Size{   get { return linked.Count; }    }
    
    /// <summary>
    /// 设置最大窗口值
    /// </summary>
    /// <param name="updata">是否立即更新缓存 , true表示更新</param>
    public int CapacityMax
    {
        get { return capacityMax; }
        set
        {
            this.capacityMax = value;
            
            LFUNode<K, V>[] nodeArr = new LFUNode<K, V>[linked.Count];
            linked.Values.CopyTo(nodeArr, 0);
            Array.Sort(nodeArr);

            List<LFUNode<K, V>> list = new List<LFUNode<K, V>>();
            list.AddRange(nodeArr);
            releaseMax(list);
        }

    }


    private void releaseMax(List<LFUNode<K, V>> nodeArr)
    {
        if (Size <= capacityMax) return;

        LFUNode<K, V> lastNode = nodeArr[nodeArr.Count - 1];
        linked.Remove(lastNode.Key);
        nodeArr.RemoveAt(nodeArr.Count - 1);

        if (DestroyAction != null) DestroyAction(lastNode);

        releaseMax(nodeArr);
    }


    /// <summary>
    /// 删除结点
    /// </summary>
    /// <param name="key"></param>
    public void RemoveKey(K key)
    {
        if (!linked.ContainsKey(key)) return;
        linked.Remove(key);
    }
    /// <summary>
    /// 清空及Destroy容器内的缓存对象
    /// </summary>
    public void Destroy()
    {
        foreach (LFUNode<K , V> node in linked.Values)
        {
            if (mDestroy != null)
            {
                mDestroy.DestroyNode(node);
            }else if(DestroyAction != null)
                DestroyAction.Invoke(node);
        }
        linked.Clear();
    }
    /// <summary>
    /// 仅用来清空缓存容器
    /// </summary>
    public void Clear()
    {
        linked.Clear();
    }

    /// <summary>
    /// 容器是否已满，如果已满则返回true，否则false
    /// </summary>
    public bool Full { get { return linked.Count >= capacityMax; } }

    public IEnumerator GetEnumerator()
    {
        return linked.GetEnumerator();
    }

    public override string ToString()
    {
        LFUNode<K, V>[] nodeArr = new LFUNode<K, V>[linked.Count];
        linked.Values.CopyTo(nodeArr, 0);
        Array.Sort(nodeArr);

        StringBuilder sb = new StringBuilder();
        foreach (LFUNode<K, V> lfuNode in nodeArr)
        {
            sb.AppendFormat("refCount:{1} , dataTime : {2} key :{0} / {3}\r\n", 
                            lfuNode.Key, lfuNode.RefCount, lfuNode.UserTime.Millisecond , lfuNode.Value);
        }
        return sb.ToString();
    }

}


public class LFUNode<K, V> : Node<K, V>, IComparable
{
    public int RefCount;
    public DateTime UserTime;

    public LFUNode(K key, V value) : base(key, value)
    {
    }

    public int CompareTo(object other)
    {
        LFUNode<K, V> yNode = other as LFUNode<K, V>;

        if (RefCount == yNode.RefCount)
        {
            TimeSpan span = UserTime.Subtract(yNode.UserTime);
            if (span.Milliseconds == 0) return 0;
            return span.Milliseconds > 0 ? -1 : 1;
        }
        return -RefCount.CompareTo(yNode.RefCount);
    }
}
