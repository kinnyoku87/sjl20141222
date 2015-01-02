package org.agony2d.models {
	import org.agony2d.models.core.AbstractNumberModel;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ANumber extends AbstractNumberModel {
	
	/** 當前值. */
	public function get value() : Number {
		return this.toGetValue(m_value);
	}
	
	public function set value( v:Number ) : void {
		this.doSetValue(v);
	}
	
	/** 最小值. */
	public function get minimum() : Number {
		return this.toGetMinimum();
	}
	
	public function set minimum( v:Number ) : void {
		this.doSetMinimum(v);
	}
	
	/** 最大值. */
	public function get maximum() : Number {
		return this.toGetMaximum();
	}
	
	public function set maximum( v:Number ) : void {
		this.doSetMaximum(v);
	}
}
}