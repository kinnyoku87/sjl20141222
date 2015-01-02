package org.agony2d.flashApi.tips {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	
	
	use namespace agony_internal;
	
public class TipData {
	
	public function TipData() {
		
		
		
	}
	
	
	public function get userData() : Object {
		return m_userData;
	}
	
	public function set userData( v:Object ) : void {
		m_userData = v;
	}
	
	
	
	
	agony_internal var m_viewStateRef:Class;
	agony_internal var m_effectStateRef:Class;
	
	agony_internal var m_userData:Object;
	agony_internal var m_target:NodeUU;
	
}
}