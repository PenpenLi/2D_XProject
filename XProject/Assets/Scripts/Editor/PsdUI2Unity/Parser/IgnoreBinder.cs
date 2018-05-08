﻿using UnityEngine;

namespace EditorTool.PsdExport
{
    /// <summary>
    /// 忽略节点资源
    /// </summary>
    public class IgnoreBinder : ABinder
    {
        public override void ExitBinding(GameObject g, string args, string layerName)
        {
            GameObject.DestroyImmediate(g);
        }
    }
}