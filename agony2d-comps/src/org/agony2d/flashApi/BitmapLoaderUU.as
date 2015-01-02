package org.agony2d.flashApi {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import org.agony2d.resources.TAssetBundle;
	import org.agony2d.resources.TResourceManager;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractImageLoaderUU;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.flashApi.inside.flashViews.FlashAutoSmoothBitmap;
	import org.agony2d.events.AEvent;
	import org.agony2d.loading.LoadManager;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.resources.TAssetData;
	
	use namespace agony_internal;
	
public class BitmapLoaderUU extends AbstractImageLoaderUU {
	
	override public function set bitmapData( v:BitmapData ) : void {
		super.bitmapData = v;
		m_bmpRenderer.bitmapData = v;
	}
	
	
	
	/** @private */
	agony_internal var m_bmpRenderer:FlashAutoSmoothBitmap;
	
	
	
	/** @private */
	override public function onPostUpdate() : void {
		super.onPostUpdate();
		if (m_prop) {
			this.dispatchDirectEvent(AEvent.COMPLETE);
		}
	}
	
	/** @private */
	override agony_internal function setProp( prop:BitmapProp ) : void {
		super.setProp(prop);
		m_bmpRenderer.bitmapData = prop.m_data;
	}
	
	/** @private */
	[Inline]
	final override agony_internal function ____doValidateType() : void {
		
	}
	
	/** @private */
	override agony_internal function ____doRegisterRenderer() : void {
		m_flashView = m_bmpRenderer = FlashAutoSmoothBitmap.toAutoSmoothBitmap(this);
	}
	
	/** @private */
	override agony_internal function ____doSetSource( data:* ) : void {
		var BP:Bitmap;
		var prop:BitmapProp;
		
		if (!m_prop) {
			if (data is TAssetData) {
				if ((data as TAssetData).data == null) {
					LogMachine.g_instance.error(this, "____doSetSource", "Null AssetData: [ {0} ] !!!", (data as TAssetData).id);
				}
				m_prop = new BitmapProp(toSuitableRatioBitmap((data as TAssetData).data as BitmapData));
				if (!m_uncached) {
					g_bitmapDataMap[(data as TAssetData).id] = m_prop;
				}
				m_bmpRenderer.bitmapData = m_prop.m_data;
			}
			else if (data is Class) {
				try {
					BP = new data();
				}
				catch ( err:Error ) {
					LogMachine.g_instance.error(this, "____doSetSource", "Data type error: [ {0} ] !!!", new data);
				}
				m_prop = new BitmapProp(toSuitableRatioBitmap(BP.bitmapData));
				if (!m_uncached) {
					g_bitmapDataMap[m_source] = m_prop;
				}
				m_bmpRenderer.bitmapData = m_prop.m_data;
			}
			else if (data is String) {
				if (m_optional != null) {
					prop = g_bitmapDataMap[m_optional];
					if (!prop) {
						LogMachine.g_instance.error(this, "____doLoad", "Null optional: [ {0} ] !!!", m_optional);
					}
					m_bmpRenderer.bitmapData = prop.m_data;
				}
				m_loader = LoadManager.getInstance().getLoader(TAssetBundle.g_externalField + String(m_source));
				m_loader.addEventListener(AEvent.COMPLETE,       ____onComplete);
				m_loader.addEventListener(IOErrorEvent.IO_ERROR, ____onError);
			}
			else {
				LogMachine.g_instance.error(this, "____doSetSource", "Source arg error: [ {0} ] !!!", data);
			}
		}
		else {
			m_bmpRenderer.bitmapData = m_prop.m_data;
			if (m_prop.m_isLoaded) {
				this.____doAddToPostUpdateList();
			}
		}
	}
	
	/** @private */
	override agony_internal function ____onComplete( e:AEvent ) : void {
		m_prop = new BitmapProp(toSuitableRatioBitmap((m_loader.data as Bitmap).bitmapData));
		m_prop.m_isLoaded = true;
		m_bmpRenderer.bitmapData = m_prop.m_data;
		super.____onComplete(e);
	}
	
	/** @private */
	override agony_internal function doCheckSmoothingState( smoothing:Boolean, external:Boolean ) : void {
		if (external) {
			m_externalAltered = smoothing;
		}
		else {
			m_internalAltered = smoothing;
		}
		m_bmpRenderer.smoothing = (m_internalAltered || m_externalAltered);
	}
}
}