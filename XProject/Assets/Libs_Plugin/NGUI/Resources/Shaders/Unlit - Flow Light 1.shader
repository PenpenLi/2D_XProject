// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/Unlit/Flow Light 1"  
{  
    Properties  
    {  
        _MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}  
		_FlowLightTex("Flow Light Texture" , 2D) = "white" {}
		_FlowLightPower("Flow Power" , float) = 1.0
		_FlowLightOffset("Flow Offset" , Vector) = (0,0,0,0)

		_WidthRate("Sprite width Rate", float) = 1
		_HeightRate("Sprite height Rate", float) = 1
		_Offset("offset", Vector) = (0,0,0,0)
    }  
  
    SubShader  
    {  
        LOD 200  
  
        Tags  
        {  
            "Queue" = "Transparent"  
            "IgnoreProjector" = "True"  
            "RenderType" = "Transparent"  
        }  
          
        Pass  
        {  
            Cull Off  
            Lighting Off  
            ZWrite Off  
            Offset -1, -1  
            Fog { Mode Off }  
            ColorMask RGB  
            AlphaTest Greater .01  
            Blend SrcAlpha OneMinusSrcAlpha  
  
            CGPROGRAM  
            #pragma vertex vert  
            #pragma fragment frag  
  
            #include "UnityCG.cginc"  
  
            sampler2D _MainTex;  
            float4 _ClipRange0 = float4(0.0, 0.0, 1.0, 1.0);  
            float2 _ClipArgs0 = float2(1000.0, 1000.0);  
			sampler2D _FlowLightTex;
			float _FlowLightPower;
			float4 _FlowLightOffset;
			float _WidthRate;
			float _HeightRate;
			float4 _Offset;

            struct appdata_t  
            {  
                float4 vertex : POSITION;  
                half4 color : COLOR;  
                float2 texcoord : TEXCOORD0;  
            };  
  
            struct v2f  
            {  
                float4 vertex : POSITION;  
                half4 color : COLOR;  
                float2 texcoord : TEXCOORD0;  
                float2 worldPos : TEXCOORD1;  
            };  
  
            v2f vert (appdata_t v)  
            {  
                v2f o;  
                o.vertex = UnityObjectToClipPos(v.vertex);  
                o.color = v.color;  
                o.texcoord = v.texcoord;  
                o.worldPos = v.vertex.xy * _ClipRange0.zw + _ClipRange0.xy;  
                return o;  
            }  
  
            half4 frag (v2f IN) : COLOR  
            {  
                // Softness factor  
                float2 factor = (float2(1.0, 1.0) - abs(IN.worldPos)) * _ClipArgs0;  
              
                // Sample the texture  
                half4 col = tex2D(_MainTex, IN.texcoord);    
                  
                if (dot(IN.color, fixed4(1,1,1,0)) == 0)  
                {  
                  col.rgb = dot(col.rgb, fixed3(.222,.707,.071));  
                }
				else {
					col = col * IN.color;
				}
                   
				//UV���봦��
				float2 uvFlowLight = float2((IN.texcoord.x - _Offset.x) / _WidthRate, (IN.texcoord.y - _Offset.y) / _HeightRate);
				if (_Offset.x > 0) uvFlowLight.x *= 0.5;
				if (_Offset.y > 0) uvFlowLight.y *= 0.5;
				//�����ٶȱ仯
				uvFlowLight.x -= _FlowLightOffset.x;
				uvFlowLight.y += _FlowLightOffset.y;

				fixed4 flowColor = tex2D(_FlowLightTex, uvFlowLight) * _FlowLightPower;
				flowColor.rgb *= col.rgb;
				col.rgb += flowColor.rgb;			

                col.a *= clamp( min(factor.x, factor.y), 0.0, 1.0);  
				col.rgb *= col.a;
                return col;  
            }  
            ENDCG  
        }  
    }  
      
    SubShader  
    {  
        LOD 100  
  
        Tags  
        {  
            "Queue" = "Transparent"  
            "IgnoreProjector" = "True"  
            "RenderType" = "Transparent"  
        }  
          
        Pass  
        {  
            Cull Off  
            Lighting Off  
            ZWrite Off  
            Fog { Mode Off }  
            ColorMask RGB  
            AlphaTest Greater .01  
            Blend SrcAlpha OneMinusSrcAlpha  
            ColorMaterial AmbientAndDiffuse  
              
            SetTexture [_MainTex]  
            {  
                Combine Texture * Primary  
            }  
        }  
    }  
}