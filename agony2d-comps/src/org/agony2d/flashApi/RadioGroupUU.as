package org.agony2d.flashApi {
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
	[Event(name = "change", type = "org.agony2d.events.AEvent")]
	
public class RadioGroupUU extends Notifier {
	
    public function RadioGroupUU() {
		m_radioList = [];
    }
	
	public function get canSelectClick():Boolean {
		return m_canSelectClick;
	}
	
	public function set canSelectClick(value:Boolean):void {
		m_canSelectClick = value;
	}
	
	/** 單選按鈕數目. */
	public function get numRadios() : int {
		return m_numRadios;
	}
	
	/** 被選的單選按鈕. */
	public function get selectedRadio() : RadioUU {
		return m_selectedRadio;
	}
	
	/** 被選的用戶數據. */
	public function get selectedUserData() : Object {
		return m_selectedRadio ? m_selectedRadio.userData : null;
	}
	
	public function set selectedUserData( v:Object ) : void {
		var i:int;
		var radio:RadioUU;
		
		if (this.selectedUserData != v) {
			while (i < m_numRadios) {
				if ((radio = m_radioList[i++]).userData == v) {
					this.____doSetSelectedRadio(radio);
					return;
				}
			}
			this.____doSetSelectedRadio(null);
		}
	}
	
	/** 被選的單選按鈕索引. */
	public function get selectedIndex() : int {
		return m_selectedRadio ? m_radioList.indexOf(m_selectedRadio) : -1;
	}
	
	public function set selectedIndex( v:int ) : void {
		this.____doSetSelectedRadio(m_radioList[v]);
	}
	
	/**
	 * 由索引獲取單選按鈕.
	 * 
	 * @param	index
	 * @return
	 */
	public function getRadioAt( index:int ) : RadioUU {
		return m_radioList[index];
	}
	
	/**
	 * 殺死.
	 * 
	 * @param	isKillAllRadios	是否同時殺死包含的全部單選按鈕.
	 */
	public function kill( isKillAllRadios:Boolean = false ) : void {
		this.removeAllListeners();
		if (isKillAllRadios) {
			while (--m_numRadios > -1) {
				m_radioList[m_numRadios].kill();
			}
		}
		m_radioList = null;
	}
	
	
	
	/** @private */
	agony_internal var m_radioList:Array;
	/** @private */
	agony_internal var m_numRadios:int;
	/** @private */
	agony_internal var m_selectedRadio:RadioUU;
	
	/** @private */
	agony_internal var m_canSelectClick:Boolean;
	
	/** @private */
	public function doRegisterRadio( radio:RadioUU ) : void {
		this.____doValidateAlive();
		m_radioList[m_numRadios++] = radio;
		radio.addEventListener(ATouchEvent.CLICK, ____onClickRadio);
	}
	
	/** @private */
	public function doUnregisterRadio( radio:RadioUU ) : void {
		var index:int;
		
		this.____doValidateAlive();
		radio.removeEventListener(ATouchEvent.CLICK, ____onClickRadio);
		// 從Group中移出時，selected屬性自動變為false.
		radio.doSetIsSelected(false, false);
		index = m_radioList.indexOf(radio);
		if (index < 0) {
			return;
		}
		m_radioList.splice(index, 1);
		m_numRadios--;
		if (m_selectedRadio == radio) {
			m_selectedRadio = null;
		}
	}
	
	/** @private */
	private function ____onClickRadio( e:ATouchEvent ) : void {
		this.____doSetSelectedRadio(e.target as RadioUU);
	}
	
	/** @private */
	private function ____doSetSelectedRadio( radio:RadioUU ) : void {
		this.____doValidateAlive();
		if (m_selectedRadio == radio && !m_canSelectClick) {
			return;
		}
		if (m_selectedRadio) {
			m_selectedRadio.doSetIsSelected(false, true);
		}
		if (radio) {
			radio.doSetIsSelected(true, true);
			m_selectedRadio = radio;
		}
		else {
			m_selectedRadio = null;
		}
		this.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	/** @private */
	private function ____doValidateAlive() : void {
		if (!m_radioList) {
			LogMachine.g_instance.error(this, "doRegisterRadio", "Radio Group has disposed !!!");
		}
	}
}
}