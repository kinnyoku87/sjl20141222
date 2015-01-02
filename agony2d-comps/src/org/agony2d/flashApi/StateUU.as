package org.agony2d.flashApi {
	import org.agony2d.display.core.AbstractViewState;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class StateUU extends AbstractViewState {
	
	/** 外層容器節點. */
	public function get fusion() : PivotFusionUU {
		return m_fusion;
	}
	
	
	
	/** @private */
	agony_internal var m_fusion:StateFusionUU;
}
}