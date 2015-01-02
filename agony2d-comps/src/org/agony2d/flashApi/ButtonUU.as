package org.agony2d.flashApi {
	import org.agony2d.flashApi.core.AbstractButtionUU;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ButtonUU extends AbstractButtionUU {
	
	/**
	 * Constructor.
	 * 
	 * @param	skinName
	 */
	public function ButtonUU( skinName:String = null ) {
		super(skinName);
	}
	
	override public function set touchable( b:Boolean ) : void {
		if (m_intouchable == b) {
			m_intouchable = !b;
			if (m_skin) {
				m_bmp.setProp(m_intouchable ? m_skin.invalidBA : m_skin.releaseBA);
			}
		}
	}
	
	/** @private */
	override agony_internal function ____doSetPressSkin() : void {
		m_bmp.setProp(m_skin.pressBA);
		super.____doSetPressSkin();
	}
	
	/** @private */
	override agony_internal function ____doSetOverSkin() : void {
		m_bmp.setProp(m_skin.overBA);
		super.____doSetOverSkin();
	}
	
	/** @private */
	override agony_internal function ____doSetReleaseSkin() : void {
		m_bmp.setProp(m_skin.releaseBA);
		super.____doSetReleaseSkin();
	}
}
}