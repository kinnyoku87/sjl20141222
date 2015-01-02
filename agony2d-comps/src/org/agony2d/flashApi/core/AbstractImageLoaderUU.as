package org.agony2d.flashApi.core {
	import flash.display.BitmapData;
	import flash.utils.getQualifiedClassName;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.events.AEvent;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.inputs.Touch;
	import org.agony2d.loading.ALoader;
	
	use namespace agony_internal;
	
	/** 加載完成時觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
	/** 加載發生錯誤時觸發. */
	[Event(name = "error",    type = "org.agony2d.base.events.ErrorEvent")]
	
	/** UU可加載式圖像抽象類. */
public class AbstractImageLoaderUU extends AutoSmoothNode {
	
	/** 源圖像寬度. */
	public function get sourceWidth() : int {
		return m_prop ? m_prop.m_data.width / g_pixelRatio : 0;
	}
	
	/** 源圖像高度. */
	public function get sourceHeight() : int {
		return m_prop ? m_prop.m_data.height / g_pixelRatio : 0;
	}
	
	/** 圖像寬度. */
	public function set width( v:Number ) : void {
		if(!m_prop){
			return;
		}
		m_flashView.scaleX = v / this.sourceWidth;
		if (!m_externalAltered) {
			if (!m_internalAltered && m_flashView.scaleX != 1.0) {
				this.doCheckSmoothingState(true, false);
			}
				//else if (m_view.m_rotation == 0.0 && m_view.m_scaleX == 1.0 && m_view.m_scaleY == 1.0) {
			else if (m_flashView.rotation == 0.0 && m_flashView.scaleX == 1.0 && m_flashView.scaleY == 1.0) {
				this.doCheckSmoothingState(false, false);
			}
		}
	}
	
	/** 圖像高度. */
	public function set height( v:Number ) : void {
		if(!m_prop){
			return;
		}
		m_flashView.scaleY = v / this.sourceHeight;
		if (!m_externalAltered) {
			if (!m_internalAltered && m_flashView.scaleY != 1.0) {
				this.doCheckSmoothingState(true, false);
			}
				//else if (m_view.m_rotation == 0.0 && m_view.m_scaleX == 1.0 && m_view.m_scaleY == 1.0) {
			else if (m_flashView.rotation == 0.0 && m_flashView.scaleX == 1.0 && m_flashView.scaleY == 1.0) {
				this.doCheckSmoothingState(false, false);
			}
		}
	}
	
	/** 圖像數據. */
	public function get bitmapData() : BitmapData {
		return m_prop ? m_prop.m_data : null;
	}
	
	public function set bitmapData( v:BitmapData ) : void {
		this.doStopLoad();
		m_prop = null;
		m_source = null;
	}
	
	/** 圖像源. */
	public function get source() : Object {
		return m_source;
	}
	
	public function set source( v:Object ) : void {
		this.doStopLoad();
		if (!this.toCheckSource((v is String) ? v as String : getQualifiedClassName(v))) {
			return;
		}
		this.____doSetSource(v);
	}
	
	/** 是否對使用的圖像進行緩存. */
	public function get cached() : Boolean {
		return !m_uncached;
	}
	
	public function set cached( b:Boolean ) : void {
		if (m_uncached == b) {
			if (m_prop) {
				LogMachine.g_instance.error(this, "set cached", "該屬性僅可在設定圖像之前使用 !!!");
			}
			m_uncached = !b;
		}
	}
	
	/** 加載圖像時的臨時顯示. */
	public function get optional() : Object {
		return m_optional;
	}
	
	public function set optional( v:Object ) : void {
		m_optional = (v is String) ? v as String : getQualifiedClassName(v);
	}
	
	
	
	/** @private */
	agony_internal var m_source:String;
	/** @private */
	agony_internal var m_prop:BitmapProp;
	/** @private */
	agony_internal var m_loader:ALoader;
	/** @private */
	agony_internal var m_uncached:Boolean;
	/** @private */
	agony_internal var m_optional:String;
	
	
	
	/** @private */
	agony_internal function setProp( prop:BitmapProp ) : void {
		m_prop = null;
		m_source = null;
	}
	
	/** @private */
	override agony_internal function ____doValidateType() : void {
		if (getQualifiedClassName(this) == "org.agony2d.display::AbstractImageUU") {
			LogMachine.g_instance.error(this, "constructor", "抽象類不可實例化.")
		}
	}
	
	/** @private */
	override agony_internal function doDispose() : void {
		this.doStopLoad();
		super.doDispose();
	}
	
	/** @private */
	[Inline]
	final agony_internal function doStopLoad() : void {
		if (m_loader) {
			m_loader.removeEventListener(AEvent.COMPLETE,       ____onComplete);
			m_loader.removeEventListener(IOErrorEvent.IO_ERROR, ____onError);
			m_loader = null;
		}
	}
	
	/** @private */
	[Inline]
	final agony_internal function toCheckSource( id:String ) : Boolean {
		if (id == null) {
			LogMachine.g_instance.error(this, "toCheckSource", "Source do not be null !!!");
		}
		if (m_source == id) {
			return false;
		}
		m_source = id;
		m_prop = g_bitmapDataMap[id];
		return true;
	}
	
	/** @private */
	agony_internal function ____doSetSource( data:* ) : void {
		
	}
	
	/** @private */
	agony_internal function ____onComplete( e:AEvent ) : void {
		if (!m_uncached) {
			g_bitmapDataMap[m_source] = m_prop;
		}
		m_loader = null;
		this.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
	/** @private */
	final agony_internal function ____onError( e:IOErrorEvent ) : void {
		LogMachine.g_instance.warning(this, "____onError", "Error URL: [ {0} ].", m_loader.url);
		m_loader = null;
		this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR, e.text, e.errorID, e.info));
	}
}
}