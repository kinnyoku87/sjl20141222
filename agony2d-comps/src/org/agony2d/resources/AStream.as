package org.agony2d.resources {
	import flash.net.URLStream;
	import flash.utils.IDataInput;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.Notifier;
	
	use namespace agony_internal;
	
	/** 加載開始時觸發. */
	[Event(name = "start",    type = "org.agony2d.events.AEvent")]
	
	/** 加載完成時觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
	/** 加載進度變化時觸發. */
	[Event(name = "progress", type = "org.agony2d.loading.events.AProgressEvent")]
	
	/** 發生加載錯誤時觸發. */
	[Event(name = "error",    type = "org.agony2d.base.events.ErrorEvent")]
	
public class AStream extends Notifier {
	
	/** 流數據. */
	public function get data() : IDataInput {
		return m_urlStream;
	}
	
	/** 是否處於正在加載狀態. */
	public function get loading() : Boolean { 
		return Boolean(m_urlStream);
	}
	
	/** 加載地址. */
	public function get url() : String {
		return m_url;
	}
	
	/** 用戶數據. */
	public function get userData() : Object {
		return m_userData;
	}
	
	public function set userData( v:Object ) : void {
		m_userData = v;
	}
	
	
	
	/** @private */
	agony_internal var m_urlStream:URLStream;
	/** @private */
	agony_internal var m_url:String;
	/** @private */
	agony_internal var m_userData:Object;
}
}