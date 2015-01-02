package org.agony2d.flashApi.core {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractRangeUU;
	
	use namespace agony_internal;
	
public class AbstractSliderUU extends AbstractRangeUU {
	
    public function AbstractSliderUU() {
		
    }
	
	public function get step() : Number {
		return isNaN(m_step) ? 0: m_step;
	}
	
	public function set step( v:Number ) : void {
		m_step = v;
	}
	
	public function changeValueByStep( increase:Boolean = true ) : void {
		m_model.value += (increase ? this.step : -this.step);
	}
	
	public function positionToRatio( tx:Number, ty:Number ) : Number {
		var result:Number;
		
		
		
		return result;
	}
	
	
	
	/** @private */
	agony_internal var m_step:Number;
	
	
	
}
}