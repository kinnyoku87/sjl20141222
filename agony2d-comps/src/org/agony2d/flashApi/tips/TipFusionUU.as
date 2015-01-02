package org.agony2d.flashApi.tips {
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.PivotFusionUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.inputs.Touch;
	
	use namespace agony_internal;
	
public class TipFusionUU extends PivotFusionUU {
	
	public function setState( tipData:TipData, touch:Touch, target:NodeUU ) : void {
		m_viewState = new (tipData.m_viewStateRef);
		m_viewState.m_fusion = this;
		m_viewState.m_tipData = tipData;
		m_viewState.m_touch = touch;
		m_viewState.m_target = target;
		m_viewState.onEnter();
		
		
	}
	
	public function reset() : void {
		var i:int;
		
		m_viewState.onExit();
		this.removeAllListeners();
		this.revert();
		m_branchFlashView.removeChildren();
		while (i < m_numNodes) {
			m_nodeList[i++].doDispose();
		}
		m_nodeList.length = m_numNodes = 0;
		m_viewState = null;
	}
	
	
	
	/** @private */
	agony_internal var m_viewState:TipViewStateUU;
	
	
	
	/** @private */
	override agony_internal function doDispose() : void {
		LogMachine.g_instance.error("TipFusionUU", "unregisterTip", NODE_ERROR);
	}
}
}