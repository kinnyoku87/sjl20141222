package org.agony2d.models {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	
	use namespace agony_internal;
	
public class ARange extends ANumber {
	
	public function ARange() {
		m_minimum = 0.0;
		m_maximum = 100.0;
	}
	
	/** 進度率 (0.0 - 1.0). */
	public function get ratio() : Number { 
		return this.toGetRatio();
	}
	
	public function set ratio( v:Number ) : void { 
		this.doSetRatio(v);
		this.onPostUpdate();
	}
	
	public function get snapInterval() : Number { 
		return isNaN(m_snapInterval) ? 0 : m_snapInterval;
	}
	
	public function set snapInterval( v:Number ) : void { 
		if (m_snapInterval != v) {
			m_snapInterval = v;
			this.____doAddToPostUpdateList();
		}
	}
	
	override public function set value( v:Number ) : void {
		this.doSetValue(v)
	}
	
	override public function set minimum( v:Number ) : void {
		this.doSetMinimum(v);
	}
	
	override public function set maximum( v:Number ) : void {
		this.doSetMaximum(v);
	}
	
	
	
	/** @private */
	agony_internal var m_snapInterval:Number;
	
	
	
	/** @private */
	override public function onPostUpdate() : void {
		m_modelDirty = false;
		this.doSnapValue();
		this.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	/** @private */
	agony_internal function doSnapValue() : void {
		var N_A:Number;
		var N_B:Number;
		
		if (m_snapInterval == 0 || isNaN(m_snapInterval)) {
			return;
		}
		N_A      =  this.toGetValue(m_value) - this.toGetMinimum();
		N_B      =  N_A % m_snapInterval;
		m_value  =  ((N_B >= m_snapInterval * .5) ? (N_A - N_B + m_snapInterval) : (N_A - N_B)) + this.toGetMinimum();
	}
	
	/** @private */
	override agony_internal function toGetMinimum() : Number {
		return isNaN(m_minimum) ? 0.0 : m_minimum;
	}
	
	/** @private */
	override agony_internal function toGetMaximum() : Number {
		return isNaN(m_maximum) ? 100.0 : m_maximum;
	}
}
}