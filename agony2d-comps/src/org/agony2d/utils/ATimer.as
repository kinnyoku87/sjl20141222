package org.agony2d.utils {
	import org.agony2d.base.inside.ITicker;
	import org.agony2d.events.Notifier;
	
public class ATimer extends Notifier implements ITicker {
	
    public function ATimer() {
		
    }
	
	public static function stopAll() : void {
		
	}
	
	public function get currentCount() : int {
		return 0;
	}
	
	public function get repeatCount() : int {
		return 0;
	}
	
	public function get running() : Boolean {
		return false;
	}
	
	public function get delay() : Number {
		return 0;
	}
	
	public function set delay( v:Number ) : void {
		
	}
	
	public function get paused() : Boolean {
		return false;
	}
	
	public function set paused( b:Boolean ) : void {
		
	}
	
	public function reset() : void {
		
	}
	
	public function start() : void {
		
	}
	
	public function stop() : void {
		
	}
	
	
	public function updateTime( elapsedTime:Number ) : void {
		
		
	}
}
}