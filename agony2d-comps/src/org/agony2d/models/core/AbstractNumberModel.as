package org.agony2d.models.core {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
public class AbstractNumberModel extends AbstractModel {
	
	/** @private */
	agony_internal var m_minimum:Number;
	/** @private */
	agony_internal var m_maximum:Number;
	/** @private */
	agony_internal var m_value:Number;
	
	
	
	/** @private */
	agony_internal function toGetValue( v:Number ) : Number {
		return isNaN(v) ? 0 : ((v < m_minimum) ? m_minimum : (v > m_maximum ? m_maximum : v));
	}
	
	/** @private */
	agony_internal function doSetValue( v:Number, fireEvent:Boolean = true ) : void {
		if (isNaN(v)) {
			LogMachine.g_instance.error(this, "set value", "Error value: [ {0} ] !!!", v);
		}
		if(this.toGetValue(m_value) != this.toGetValue(v)){
			m_value = v;
			if (fireEvent) {
				this.____doAddToPostUpdateList();
			}
		}
	}
	
	/** @private */
	agony_internal function toGetMinimum() : Number {
		return isNaN(m_minimum) ? -Infinity : m_minimum;
	}
	
	/** @private */
	agony_internal function doSetMinimum( v:Number ) : void {
		if (v > this.toGetMaximum() || isNaN(v)) {
			LogMachine.g_instance.error(this, "set minimum", "Error minimum: [ {0} ] !!!", v);
		}
		if (m_minimum != v) {
			m_minimum = v;
			this.____doAddToPostUpdateList();
		}
	}
	
	/** @private */
	agony_internal function toGetMaximum() : Number {
		return isNaN(m_maximum) ? Infinity : m_maximum;
	}
	
	/** @private */
	agony_internal function doSetMaximum( v:Number ) : void {
		if (v < this.toGetMinimum() || isNaN(v)) {
			LogMachine.g_instance.error(this, "set maximum", "Error maximum: [ {0} ] !!!", v);
		}
		if (m_maximum != v) {
			m_maximum = v;
			this.____doAddToPostUpdateList();
		}
	}
	
	/**
	 * @private
	 * 進度率 (0.0 - 1.0).
	 */
	agony_internal function toGetRatio() : Number {
		return (this.toGetValue(m_value) - this.toGetMinimum()) / (this.toGetMaximum() - this.toGetMinimum());
	}
	
	/** @private */
	agony_internal function doSetRatio( v:Number, fireEvent:Boolean = true ) : void {
		if (isNaN(v)) {
			LogMachine.g_instance.error(this, "set ratio", "Error ratio: [ {0} ] !!!", v);
		}
		v = this.toGetMinimum() + (this.toGetMaximum() - this.toGetMinimum()) * ((v < 0) ? 0 : (v > 1 ? 1 : v));
		if (m_value != v) {
			m_value = v;
			if (fireEvent) {
				this.____doAddToPostUpdateList();
			}
		}
	}
}
}