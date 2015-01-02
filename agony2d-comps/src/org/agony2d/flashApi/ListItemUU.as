package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ListItemUU {
	
    public function ListItemUU() {
		
    }
	
	public function get prevX() : Number {
		return m_prevX;
	}
	
	public function get prevY() : Number {
		return m_prevY;
	}
	
	public function execute( data:Object ) : void {
		
	}
	
	
	agony_internal var m_prevX:Number;
	agony_internal var m_prevY:Number;
	agony_internal var m_selected:Boolean;
}
}