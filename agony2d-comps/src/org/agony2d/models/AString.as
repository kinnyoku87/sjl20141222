package org.agony2d.models {
	import org.agony2d.models.core.AbstractModel;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class AString extends AbstractModel {
	
	public function get value() : String {
		return (m_value == null) ? "" : m_value;
	}
	
	public function set value( v:String ) : void {
		if (m_value != v) {
			m_value = v;
			this.____doAddToPostUpdateList();
		}
	}
	
	
	
	/** @private */
	agony_internal var m_value:String;
}
}