package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
public class RadioUU extends ToggleUU {
	
	/**
	 * Constructor.
	 * 
	 * @param	skinName
	 */
    public function RadioUU( skinName:String = null ) {
		super(skinName, false);
    }
	
	/** 單選按鈕組. */
	public function get group() : RadioGroupUU {
		return m_group;
	}
	
	public function set group( v:RadioGroupUU ) : void {
		if (m_group == v) {
			return;
		}
		if (m_group) {
			m_group.doUnregisterRadio(this);
		}
		m_group = v;
		if (m_group) {
			m_group.doRegisterRadio(this);
		}
	}
	
	override public function set selected( b:Boolean ) : void {
		LogMachine.g_instance.error(this, "set selected", "RadioUU 類不實現此屬性或方法，請使用RadioGroupUU進行相關操作 !!!");
	}
	
	
	
	/** @private */
	agony_internal var m_group:RadioGroupUU;
	
	
	
	/** @private */
	override agony_internal function doDispose() : void {
		// 當一個存在Group的Radio被削除時，其Group則會自動dispose.
		if (m_group.m_radioList) {
			m_group.kill();
		}
		super.doDispose();
	}
}
}