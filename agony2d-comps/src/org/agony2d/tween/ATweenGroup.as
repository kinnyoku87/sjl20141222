package org.agony2d.tween {
	import org.agony2d.base.inside.ITicker;
	import org.agony2d.tween.core.AbstractTween;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	// 插座，电器
public class ATweenGroup extends AbstractTween implements ITicker {
	
    public function ATweenGroup() {
		
    }
	
	
	override public function set enabled( b:Boolean ) : void {
		if (m_enabled != b) {
			m_enabled = b;
			if (b) {
//				UpdaterManager.doAddFrameUpdater(this);
			}
			else {
//				UpdaterManager.doRemoveFrameUpdater(this);
			}
		}
	}
	
	public function from( target:Object, duration:Number, startVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		tween = new ATween;
		
		
		return tween;
	}
	
	public function to( target:Object, duration:Number, endVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		return tween;
	}
	
	public function fromTo( target:Object, duration:Number, startVars:Object, endVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		return tween;
	}
	
	public function updateTime( elapsedTime:Number ) : void {
		m_totalTime += elapsedTime * .001;
		m_curr = m_head.m_next;
		while (m_curr) {
			m_curr.updateTween(m_reversed ? -elapsedTime * m_timeScaleFactor : elapsedTime * m_timeScaleFactor);
			m_curr = m_curr.m_next;
		}
	}
	
	
	agony_internal var m_autoRemoved:Boolean;
	agony_internal var m_curr:ATween;
	agony_internal var m_head:ATween;
	agony_internal var m_totalTime:Number;
	
	
	/*final agony_internal function doInsertTween() : ATween {
		var tween:ATween;
		
		tween          =  new ATween;
		tween.m_group  =  this;
		if (!m_head.next) {
			tween.m_prev   =  g_head;
			g_head.m_next  =  tween;
		}
		else {
			tween.m_prev   =  g_head;
			tween.m_next   =  g_head.m_next;
			g_head.m_next  =  g_head.m_next.prev  =  tween;
		}
		if (m_curr == m_head) {
			m_curr = tween;
		}
		return tween;
	}*/
	
	final agony_internal function removeTween( tween:ATween ) : void {
//		var tween:ATween;
		
		if (tween == m_curr) {
			m_curr = tween.m_prev;
		}
		tween.m_prev.m_next = tween.m_next;
		if (tween.m_next) {
			tween.m_next.m_prev = tween.m_prev;
		}
	}
}
}