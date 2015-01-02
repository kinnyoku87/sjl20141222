package org.agony2d.flashApi.core {
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonOutInReaction;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.SkinUU;
	import org.agony2d.inputs.events.ATouchEvent;
	
	use namespace agony_internal;
	
public class AbstractButtionUU extends FusionUU {
	
	public function AbstractButtionUU( skinName:String ) {
		if (skinName != null) {
			this.skinName = skinName;
		}
		this.addEventListener(ATouchEvent.PRESS,   ____onPress);
		this.addEventListener(ATouchEvent.HOVER,    ____onOver);
		this.addEventListener(ATouchEvent.LEAVING,   ____onLeave);
		this.addEventListener(ATouchEvent.RELEASE, ____onRelease)
	}
	
	/** 按鈕圖片. */
	public function get image() : AbstractImageLoaderUU {
		return m_bmp;
	}
	
	/** 皮膚名稱. */
	public function get skinName() : String {
		return m_skin ? m_skin.m_id : null;
	}
	
	public function set skinName( v:String ) : void {
		var skin:ButtonSkinUU;
		
		skin = SkinUU.toRetrieveSkin(v) as ButtonSkinUU;
		if (!skin) {
			LogMachine.g_instance.error(this, "set skinName", "Not exist skin: [ {0} ] !!!", v);
		}
		if (m_skin != skin) {
			m_skin = skin;
			if (!m_skin) {
				m_bmp.kill();
				m_bmp = null;
			}			
			else {
				if (m_bmp) {
					m_bmp.kill();
				}
				m_bmp = (m_skin as ButtonSkinUU).m_isScale9bitmap ? new Scale9BitmapUU : new BitmapLoaderUU;
				m_bmp.setProp(m_skin.releaseBA);
				this.addNode(m_bmp);
			}
		}
	}
	
	/** 觸摸從按鈕上面移出移入時的顯示變化類型. */
	public function get outInReaction() : String {
		return m_outInReaction || g_outInReaction || ButtonOutInReaction.OUT_OVER_IN_PRESS;
	}
	
	public function set outInReaction( v:String ) : void {
		ButtonOutInReaction.doValidateValue(v);
		m_outInReaction = v;
	}
	
	/** 按鈕被按下時觸發的回調方法. */
	public function get onPress() : Function {
		return m_onPress;
	}
	
	public function set onPress( v:Function ) : void {
		m_onPress = v;
	}
	
	/** 按鈕被移入時觸發的回調方法. */
	public function get onOver() : Function {
		return m_onOver;
	}
	
	public function set onOver( v:Function ) : void {
		m_onOver = v;
	}
	
	/** 按鈕被彈起時觸發的回調方法. */
	public function get onRelease() : Function {
		return m_onRelease;
	}
	
	public function set onRelease( v:Function ) : void {
		m_onRelease = v;
	}
	
	public function getLabel() : LabelUU {
		if (!m_label) {
			m_label = new LabelUU;
			this.addNode(m_label);
			m_label.locatingTypeForHoriz = LocatingType.F___A___F;
			m_label.locatingTypeForVerti = LocatingType.F___A___F;
		}
		return m_label;
	}
	
	
	
	/** @private */
	agony_internal static var g_outInReaction:String;
	
	/** @private */
	agony_internal var m_bmp:AbstractImageLoaderUU;
	/** @private */
	agony_internal var m_skin:ButtonSkinUU;
	/** @private */
	agony_internal var m_outInReaction:String;
	/** @private */
	agony_internal var m_label:LabelUU;
	/** @private */
	agony_internal var m_onPress:Function;
	/** @private */
	agony_internal var m_onOver:Function;
	/** @private */
	agony_internal var m_onRelease:Function;
	
	
	
	/** @private */
	agony_internal function ____onPress( e:ATouchEvent ) : void {
		if (m_skin) {
			this.____doSetPressSkin();
		}
	}
	
	/** @private */
	agony_internal function ____onOver( e:ATouchEvent ) : void {
		if (m_skin) {
			if (e.touch.m_isReleaseState) {
				this.____doSetOverSkin();
			}
			else if (e.m_touch.m_bindingNode && e.m_touch.m_bindingNode.m_parent == this) {
				if (this.outInReaction == ButtonOutInReaction.OUT_OVER_IN_PRESS || this.outInReaction == ButtonOutInReaction.OUT_RELEASE_IN_PRESS) {
					this.____doSetPressSkin();
				}
			}
		}
	}
	
	/** @private */
	agony_internal function ____onLeave( e:ATouchEvent ) : void {
		if (m_skin) {
			if (e.m_touch.m_isReleaseState) {
				this.____doSetReleaseSkin();
			}
			else if (e.m_touch.m_bindingNode && e.m_touch.m_bindingNode.m_parent == this) {
				if (this.outInReaction == ButtonOutInReaction.OUT_OVER_IN_PRESS) {
					this.____doSetOverSkin();
				}
				else if (this.outInReaction == ButtonOutInReaction.OUT_RELEASE_IN_RELEASE || this.outInReaction == ButtonOutInReaction.OUT_RELEASE_IN_PRESS) {
					this.____doSetReleaseSkin();
				}
			}
		}
	}
	
	/** @private */
	agony_internal function ____onRelease( e:ATouchEvent ) : void {
		if (m_skin) {
			if (!e.m_touch.m_isReleaseState && e.m_touch.m_bindingNode && (e.m_touch.m_bindingNode.m_parent == this) && (e.m_touch.m_oldHoveringNode == e.m_touch.m_bindingNode)) {
				this.____doSetOverSkin();
			}
			else {
				this.____doSetReleaseSkin();
			}
		}
	}
	
	/** @private */
	agony_internal function ____doSetPressSkin() : void {
		if (m_onPress != null) {
			m_onPress();
		}
	}
	
	/** @private */
	agony_internal function ____doSetOverSkin() : void {
		if (m_onOver != null) {
			m_onOver();
		}
	}
	
	/** @private */
	agony_internal function ____doSetReleaseSkin() : void {
		if (m_onRelease != null) {
			m_onRelease();
		}
	}
}
}