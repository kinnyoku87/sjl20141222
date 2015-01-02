package org.agony2d.display.components {
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import org.agony2d.display.core.NodeAA;
	import org.agony2d.display.textures.DynamicTexture;
	import org.agony2d.display.textures.FullTexture;
	import org.agony2d.display.textures.getNextPowerOfTwo;
    import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.display.core.PixelsAA;
	
	use namespace agony_internal;
	
public class PaperAA extends NodeAA {
    
    public function PaperAA( width:int, height:int, brushFullTex:String ) {
		var realityWidth:int;
		var realityHeight:int;
		var fullWidth:int;
		var fullHeight:int;
		var i:int;
		
		if (width < 32 || height < 32) {
			LogMachine.g_instance.error(this, "constructor", "尺寸錯誤 : " + width + " | " + height + ".");
		}
		m_texList      =  new Vector.<DynamicTexture>(2, true)
		m_paperWidth   =  width;
		m_paperHeight  =  height;
		realityWidth   =  width  * g_pixelRatio;
		realityHeight  =  height * g_pixelRatio;
		fullWidth      =  getNextPowerOfTwo(width);
		fullHeight     =  getNextPowerOfTwo(height);
		m_ratioX       =  width  / fullWidth;
		m_ratioY       =  height / fullHeight;
		while (i < 2) {
			m_texList[i++] = new DynamicTexture(width, height, m_ratioX, m_ratioY, fullWidth, fullHeight);
		}
		m_brushFullTex = g_fullTexMap[brushFullTex];
		if (!m_brushFullTex) {
			LogMachine.g_instance.error(this, "constructor", "No existed brush full tex : " + brushFullTex);
		}
    }
	
	public function paperWidth() : int {
		return m_paperWidth;
	}
	
	public function paperHeight() : int {
		return m_paperHeight;
	}
	
	/** 由圖片獲取紋理數據.
	 * @param	data
	 */
	//public function copyFromBitmap( data:BitmapData ) : void {
		//m_texList[0].uploadFromBitmapData(data);
	//}
	
	/** 繪製.
	 * @param	textureData
	 * @param	matrix
	 * @param	color
	 * @param	alpha
	 */
	public function draw( textureData:String, matrix:Matrix = null, color:uint = 0xFFFFFF, alpha:Number = 1.0 ) : void {
		
	}
	
	
	
	agony_internal var m_texList:Vector.<DynamicTexture>;
	agony_internal var m_ratioX:Number;
	agony_internal var m_ratioY:Number;
	agony_internal var m_paperWidth:int;
	agony_internal var m_paperHeight:int;
	agony_internal var m_brushFullTex:FullTexture;
	
	
	
	override agony_internal function doDispose() : void {
		
	}
	
	override agony_internal function doPreRender() : void {
		
	}
	
	override agony_internal function doRender() : void {
		
	}
}
}