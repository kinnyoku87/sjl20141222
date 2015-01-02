package org.agony2d.flashApi.skins.inside {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.skins.SkinUU;
	
	use namespace agony_internal;
	
	/** @private */
final public class SkinRegistry {
	
    public function SkinRegistry( id:String, skinRef:Class, skinArgs:Array, disposable:Boolean ) {
		m_id = id;
		m_skinRef = skinRef;
		m_skinArgs = skinArgs;
		m_disposable = disposable;
    }
	
	agony_internal function toSkinInstance() : SkinUU {
		var skin:SkinUU;
		
		skin = new m_skinRef;
		skin.m_id = m_id;
		skin.m_disposable = m_disposable;
		skin.initialize(m_skinArgs);
		return skin;
	}
	
	
	
	/** @private */
	agony_internal var m_id:String;
	/** @private */
	agony_internal var m_skinRef:Class;
	/** @private */
	agony_internal var m_skinArgs:Array;
	/** @private */
	agony_internal var m_disposable:Boolean;
}
}