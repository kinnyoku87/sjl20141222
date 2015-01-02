package org.agony2d.tween {
	import org.agony2d.events.AEvent;
	import org.agony2d.tween.core.AbstractTween;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.tween.core.PropertyProp;
	
	use namespace agony_internal;
	
	// delayed, repeated, reversed, timeScale
	
	[Event( name = "start",    type = "org.agony2d.events.AEvent" )]
	
	[Event( name = "change",   type = "org.agony2d.events.AEvent" )]
	
public class ATween extends AbstractTween {
	
    public function ATween() {
//		m_propertyProps = new Vector.<PropertyProp>
    }
	
	public function get currRepeat() : int {
		return currRepeat;
	}
	
//	public function get duration() : Number {
//		return m_duration;
//	}
	
	public function get ratio() : Number {
		return m_ratio;
	}
	
	public function get totalRepeat() : int {
		return m_totalRepeat;
	}
	
	public function set totalRepeat( v:int ) : void {
		m_totalRepeat = v;
	}
	
	public function get delay() : Number {
		return m_delay;
	}
	
	public function set delay( v:Number ) : void {
		m_delay = v;
	}
	
	public function get ease() : Function {
		return m_ease;
	}
	
	public function set ease( v:Function ) : void {
		m_ease = v;
	}
	
	
	
	agony_internal var m_target:Object;
	agony_internal var m_currRepeat:int;
	agony_internal var m_totalRepeat:int;
	agony_internal var m_duration:Number;
	agony_internal var m_delay:Number;
	agony_internal var m_ease:Function;
	agony_internal var m_next:ATween;
	agony_internal var m_prev:ATween;
	agony_internal var m_group:ATweenGroup;
	agony_internal var m_propertyProps:Vector.<PropertyProp>;
	agony_internal var m_numProperties:int;
	agony_internal var m_ratio:Number;
	agony_internal var m_startTime:Number;
	
	
	
	agony_internal function updateTween( time:Number ) : void {
		var prop:PropertyProp;
		var i:int;
		
		time = m_reversed ? -time * m_timeScaleFactor : time * m_timeScaleFactor;
		if (time < m_delay || time > m_delay + m_duration) {
			
		}
		else if (time <= 0) {
			
		}
		else {
			m_ratio = m_ease(time, 0, 1, m_duration);
			if (time > m_duration) {
				time = 0
			}
		}
		// start事件
		//if (prevTime == 0 && this.vars.onStart && this.cachedTime != 0 && !suppressEvents)
		//{
			//this.dispatchDirectEvent(AEvent.START);
		//}
		// 改变属性.
		while (i < m_numProperties) {
			prop = m_propertyProps[i++];
			m_target[prop.m_property] = prop.m_start + m_ratio * prop.m_change;
		}
		// change事件
//		this.dispatchDirectEvent(AEvent.CHANGE);
		// complete事件
//		this.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
}
}