package org.agony2d.models.core {
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.inside.IPostUpdater;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.events.Notifier;
	
	use namespace event_internal;
	use namespace agony_internal;
	
	/** 當數據產生變化時觸發. */
	[Event(name = "change", type = "org.agony2d.events.AEvent")]
	
	/** 數據模型基類. */
public class AbstractModel extends Notifier implements IPostUpdater {
	
	public function kill() : void {
		this.doDispose();
	}
	
	
	
	/** @private */
	agony_internal var m_modelDirty:Boolean;
	
	
	
	/** @private */
	public function onPostUpdate() : void {
		m_modelDirty = false;
		this.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	/** @private */
	agony_internal function doDispose() : void {
		this.removeAllListeners();
		if (m_modelDirty) {
			FrameManager.doRemovePostUpdateObject(this);
		}
	}
	
	/** @private */
	agony_internal function ____doAddToPostUpdateList() : void {
		if (!m_modelDirty) {
			FrameManager.doAddPostUpdateObject(this);
			m_modelDirty = true;
		}
	}
}
}