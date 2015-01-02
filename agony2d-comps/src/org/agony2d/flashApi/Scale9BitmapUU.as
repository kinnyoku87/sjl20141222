package org.agony2d.flashApi {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import org.agony2d.base.FrameManager;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractImageLoaderUU;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.flashApi.inside.Scale9BitmapProp;
	import org.agony2d.flashApi.inside.flashViews.FlashAutoSmoothBitmap;
	import org.agony2d.resources.TAssetData;
	
	use namespace agony_internal;
	
	// 進行圖像緩存時，不僅要緩存原始圖像，還要額外對每個繪製過的不同大小的圖像進行緩存.
	// 這樣可以最大限度提高性能，并可通過釋放緩存來保證靈活性.
	
	/** 默認的cached屬性為true. */
	
	// 改為Scale9ImageUU，構造方法中加入hasPivot屬性.
public class Scale9BitmapUU extends AbstractImageLoaderUU {
	
	/** 圖像數據. */
	override public function get bitmapData() : BitmapData {
		return m_bmpRenderer.bitmapData;
	}
	
	override public function set bitmapData( v:BitmapData ) : void {
		super.bitmapData = v;
		if (v) {
			m_prop = new Scale9BitmapProp(v);
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
		else {
			m_bmpRenderer.bitmapData = null;
		}
	}
	
	override public function get width() : Number {
		return (isNaN(m_realityWidth) ? (m_prop ? (m_prop as Scale9BitmapProp).minWidth : 0) : m_realityWidth) / g_pixelRatio;
	}
	
	override public function set width( v:Number ) : void {
		v = Math.ceil(v * g_pixelRatio);
		if (m_realityWidth != v) {
			m_realityWidth = v;
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
	}
	
	override public function get height() : Number {
		return (isNaN(m_realityHeight) ? (m_prop ? (m_prop as Scale9BitmapProp).minHeight : 0) : m_realityHeight) / g_pixelRatio ;
	}
	
	override public function set height( v:Number ) : void {
		v = Math.ceil(v * g_pixelRatio);
		if (m_realityHeight != v) {
			m_realityHeight = v;
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
	}
	
	//override public function revert() : void {
		//if (m_flags & FLAG_PRE_RENDER) {
			//FrameManager.doRemovePreRenderObject(this);
		//}
		//super.revert();
	//}
	
	
	
	/** @private */
	agony_internal var m_bmpRenderer:FlashAutoSmoothBitmap;
	/** @private */
	agony_internal var m_realityWidth:Number; // 真實寬度.
	/** @private */
	agony_internal var m_realityHeight:Number; // 真實高度.
	
	
	
	/**
	 * @private
	 * 加入到預渲染列表.
	 */
	//agony_internal function ____doAddToPreRenderList() : void {
		//if (!(m_flags & FLAG_PRE_RENDER)) {
			//FrameManager.doAddPreRenderObject(this);
			//m_flags |= FLAG_PRE_RENDER;
		//}
	//}
	
	/** @private */
	//public function onPreRender() : void {
		//if (m_prop) {
			//m_bmpRenderer.bitmapData = (m_prop as Scale9BitmapProp).toBitmapDataBySize(this.width * g_pixelRatio, this.height * g_pixelRatio);
		//}
	//}
	
	override public function onPostUpdate() : void {
		super.onPostUpdate();
		if (m_prop && (m_flags & FLAG_RESIZE)) {
			m_flags &= ~FLAG_RESIZE;
			m_bmpRenderer.bitmapData = (m_prop as Scale9BitmapProp).toBitmapDataBySize(this.width * g_pixelRatio, this.height * g_pixelRatio);
		}
	}
	
	/** @private */
	override agony_internal function setProp( prop:BitmapProp ) : void {
		super.setProp(prop);
		m_prop = prop;
		//this.____doAddToPreRenderList();
		
		m_flags |= FLAG_RESIZE;
		this.____doAddToPostUpdateList();
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
		
		if (!m_prop) {
			if (data is TAssetData) {
				if ((data as TAssetData).data == null) {
					LogMachine.g_instance.error(this, "____doSetSource", "Null AssetData: [ {0} ] !!!", (data as TAssetData).id);
				}
				m_prop = new Scale9BitmapProp(toSuitableRatioBitmap((data as TAssetData).data as BitmapData));
				if (!m_uncached) {
					g_bitmapDataMap[(data as TAssetData).m_id] = m_prop;
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
				m_prop = new Scale9BitmapProp(toSuitableRatioBitmap(BP.bitmapData));
				if (!m_uncached) {
					g_bitmapDataMap[m_source] = m_prop;
				}
				//this.____doAddToPreRenderList();
				
				m_flags |= FLAG_RESIZE;
				this.____doAddToPostUpdateList();
			}
			else if (data is String) {
				LogMachine.g_instance.error(this, "load", "Scale9 bitmap loading unavailable !!!");
			}
			else {
				LogMachine.g_instance.error(this, "____doSetSource", "Source arg error: [ {0} ] !!!", data);
			}
		}
		else {
			if (!(m_prop is Scale9BitmapProp)) {
				LogMachine.g_instance.warning(this, "____doSetSource", "之前緩存的圖像為非九宮格型: [ {0} ] !!!", m_source);
				m_prop = g_bitmapDataMap[m_source] = new Scale9BitmapProp(toSuitableRatioBitmap(m_prop.m_data));
			}
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
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