package org.agony2d.display.components {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getQualifiedClassName;
	import org.agony2d.display.inside.AAManager;
	
    import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.display.ImageAA;
	import org.agony2d.display.textures.TempFullTexture;
	import org.agony2d.loading.ALoader;
	import org.agony2d.loading.LoadManager;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
	/** 圖片加載完成時觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
public class ImageLoaderAA extends ImageAA {
    
	/** 設置位圖數據.
	 * @param	data
	 */
	public function setBitmapData( data:BitmapData ) : void {
		var tex:TempFullTexture;
		var date:Date;
		
		this.doCheckAndStopLoad();
		this.doUpdateOldSourceUseCount();
		date      =  new Date;
		m_source  =  this.textureData  =  date.toUTCString() + "_" + (++g_tmpTexCount);
		tex       =  TempFullTexture.getTempFullTexture(m_source, false);
		tex.addUseCount(false);
		tex.uploadFromBitmapData(data);
	}
	
	/** 嵌入圖像.
	 * @param	imgRef
	 * @param	cached
	 */
	public function embed( imgRef:*, cached:Boolean = false ) : void {
		var tex:TempFullTexture;
		
		this.doCheckAndStopLoad();
		this.doUpdateOldSourceUseCount();
		m_source  =  this.textureData  =  (imgRef is String) ? imgRef as String : getQualifiedClassName(imgRef);
		tex       =  TempFullTexture.getTempFullTexture(m_source, false);
		tex.addUseCount(cached);
		if (!tex.enabled) {
			if (tex.getLastUploadedData()) {
				tex.uploadFromBitmapData(tex.getLastUploadedData() as BitmapData);
			}
			else {
				tex.uploadFromBitmapData((new imgRef).bitmapData);
			}
		}
	}
	
	/** 加載并顯示圖像.
	 * @param	imgURL
	 * @param	optional
	 * @param	cached
	 */
	public function load( imgURL:String, optional:String = null, cached:Boolean = false ) : void {
		var tex:TempFullTexture;
		
		this.doCheckAndStopLoad();
		this.doUpdateOldSourceUseCount();
		tex = TempFullTexture.getTempFullTexture(imgURL, false);
		tex.addUseCount(cached);
		if (tex.enabled) {
			m_source = this.textureData = imgURL;
			if (tex.getLastUploadedData()) {
				tex.uploadFromBitmapData(tex.getLastUploadedData() as BitmapData);
			}
		}
		else {
			this.textureData  =  optional;
			m_source          =  imgURL;
			m_loader          =  LoadManager.getInstance().getLoader(imgURL);
			m_loader.addEventListener(AEvent.COMPLETE,       ____onComplete);
			m_loader.addEventListener(IOErrorEvent.IO_ERROR, ____onError);
		}
	}
	
	
	
	/** @private */
	agony_internal var m_loader:ALoader;
	/** @private */
	agony_internal var m_source:String;
	
	
	
	override agony_internal function doDispose() : void {
		this.doCheckAndStopLoad();
		this.doUpdateOldSourceUseCount();
		super.doDispose();
	}
	
	//==  event  ==============================================================
	
	agony_internal function ____onComplete( e:AEvent ) : void {
		var tex:TempFullTexture;
		
		tex               =  TempFullTexture.getTempFullTexture(m_loader.url, false);
		this.textureData  =  m_source;
		if (!tex.enabled) {
			tex.uploadFromBitmapData((m_loader.data as Bitmap).bitmapData);
		}
		m_loader          =  null;
		this.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
	agony_internal function ____onError( e:IOErrorEvent ) : void {
		LogMachine.g_instance.warning(this, "____onError", "IO: " + m_loader.url);
		m_loader = null;
		m_source = null;
	}
	
	//==  helper  ==============================================================
	
	[Inline]
	final agony_internal function doCheckAndStopLoad() : void {
		if (m_loader) {
			m_loader.removeEventListener(AEvent.COMPLETE,       ____onComplete);
			m_loader.removeEventListener(IOErrorEvent.IO_ERROR, ____onError);
			m_loader = null;
		}
	}
	
	[Inline]
	final agony_internal function doUpdateOldSourceUseCount() : void {
		if (m_source != null) {
			TempFullTexture.getTempFullTexture(m_source, false).disposeByUseCount();
		}
	}
}
}