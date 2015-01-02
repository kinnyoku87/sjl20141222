package org.agony2d.flashApi.skins {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractUU;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.flashApi.inside.Scale9BitmapProp;
	import org.agony2d.utils.getInstance;
	
	use namespace agony_internal;
	
public class ButtonSkinUU extends SkinUU {
	
	/**
	 * 初期化.
	 * 
	 * @param	skinArgs
	 *   Common - [ skinType:int, source:* ]
	 *   Atlas  - [ skinType:int, ...sourceList (release、over、press、invalid...) ]
	 */
	override agony_internal function initialize( skinArgs:Array ) : void {
		var BP:Bitmap;
		var BA:BitmapData;
		var count:int;
		var buttonSkin:ButtonSkinUU;
		var buttonType:int;
		
		buttonType = skinArgs[0];
		if (!(buttonType & ButtonSkinType.PRESS || buttonType & ButtonSkinType.SCALE9) && buttonType != ButtonSkinType.NONE) {
			LogMachine.g_instance.error("ButtonSkin", "constructor", "Unknown button type: [ {0} ] !!!", buttonType);
		}
		m_isScale9bitmap = Boolean(buttonType & ButtonSkinType.SCALE9);
		// 整張圖像集.
		if(buttonType & ButtonSkinType.ATLAS){
			BA = this.____toBitmapFromSource(skinArgs[1])
			if (buttonType & ButtonSkinType.OVER) {
				count++;
			}
			if (buttonType & ButtonSkinType.PRESS) {
				count++;
			}
			if (buttonType & ButtonSkinType.INVALID) {
				count++;
			}
			this.doRegisterAtlasButtonSkin(buttonType, BA, ((this is ToggleSkinUU) ? BA.width / 2 : BA.width), BA.height / ++count);
		}
		// 各自分離的圖像.
		else {
			skinArgs = skinArgs.reverse()
			this.doRegisterButtonSkin(skinArgs.pop(), skinArgs);
		}
	}
	
	agony_internal function doRegisterButtonSkin( buttonType:int, sourceList:Array ) : void {
		var BA:BitmapData;
		
		// release
		BA = this.____toBitmapFromSource(sourceList.pop());
		m_releaseBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		// over
		if(buttonType & ButtonSkinType.OVER){
			if (Mouse.supportsCursor) {
				BA = this.____toBitmapFromSource(sourceList.pop());
				m_overBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
			}
			else {
				sourceList.pop();
			}
		}
		// press
		if (buttonType & ButtonSkinType.PRESS) {
			BA = this.____toBitmapFromSource(sourceList.pop());
			m_pressBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
		// invalid
		if (buttonType & ButtonSkinType.INVALID) {
			BA = this.____toBitmapFromSource(sourceList.pop());
			m_invalidBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
	}
	
	agony_internal function doRegisterAtlasButtonSkin( buttonType:int, data:BitmapData, frameWidth:int, frameHeight:int ) : void {
		var BA:BitmapData;
		
		g_cachedPoint.setTo(0, 0);
		g_cachedRect.setTo(0, 0, frameWidth, frameHeight);
		// release
		BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
		BA.copyPixels(data, g_cachedRect, g_cachedPoint);
		m_releaseBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		
		// over
		if (buttonType & ButtonSkinType.OVER) {
			g_cachedRect.y += frameHeight;
			if (Mouse.supportsCursor) {
				BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
				BA.copyPixels(data, g_cachedRect, g_cachedPoint);
				m_overBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
			}
		}
		// press
		if (buttonType & ButtonSkinType.PRESS) {
			g_cachedRect.y += frameHeight;
			BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
			BA.copyPixels(data, g_cachedRect, g_cachedPoint);
			m_pressBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
		// invalid
		if (buttonType & ButtonSkinType.INVALID) {
			g_cachedRect.y += frameHeight;
			BA = new BitmapData(frameWidth, frameHeight, true, 0x0);
			BA.copyPixels(data, g_cachedRect, g_cachedPoint);
			m_invalidBA = (buttonType & ButtonSkinType.SCALE9) ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
		}
	}
	
	agony_internal function ____toBitmapFromSource( source:* ) : BitmapData {
		var BA:BitmapData;
		var instance:*;
		
		instance = getInstance(source);
		if(instance is Bitmap){
			BA = (instance as Bitmap).bitmapData;
		}
		else if(instance is BitmapData){
			BA = instance as BitmapData;
		}
		else {
			LogMachine.g_instance.error("ButtonSkin", "initialize", "Source type happens error !!!");
		}
		return BA;
	}
	
	agony_internal function get releaseBA() : BitmapProp {
		return m_releaseBA;
	}
	
	agony_internal function get overBA() : BitmapProp {
		if (m_overBA != null) {
			return m_overBA;
		}
		return m_releaseBA;
	}
	
	agony_internal function get pressBA() : BitmapProp {
		if (m_pressBA != null) {
			return m_pressBA;
		}
		return m_releaseBA;
	}
	
	agony_internal function get invalidBA() : BitmapProp {
		if (m_invalidBA != null) {
			return m_invalidBA;
		}
		return m_releaseBA;
	}
	
	
	
	/** @private */
	agony_internal static var g_cachedPoint:Point = new Point;
	/** @private */
	agony_internal static var g_cachedRect:Rectangle = new Rectangle;
	
	/** @private */
	agony_internal var m_isScale9bitmap:Boolean;
	/** @private */
	agony_internal var m_releaseBA:BitmapProp;
	/** @private */
	agony_internal var m_overBA:BitmapProp;
	/** @private */
	agony_internal var m_pressBA:BitmapProp;
	/** @private */
	agony_internal var m_invalidBA:BitmapProp;
}
}