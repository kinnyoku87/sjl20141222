package org.agony2d.flashApi {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.core.AbstractRangeUU;
	import org.agony2d.flashApi.inside.ScrollProgressBarSkin;
	import org.agony2d.resources.TAssetData;
	
	use namespace agony_internal;
	
public class ScrollProgressBarUU extends AbstractRangeUU {
	
	public function ScrollProgressBarUU() {
		//this.model.addEventListener(AEvent.CHANGE, ____onChanged);
		m_startOffset = new Point;
	}
	
	
	public static function addScrollProgressBarSkin( id:String, barIndex:int, assetList:Vector.<TAssetData> ) :  void {
		var data:ScrollProgressBarSkin;
		
		if (!g_scrollProgressBarSkinList) {
			g_scrollProgressBarSkinList = {};
		}
		if (g_scrollProgressBarSkinList[id]) {
			
		}
		else {
			data = g_scrollProgressBarSkinList[id] = new ScrollProgressBarSkin;
			data.assetList = assetList;
			data.barIndex = barIndex;
		}
		
	}
	
	public static function exists( id:String ) :  Boolean {
		return g_scrollProgressBarSkinList[id];
	}
	
	
	
	public function get barScale9Img() : Scale9BitmapUU {
		return m_barScale9Img;
	}
	
	
	public function get skinId() : String {
		return m_skinId;
	}
	
	public function set skinId( v:String ) : void {
		var data:ScrollProgressBarSkin;
		var assetList:Vector.<TAssetData>;
		var i:int;
		var l:int;
		var scale9Img:Scale9BitmapUU;
		
		if (m_skinId != v) {
			m_skinId = v;
			
			data = g_scrollProgressBarSkinList[v];
			assetList = data.assetList;
			
			if (!m_scale9ImgList) {
				m_scale9ImgList = new <Scale9BitmapUU>[];
			}
			l = assetList.length;
			while (i < l) {
				scale9Img = m_scale9ImgList[i] = new Scale9BitmapUU;
				scale9Img.source = assetList[i++];
				this.addNode(scale9Img);
			}
			m_barScale9Img = m_scale9ImgList[data.barIndex];
		}
	}
	
	public function set width( v:Number ) : void {
		var i:int;
		var l:int;
		var scale9Img:Scale9BitmapUU;
		
		l = m_scale9ImgList.length;
		while (i < l) {
			scale9Img = m_scale9ImgList[i++];
			scale9Img.width = v;
		}
	}
	
	public function set height( v:Number ) : void {
		var i:int;
		var l:int;
		var scale9Img:Scale9BitmapUU;
		
		l = m_scale9ImgList.length;
		while (i < l) {
			scale9Img = m_scale9ImgList[i++];
			scale9Img.height = v;
		}
	}
	
	public function setBarStartOffset( offsetX:Number, offsetY:Number ) : void {
		m_startOffset.setTo(offsetX, offsetY);
		this.____onModelChanged(null);
	}
	
	public function setMask( v:RawSpriteUU ) : void {
		if (m_barScale9Img) {
			m_barScale9Img.displayObject.mask = v ? v.displayObject : null;
		}
		
	}
	
	
	
	
	
	
	private static var g_scrollProgressBarSkinList:Object;
	
	private var m_skinId:String;
	
	private var m_barScale9Img:Scale9BitmapUU;
	
	private var m_scale9ImgList:Vector.<Scale9BitmapUU>;
	
	private var m_startOffset:Point;
	
	private var m_mask:RawSpriteUU;
	
	
	
	override agony_internal function doDispose() : void {
		this.setMask(null);
		super.doDispose();
	}
	
	
	override agony_internal function ____onModelChanged(e:AEvent):void {
		m_barScale9Img.x = m_startOffset.x * (1 - this.model.ratio);
		m_barScale9Img.y = m_startOffset.y * (1 - this.model.ratio);
	}
	
}
}