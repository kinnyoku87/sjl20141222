package org.agony2d.flashApi.tips {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.flashApi.PivotFusionUU;
	
	use namespace agony_internal;
	
	/** 工具提示過渡效果狀態. */
public class TipEffectStateUU extends Notifier {
	
	public function finish() : void {
		this.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
	/** 提示視圖. */
	public function get fusion() : PivotFusionUU {
		return m_fusion;
	}
	
	/**
	 * 出現效果.
	 */
	public function onEnter() : void {
		
	}
	
	/**
	 * 出現效果中斷.
	 */
	public function onEnterInterrupted() : void {
		
	}
	
	/**
	 * 退出效果.
	 */	
	public function onExit() : void {
		
	}
	
	/** 
	 * 退出效果中斷.
	 */	
	public function onExitInterrupted() : void {
		
	}
	
	
	
	agony_internal var m_fusion:PivotFusionUU;
}
}