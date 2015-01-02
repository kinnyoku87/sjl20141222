package org.agony2d.resources {
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.Dictionary;
	import org.agony2d.base.inside.IPostUpdater;
	import org.agony2d.models.AString;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.loading.events.AProgressEvent;
	
	use namespace agony_internal;
	
	/** 全部完成后觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
	/** 任意項 (AStream) 發生加載錯誤時觸發. */
	[Event(name = "error",    type = "org.agony2d.base.events.ErrorEvent")]
	
	/** 字節流加載機. */
public class StreamMachine extends Notifier implements IPostUpdater {
	
	public function StreamMachine() {
		m_streamMap = {};
		m_streamList = [];
		m_urlStream = new URLStream;
		m_urlStream.addEventListener(Event.COMPLETE, 		 ____onComplete);
		m_urlStream.addEventListener(ProgressEvent.PROGRESS, ____onProgress);
		m_urlStream.addEventListener(IOErrorEvent.IO_ERROR,  ____onIoError);
	}
	
	/** Optional instance. */
	public static function getInstance() : StreamMachine {
		return g_instance ||= new StreamMachine;
	}
	
	/** 剩餘加載值，計算全部加載進度時使用. */
	public function get totalValue() : Number {
		return (m_bytesLoaded > 0) ? + m_numStream - m_bytesLoaded / m_bytesTotal : m_numStream; 
	}
	
	/** 字節序類型. */
	public function get endian() : String {
		return m_urlStream.endian;
	}
	
	public function set endian( v:String ) : void {
		m_urlStream.endian = v;
	}
	
	/**
	 * 加入或獲取一個字節流加載任務.
	 * 
	 * @param	url
	 * @return
	 */
	public function getStream( url:String ) : AStream {
		var stream_A:AStream;
		
		if ((stream_A = m_streamMap[url]) == null) {
			stream_A = m_streamMap[url] = m_streamList[m_numStream++] = new AStream;
			stream_A.m_urlStream = m_urlStream;
			stream_A.m_url = url;
		}
		this.____doReadyToLoad();
		return stream_A;
	}
	
	/**
	 * 停止全部.
	 */
	public function stopAll() : void {
		var i:int;
		var stream_A:AStream;
		
		if (m_dirty) {
			FrameManager.doRemovePostUpdateObject(this);
		}
		while(i<m_numStream){
			stream_A = m_streamList[i++];
			stream_A.removeAllListeners();
		}
		m_numStream = m_streamList.length = m_bytesLoaded = m_bytesTotal = 0.0;
		m_streamMap = {};
		m_urlStream.stop();
	}
	
	/**
	 * 殺死.
	 */
	public function kill() : void {
		this.removeAllListeners();
		this.stopAll();
		m_urlStream.removeEventListener(Event.COMPLETE, 		____onComplete);
		m_urlStream.removeEventListener(ProgressEvent.PROGRESS, ____onProgress);
		m_urlStream.removeEventListener(IOErrorEvent.IO_ERROR,  ____onIoError);
	}
	
	
	
	/** @private */
	agony_internal static var g_instance:StreamMachine;
	
	/** @private */
	agony_internal var m_urlStream:URLStream;
	/** @private */
	agony_internal var m_streamMap:Object;
	/** @private */
	agony_internal var m_streamList:Array; 
	/** @private */
	agony_internal var m_numStream:int;
	/** @private */
	agony_internal var m_dirty:Boolean;
	/** @private */
	agony_internal var m_currStream:AStream;
	/** @private */
	agony_internal var m_bytesLoaded:Number;
	/** @private */
	agony_internal var m_bytesTotal:Number;
	
	
	
	/** @private */
	[Inline]
	final agony_internal function ____doReadyToLoad() : void {
		if (!m_dirty) {
			FrameManager.doAddPostUpdateObject(this);
			m_dirty = true;
		}
	}
	
	public function onPostUpdate() : void {
		m_dirty = false;
		this.____doLoadNext();
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doLoadNext() : void {
		var l:int;
		
		if (m_numStream == 0) {
			this.dispatchDirectEvent(AEvent.COMPLETE);
			m_urlStream.close();
			return;
		}
		m_currStream = m_streamList[0];
		m_urlStream.load(new URLRequest(m_currStream.m_url));
		m_currStream.dispatchDirectEvent(AEvent.START);
	}
	
	/** @private */
	final agony_internal function ____onComplete( e:Event ) : void {
		delete m_streamMap[m_currStream.m_url];
		m_currStream.dispatchDirectEvent(AEvent.COMPLETE);
		this.____doRemoveCurrStream();
		// It need to manually simulate "next frame dispatch complete event".
		this.____doReadyToLoad();
		m_bytesLoaded = m_bytesTotal = 0.0;
	}
	
	/** @private */
	final agony_internal function ____onProgress( e:ProgressEvent ) : void {
		if (m_urlStream.hasEventListener(AProgressEvent.PROGRESS)) {
			m_bytesLoaded  =  e.bytesLoaded;
			m_bytesTotal   =  e.bytesTotal;
//			stream_A.dispatchEvent(g_programEvent);
			AProgressEvent.dispatchProgressEvent(m_currStream, m_bytesLoaded, m_bytesTotal);
		}
		//trace(e.bytesLoaded, e.bytesTotal);
	}
	
	/** @private */
	final agony_internal function ____onIoError( e:flash.events.IOErrorEvent ) : void {
		var event:IOErrorEvent;
		
		delete m_streamMap[m_currStream.m_url];
		event = new IOErrorEvent(IOErrorEvent.IO_ERROR, e.text, e.errorID, m_currStream.m_url);
		if (m_currStream.hasEventListener(IOErrorEvent.IO_ERROR)) {
			m_currStream.dispatchEvent(event);
		}
		else {
			LogMachine.g_instance.warning(this, "____onIoError", "Error URL: [ {0} ] !!!", m_currStream.m_url);
		}
		
		this.dispatchEvent(event);
		
		this.____doRemoveCurrStream();
		this.____doLoadNext();
		m_bytesLoaded = m_bytesTotal = 0.0;
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doRemoveCurrStream() : void {
		m_currStream.removeAllListeners();
		m_streamList.shift();
		--m_numStream;
	}
}
}