using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace LuaFramework
{
    /// <summary>
    /// Endless Scroll Manager.
    /// </summary>
    public class EndlessScroller : MonoBehaviour
    {

        Transform mTrans;
        bool mIsDragging = false;
        /// <summary>
        /// �ù�����������1���ж���ǰ�ǹ������ǵ��,��ΪNGUI3.x�汾�ڲ�press��drag�¼�ʱ�����ڵ����ʱ����(UICamera������: ProcessPress),
        /// ����갴�º͵���(press)�Ĺ����лᴥ��һ��drag, �������϶�(drag)�ٵ���Ĺ����л��δ���drag�¼�
        /// </summary>
        bool isClick = false;

        Vector3 mDragStartPosition;
        Vector3 mDragPosition;
        Vector3 mStartPosition;

        public float mCheckTime, mDeltaScrollY = 0f;

        public float totalHeight = 0f;
        public float cellHeight = 135f;
        public float windowHeight = 1000f;

        //Camera nguiCamera;
        Transform emptyTrans;

        // Memory Current position
        void Awake()
        {
            mTrans = transform;
        }

        // Init Default Value and Spawn Measure Object
        void Start()
        {
            //int layer = LayerMask.NameToLayer("UI2D");
            //nguiCamera = NGUITools.FindCameraForLayer(layer);
            GameObject emptyObject = new GameObject("EmptyObject");
            emptyTrans = emptyObject.transform;
            emptyTrans.parent = transform.parent;
        }

        // Adjust Smooth Scroll Position
        void Update()
        {
            if (Mathf.Abs(mDeltaScrollY) > 0f)
            {
                float delta = mDeltaScrollY * 0.1f;
                Vector3 pos = mTrans.localPosition;
                mDeltaScrollY -= delta;
                pos -= Vector3.up * delta;
                mTrans.localPosition = pos;
                SetPosition();
            }
        }

        // Set Current Position  ���õ�ǰλ��
        void SetPosition()
        {
            Vector3 pos = mTrans.localPosition;
            if (pos.y < 0f) pos.y = 0f;
            float height = (totalHeight < windowHeight) ? 0 : totalHeight - windowHeight;
            if (pos.y > height) pos.y = height;
            mTrans.localPosition = pos;
        }

        // Drop!
        void Drop()
        {
            SetPosition();
        }

        // ���´���
        void OnDragEvent()
        {
            emptyTrans.position = mDragPosition;
            Vector3 pos1 = emptyTrans.localPosition;
            emptyTrans.position = mDragStartPosition;
            Vector3 pos2 = emptyTrans.localPosition;
            Vector3 dist = pos1 - pos2;

            float deltaTime = Time.time - mCheckTime;
            if (deltaTime > 0)
            {
                mDeltaScrollY = dist.y * 0.5f / deltaTime;
            }
        }

        // Push Click Event
        void OnClickEvent()
        {
            EndlessCell[] itemCells = GetComponentsInChildren<EndlessCell>();
            EndlessCell curItem = null;
            for (int i = 0; i < itemCells.Length; ++i)
            {
                if (itemCells[i].IsPointOverItemCell(UICamera.lastTouchPosition))
                {
                    curItem = itemCells[i];
                    //Debug.Log("click point: " + UICamera.lastTouchPosition);
                    //Debug.Log("item point: " + UICamera.currentCamera.WorldToScreenPoint(curItem.transform.position));
                    break;
                }
                    
            }
            if (curItem != null)
                curItem.SendMessage("OnClick", SendMessageOptions.DontRequireReceiver);
        }


        // �Ƿ���
        void OnDrag(Vector2 delta)
        {
            if (delta.sqrMagnitude < 1) return;

            isClick = false;
            Ray ray = UICamera.currentCamera.ScreenPointToRay(UICamera.lastTouchPosition);
            float dist = 0f;
            // determine drag state and current drag position
            Vector3 currentPos = ray.GetPoint(dist);
            //Vector3 currentPos = mDragStartPosition - (Vector3)delta;

            if (UICamera.currentTouchID == -1 || UICamera.currentTouchID == 0)
            {
                if (!mIsDragging)
                {
                    mIsDragging = true;
                    mDragPosition = currentPos;
                }
                else
                {
                    Vector3 pos = mStartPosition - (mDragStartPosition - currentPos);
                    //mDragStartPosition = currentPos;
                    Vector3 cpos = new Vector3(mTrans.position.x, pos.y, mTrans.position.z);
                    //float height = (totalHeight < windowHeight) ? 0 : totalHeight - windowHeight;
                    if (cpos.y < -0.0000000001f) cpos.y = 0;  //��������ʱ��ȡ��������
                    mTrans.position = cpos;
                    if (mTrans.localPosition.y >= (totalHeight - windowHeight))
                    {
                        Vector3 temp = new Vector3 (mTrans.localPosition.x,(totalHeight - windowHeight),mTrans.localPosition.z);
                        mTrans.localPosition = temp;
                    }
                }
            }
        }

        // �Ƿ��϶�
        void OnPress(bool isPressed)
        {
            if (isPressed) isClick = true;
            mIsDragging = false;
            Collider col = GetComponent<Collider>();
            // determine press start position
            if (col != null)
            {
                Ray ray = UICamera.currentCamera.ScreenPointToRay(UICamera.lastTouchPosition);
                float dist = 0f;
                mDragStartPosition = ray.GetPoint(dist);
                mStartPosition = mTrans.position;
                col.enabled = !isPressed;
            }
            if (!isPressed)
            {
                if (isClick)
                {
                    OnClickEvent();  // Сͼ�갴��ʱ��
                    isClick = false;
                }
                else
                {
                    OnDragEvent();
                }
            }
            else
            {
                mDeltaScrollY = 0f;
                mCheckTime = Time.time;
            }
            if (!isPressed) Drop();
        }

    }
}