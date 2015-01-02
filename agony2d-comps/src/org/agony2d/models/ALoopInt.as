package org.agony2d.models {
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ALoopInt extends AInt {
	
	// Do loop between min and max.
	override public function set value( v:int ) : void {
		if (v > m_maximum) {
			v = (v - m_minimum) % (m_maximum - m_minimum + 1) + m_minimum;
		}
		else if (v < m_minimum) {
			v = (v - m_minimum) % (m_maximum - m_minimum + 1) + m_maximum + 1;
		}
		this.doSetValue(v);
	}
}
}