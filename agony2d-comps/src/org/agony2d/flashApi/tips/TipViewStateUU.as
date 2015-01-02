package org.agony2d.flashApi.tips {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.PivotFusionUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.inputs.Touch;
	
	use namespace agony_internal;
	
	/** 工具提示視圖狀態. */
public class TipViewStateUU {
	
	/** 容器節點. */
	public function get fusion() : PivotFusionUU {
		return m_fusion;
	}
	
	/** tip數據. */
	public function get tipData() : TipData {
		return m_tipData;
	}
	
	/** 關聯觸摸. */
	public function get touch() : Touch {
		return m_touch;
	}
	
	/** 綁定目標. */
	public function get target() : NodeUU {
		return m_target;
	}
	
	/**
	 * 進入視圖.
	 */
	public function onEnter() : void {
		
	}
	
	/**
	 * 退出視圖.
	 */
	public function onExit() : void {
		
	}
	
	
	
	/** @private */
	agony_internal var m_fusion:TipFusionUU;
	/** @private */
	agony_internal var m_tipData:TipData;;
	/** @private */
	agony_internal var m_touch:Touch;
	/** @private */
	agony_internal var m_target:NodeUU;
}
}