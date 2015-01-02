package org.agony2d.models {
	import org.agony2d.models.core.AbstractModel;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ABool extends AbstractModel {
	
	public function get value() : Boolean { 
		return m_value;
	}
	
	public function set value( b:Boolean ) : void {
		if(m_value != b) {
			m_value = b;
			this.____doAddToPostUpdateList();
		}
	}
	
	
	
	/** @private */
	agony_internal var m_value:Boolean;
}
}