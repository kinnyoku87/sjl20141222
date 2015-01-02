package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractButtionUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace event_internal;
	use namespace agony_internal;
	
	[Event(name = "change", type = "org.agony2d.events.AEvent")]
	
public class ToggleUU extends AbstractButtionUU {
	
	/**
	 * Constructor.
	 * 
	 * @param	skinName
	 * @param	selected
	 */
	public function ToggleUU( skinName:String = null, selected:Boolean = false ) {
		super(skinName);
		m_selected = selected;
		if (m_skin) {
			m_bmp.setProp(selected ? (m_skin as ToggleSkinUU).selectedReleaseBA : m_skin.releaseBA);
		}
	}
	
	/** 是否為被選狀態. */
	public function get selected() : Boolean {
		return m_selected;
	}
	
	public function set selected( b:Boolean ) : void {
		this.doSetIsSelected(b, true);
	}
	
	override public function set skinName( v:String ) : void {
		super.skinName = v;
		if (!(m_skin is ToggleSkinUU)) {
			LogMachine.g_instance.error(this, "set skinName", "Error button skin: [ {0} ] !!!", v);
		}
	}
	
	override public function set touchable( b:Boolean ) : void {
		if (m_intouchable == b) {
			m_intouchable = !b;
			if (m_skin) {
				if (m_selected) {
					m_bmp.setProp(m_intouchable ? (m_skin as ToggleSkinUU).selectedInvalidBA : (m_skin as ToggleSkinUU).selectedReleaseBA);
				}
				else {
					m_bmp.setProp(m_intouchable ? m_skin.invalidBA : m_skin.releaseBA);
				}
			}
		}
	}
	
	
	
	/** @private */
	agony_internal var m_selected:Boolean;
	
	
	
	/** @private */
	override agony_internal function ____doSetPressSkin() : void {
		if (m_selected) {
			m_bmp.setProp((m_skin as ToggleSkinUU).selectedPressBA);
		}
		else {
			m_bmp.setProp(m_skin.pressBA);
		}
		super.____doSetPressSkin();
	}
	
	/** @private */
	override agony_internal function ____doSetOverSkin() : void {
		if (m_selected) {
			m_bmp.setProp((m_skin as ToggleSkinUU).selectedOverBA);
		}
		else {
			m_bmp.setProp(m_skin.overBA);
		}
		super.____doSetOverSkin();
	}
	
	/** @private */
	override agony_internal function ____doSetReleaseSkin() : void {
		if (m_selected) {
			m_bmp.setProp((m_skin as ToggleSkinUU).selectedReleaseBA);
		}
		else {
			m_bmp.setProp(m_skin.releaseBA);
		}
		super.____doSetReleaseSkin();
	}
	
	/** @private */
	agony_internal function doSetIsSelected( b:Boolean, fireEvent:Boolean ) : void {
		if (m_selected != b) {
			m_selected = b;
			if (m_skin) {
				if (m_selected) {
					m_bmp.setProp(m_intouchable ? (m_skin as ToggleSkinUU).selectedInvalidBA : (m_skin as ToggleSkinUU).selectedReleaseBA);
				}
				else {
					m_bmp.setProp(m_intouchable ? m_skin.invalidBA : m_skin.releaseBA);
				}
			}
			if (fireEvent) {
				this.dispatchDirectEvent(AEvent.CHANGE);
			}
		}
	}
}
}