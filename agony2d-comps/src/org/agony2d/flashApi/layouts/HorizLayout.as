package org.agony2d.flashApi.layouts {
	import org.agony2d.flashApi.core.NodeUU;
	
public class HorizLayout implements ILayout {
	
	public function HorizLayout( gapX:Number, gapY:Number = 0, numParallels:int = 1 ) {
		m_gapX          =  gapX;
		m_gapY          =  gapY;
		m_numParallels  =  numParallels;
	}
	
	public function onLayout( item:NodeUU, index:int ) : void {
		if (m_numParallels <= 1) {
			item.x  =  m_gapX * index;
		}
		else {
			item.x  =  m_gapX * (index % m_numParallels);
			item.y  =  m_gapY * int(index / m_numParallels);
		}
	}
	
	protected var m_numParallels:int;
	protected var m_gapX:Number;
	protected var m_gapY:Number;
}
}