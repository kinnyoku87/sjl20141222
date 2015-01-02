package org.agony2d.flashApi.core {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.events.AEvent;
	import org.agony2d.models.ARange;
	
	use namespace agony_internal;
    
public class AbstractRangeUU extends FusionUU {
	
	public function AbstractRangeUU() {
		m_model = new ARange;
		m_model.addEventListener(AEvent.CHANGE, ____onModelChanged);
	}
	
	/** 數據模型. */
	public function get model() : ARange {
		return m_model;
	}
	
	
	
	/** @private */
	protected var m_model:ARange;
	
	
	
	/** @private */
	override agony_internal function doDispose() : void {
		m_model.kill();
		super.doDispose();
	}
	
	/** @private */
	agony_internal function ____onModelChanged( e:AEvent ) : void {
		
	}
}
}