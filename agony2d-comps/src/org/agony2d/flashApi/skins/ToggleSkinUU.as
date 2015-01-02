package org.agony2d.flashApi.skins {
	import flash.display.BitmapData;
	import flash.ui.Mouse;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractUU;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.flashApi.inside.Scale9BitmapProp;
	
	use namespace agony_internal;
	
public class ToggleSkinUU extends ButtonSkinUU {
	
	override agony_internal function doRegisterButtonSkin( buttonType:int, sourceList:Array ) : void {
		var BA:BitmapData;
		
		super.doRegisterButtonSkin(buttonType, sourceList);
		
		// release
		BA = this.____toBitmapFromSource(sourceList.pop());
		m_releaseSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		// over
		if(buttonType & ButtonSkinType.OVER){
			if (Mouse.supportsCursor) {
				BA = this.____toBitmapFromSource(sourceList.pop());
				m_overSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
			}
			else {
				sourceList.pop();
			}
		}
		// press
		if (buttonType & ButtonSkinType.PRESS) {
			BA = this.____toBitmapFromSource(sourceList.pop());
			m_pressSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
		// invalid
		if (buttonType & ButtonSkinType.INVALID) {
			BA = this.____toBitmapFromSource(sourceList.pop());
			m_invalidSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
	}
	
	override agony_internal function doRegisterAtlasButtonSkin( buttonType:int, data:BitmapData, frameWidth:int, frameHeight:int ) : void {
		var BA:BitmapData;
		
		super.doRegisterAtlasButtonSkin(buttonType, data, frameWidth, frameHeight);
		
		g_cachedRect.x = frameWidth;
		g_cachedRect.y = 0;
		// release
		BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
		BA.copyPixels(data, g_cachedRect, g_cachedPoint);
		m_releaseSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		// over
		if (buttonType & ButtonSkinType.OVER) {
			g_cachedRect.y += frameHeight;
			if (Mouse.supportsCursor) {
				BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
				BA.copyPixels(data, g_cachedRect, g_cachedPoint);
				m_overSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
			}
		}
		// press
		if (buttonType & ButtonSkinType.PRESS) {
			g_cachedRect.y += frameHeight;
			BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
			BA.copyPixels(data, g_cachedRect, g_cachedPoint);
			m_pressSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
		// invalid
		if (buttonType & ButtonSkinType.INVALID) {
			g_cachedRect.y += frameHeight;
			BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
			BA.copyPixels(data, g_cachedRect, g_cachedPoint);
			m_invalidSelectedBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
	}
	
	agony_internal function get selectedReleaseBA() : BitmapProp {
		return m_releaseSelectedBA;
	}
	
	agony_internal function get selectedOverBA() : BitmapProp {
		if (m_overSelectedBA != null) {
			return m_overSelectedBA;
		}
		return m_releaseSelectedBA;
	}
	
	agony_internal function get selectedPressBA() : BitmapProp {
		if (m_pressSelectedBA != null) {
			return m_pressSelectedBA;
		}
		return m_releaseSelectedBA;
	}
	
	agony_internal function get selectedInvalidBA() : BitmapProp {
		if (m_invalidSelectedBA != null) {
			return m_invalidSelectedBA;
		}
		return m_releaseSelectedBA;
	}
	
	
	
	/** @private */
	agony_internal var m_releaseSelectedBA:BitmapProp;
	/** @private */
	agony_internal var m_overSelectedBA:BitmapProp;
	/** @private */
	agony_internal var m_pressSelectedBA:BitmapProp;
	/** @private */
	agony_internal var m_invalidSelectedBA:BitmapProp;
}
}