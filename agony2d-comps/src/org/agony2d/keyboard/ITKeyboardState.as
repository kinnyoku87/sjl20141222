package org.agony2d.keyboard {
	import org.agony2d.events.Notifier;
	
public interface ITKeyboardState {
	
	function get press() : Notifier;
	function get straight() : Notifier;
	function get release() : Notifier;
}
}