package org.agony2d.tween.core {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.Notifier;
	
	use namespace agony_internal;
	
	[Event( name = "complete", type = "org.agony2d.events.AEvent" )]
	
public class AbstractTween extends Notifier {
	
//    public function AbstractTween {
//		
//    }
	
//	public function get duration() : Number {
//		
//	}
	
	public function get currentTime() : Number {
		return m_currentTime;
	}
	
	public function set currentTime( v:Number ) : void {
		m_currentTime = v;
	}
	
	public function get enabled() : Boolean {
		return m_enabled;
	}
	
	public function set enabled( b:Boolean ) : void {
		m_enabled = b;
	}
	
	public function get reversed() : Boolean {
		return m_reversed;
	}
	
	public function set reversed( b:Boolean ) : void {
		m_reversed = b;
	}
	
	public function get timeScaleFactor() : Number {
		return m_timeScaleFactor;
	}
	
	public function set timeScaleFactor( v:Number ) : void {
		m_timeScaleFactor = v;
	}
	
	public function kill() : void {
		
	}
	
	
	agony_internal var m_currentTime:Number;
	agony_internal var m_enabled:Boolean;
	agony_internal var m_reversed:Boolean;
	agony_internal var m_timeScaleFactor:Number;
	
	
	
	agony_internal function dispose() : void {
		
	}
}
}