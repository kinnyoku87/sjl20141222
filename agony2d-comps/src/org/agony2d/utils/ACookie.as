package org.agony2d.utils {
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.inside.IPostUpdater;
	import org.agony2d.events.Notifier;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	use namespace event_internal;
	
	[Event(name = "change",   type = "org.agony2d.events.AEvent")]
	
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
	[Event(name = "pending",  type = "org.agony2d.utils.ACookie")]
	
public class ACookie extends Notifier implements IPostUpdater {
	
	/**
	 * Constructor.
	 * 
	 * @param	name
	 * @param	minDiskSpace	最小磁盘空间，默认为9(kb)
	 * @param	localPath		"/": 顶级路径(localhost下面)，
	 * 							"null": 生成项目文件夹，
	 * 							"else": 需要服务器方面配置..(无必要)
	 * @usage	生成后无需削除，一直使用 !!
	 */
	public function ACookie( name:String, localPath:String = "/", minDiskSpace:int = 9.0 ) {
		if (!g_cookieList) {
			g_cookieList = {};
		}
		else if (g_cookieList[name]) {
			LogMachine.g_instance.error("ACookie", "constructor", "Repeated cookie name: [ {0} ] !!!", name);
		}
		g_cookieList[name]  =  this;
		m_sharedObject      =  SharedObject.getLocal(name, localPath);
		m_minDiskSpace      =  minDiskSpace;
		m_sharedObject.addEventListener(NetStatusEvent.NET_STATUS, ____onNetStatus);
	}
	
	/** 待定. */
	public static const PENDING : String  =  "pending";
	
	
	
	/**
	 * 獲取本地緩存代理.
	 * 
	 * @param	cookieName
	 * @return
	 */
	public static function getCookie( cookieName:String ) : ACookie {
		return g_cookieList ? g_cookieList[cookieName] : null;
	}
	
	/** 大小(kb). */
	public function get size() : Number {
		return m_sharedObject.size / 1024;
	}
	
	/** 用戶數據. */
	public function get userData() : Object {
		return m_sharedObject.data;
	}
	
	public function set userData( v:Object ) : void {
		m_sharedObject.clear();
		if(v) {
			for (var k:* in v) {
				m_sharedObject.data[k] = v[k];
			}
		}
	}
	
	/** 刷新. */
	public function flush() : void {
		if (!m_cookieDirty) {
			FrameManager.doAddPostUpdateObject(this);
			m_cookieDirty = true;
		}
	}
	
	/** @private */
	public function onPostUpdate() : void {
		var status:String;
		
		m_cookieDirty = false;
		status = m_sharedObject.flush(m_minDiskSpace * 1024);
		switch(status) {
			// More space.
			case SharedObjectFlushStatus.PENDING:
				if (!m_requestingDiskSpace)
				{
					m_requestingDiskSpace = true;
					this.dispatchDirectEvent(PENDING);
				}
				break;
			
			// Flush success.
			case SharedObjectFlushStatus.FLUSHED:
				this.dispatchDirectEvent(AEvent.CHANGE);
				break;
		}
	}
	
	/** @private */
	agony_internal function ____onNetStatus( e:NetStatusEvent ) : void {
		// Regrest more space success.
		if (e.info["code"] == "SharedObject.Flush.Success") {
			if (m_requestingDiskSpace) {
				m_requestingDiskSpace = false;
				this.dispatchDirectEvent(AEvent.COMPLETE);
				this.dispatchDirectEvent(AEvent.CHANGE);
			}
		}
		// continue...
		else {
			m_sharedObject.flush(m_minDiskSpace * 1024);
		}
	}
	
	
	
	/** @private */
	agony_internal static var g_cookieList:Object = {};
	
	/** @private */
	agony_internal var m_sharedObject:SharedObject;
	/** @private */
	agony_internal var m_minDiskSpace:int;
	/** @private */
	agony_internal var m_requestingDiskSpace:Boolean;
	/** @private */
	agony_internal var m_cookieDirty:Boolean;
}
}