package org.agony2d.models {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.models.core.AbstractNumberModel;
	
	use namespace agony_internal;
	
public class AInt extends AbstractNumberModel {
	
	/** 當前值. */
	public function get value() : int {
		return this.toGetValue(m_value);
	}
	
	public function set value( v:int ) : void {
		this.doSetValue(v);
	}
	
	/** 最小值. */
	public function get minimum() : int {
		return this.toGetMinimum();
	}
	
	public function set minimum( v:int ) : void {
		this.doSetMinimum(v);
	}
	
	/** 最大值. */
	public function get maximum() : int {
		return this.toGetMaximum();
	}
	
	public function set maximum( v:int ) : void {
		this.doSetMaximum(v);
	}
	
	
	
	/** @private */
	override agony_internal function toGetMinimum() : Number {
		return isNaN(m_minimum) ? int.MIN_VALUE : m_minimum;
	}
	
	/** @private */
	override agony_internal function toGetMaximum() : Number {
		return isNaN(m_maximum) ? int.MAX_VALUE : m_maximum;
	}
}
}