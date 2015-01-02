package org.agony2d.keyboard.inside {
	import org.agony2d.events.INotifier;
	import org.agony2d.events.Notifier;
	import org.agony2d.keyboard.ITKeyboardState;
	import org.agony2d.base.LogMachine;
	
	import org.agony2d.base.inside.agony_internal;
	use namespace agony_internal;
	
	/** @private */
public class TKeyboardState implements ITKeyboardState {
	
	public function get press() : Notifier { 
		return m_pressNotifier ||= new Notifier;
	}
	
	public function get straight() : Notifier { 
		return m_straightNotifier ||= new Notifier;
	}
	
	public function get release() : Notifier { 
		return m_releaseNotifier ||= new Notifier;
	}
	
	agony_internal function dispose() : void {
		if (m_pressNotifier) {
			m_pressNotifier.removeAllListeners();
		}
		if (m_straightNotifier) {
			m_straightNotifier.removeAllListeners();
		}
		if (m_releaseNotifier) {
			m_releaseNotifier.removeAllListeners();
		}
	}
	
	agony_internal var m_pressNotifier:Notifier;
	agony_internal var m_straightNotifier:Notifier;
	agony_internal var m_releaseNotifier:Notifier;
	agony_internal var m_prev:TKeyboardState;
	agony_internal var m_next:TKeyboardState;
}
}