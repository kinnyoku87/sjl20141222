package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	/** UU狀態容器. */
public class StateFusionUU extends PivotFusionUU {
	
	/** 狀態对象. */
	public function get state() : StateUU {
		return m_state;
	}
	
	/**
	 * 設定視圖狀態.
	 * 
	 * @param	stateRef
	 * @param	stateArgs
	 */
	public function setState( stateRef:Class, stateArgs:Array = null ) : void {
		var i:int;
		
		if (m_state) {
			m_state.onExit();
			this.removeAllListeners();
			m_branchFlashView.removeChildren();
			while (i < m_numNodes) {
				m_nodeList[i++].doDispose();
			}
			m_nodeList.length = m_numNodes = 0;
			m_state = null;
		}
		if (stateRef) {
			m_state = new stateRef;
			m_state.m_fusion = this;
			m_state.m_stateArgs = stateArgs ? stateArgs : [];
			m_state.onEnter();
		}
	}
	
	
	
	/** @private */
	agony_internal var m_state:StateUU;
	
	
	
	/** @private */
	override agony_internal function doDispose() : void {
		if (m_state) {
			m_state.onExit();
		}
		super.doDispose();
	}
}
}