package utils
{
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextFieldAutoSize;
	import org.agony2d.utils.ColorUtil;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.LabelUU;

	// 嵌入字體，旋轉後可能無法顯示.
	// 設定字體width,height，不會影響scale值.
	public class TextUtil
	{
		
		public static var FONT_A:String = "微软雅黑";
		
//		private static var FONT_A:String = "黑体";
		
		public static function createLabel( text:*, size:uint, color:uint, bold:Boolean = true, letterSpacing:int = 1, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU;
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		public static function createLabelBlur( text:*, size:uint, color:uint, bold:Boolean = true, letterSpacing:int = 1, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU;
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength), new BlurFilter(1.1, 1.1)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		public static function createLabelBlur2( text:*, size:uint, color:uint, bold:Boolean = true, letterSpacing:int = 1, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU;
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength), new BlurFilter(1.6, 1.6)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		//public static function createLabelBlur3( text:*, size:uint, color:uint, bold:Boolean = true, letterSpacing:int = 1, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			//var label:LabelUU;
			//
			//label = new LabelUU;
			//label.font = font ? font : FONT_A;
			//label.text = String(text);
			//label.color = color;
			//label.size = size;
			//label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength), new BlurFilter(1.88, 1.88)];
			//label.letterSpacing = letterSpacing;
			//label.bold = bold;
			//label.touchable = false;
			//return label;
		//}
		
		// 卡牌名稱
		public static function createLabel2( text:String, size:uint, color:uint, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU;
			label.font = font ? font : FONT_A;
			label.text = text;
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength, 1)];
			label.letterSpacing = 3;
			label.bold = false;
			label.touchable = false;
			return label;
		}
		
		public static function createLabel3( text:String, size:uint, color:uint, bold:Boolean, letterSpacing:Number = 1, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU;
			label.font = font ? font : FONT_A;
			label.text = text;
			label.color = color;
			label.size = size;
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		// 卡牌描述.
		public static function createLabel4( text:String, size:uint, color:uint, width:Number, height:Number = NaN, letterSpacing:int = 1, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU("none");
			label.font = font ? font : FONT_A;
			label.text = text;
			label.color = color;
			label.size = size;
			label.letterSpacing = letterSpacing;
			label.width = width;
			if (!isNaN(height)) {
				label.height = height;
			}
			//else {
				//label.height = 600
			//}
			//
//			label.background = true;
//			label.backgroundColor = 0xdddd33;
			
//			label.bold = true;
			label.wordWrap = true;
			label.touchable = false;
			
			
			return label;
		}
		
		public static function createLabel5( text:*, size:uint, color:uint, bold:Boolean = true, letterSpacing:int = 1, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			var label:LabelUU;
			
			label = new LabelUU("none");
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x11, 0.9, blur, blur, glowStrength)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		// 不固定的文本，（很多地方需要自己设置样式）
		public static function createLabel6( text:*, size:uint, color:uint, bold:Boolean = true,filterColor:int = ColorUtil.BLACK, blur:Number = 2,auto:String = TextFieldAutoSize.CENTER, font:String = null , letterSpacing:int = 1, glowStrength:Number = 22 ) : LabelUU {
			var label:LabelUU;
			label = new LabelUU(auto);
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			if (filterColor != -1) {
				label.filters = [new GlowFilter(filterColor, 1, blur, blur, glowStrength)];
			}
			
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		
		public static function decorateLabel( label:LabelUU, size:uint, color:uint, bold:Boolean = true, blur:Number = 3.5, glowStrength:Number = 22, font:String = null ) : LabelUU {
			label.font = font ? font : FONT_A;
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x0, 0.9, blur, blur, glowStrength, 1)];
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		public static function decorateLabel2( label:LabelUU, text:String, size:uint, color:uint, letterSpacing:Number, blur:Number = 3, glowStrength:Number = 22, font:String = null ) : void {
			label.font = font ? font : FONT_A;
			label.text = text;
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x0, 1, blur, blur, glowStrength, 2)];
			label.letterSpacing = letterSpacing;
			label.bold = false;
			label.touchable = false;
		}
		
	
		
		public static function decorateLabel3( label:LabelUU, size:uint, color:uint, letterSpacing:Number, bold:Boolean, blur:Number = 3, glowStrength:Number = 22, font:String = null ) : LabelUU {
			label.font = font ? font : FONT_A;
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x0, 1, blur, blur, glowStrength, 2)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
			return label;
		}
		
		
		
		// 竖排.
		public static function decorateLabel4( label:LabelUU, text:String, size:uint, color:uint, bold:Boolean = true, blur:Number = 2.2, glowStrength:Number = 16, font:String = null ) : void {
			label.font = font ? font : FONT_A;
			label.text = text;
			label.color = color;
			label.size = size;
			label.width = 40;
			label.filters = [new GlowFilter(0x0, 1, blur, blur, glowStrength, 3)];
			label.bold = bold;
			label.wordWrap = true;
		}
		
		// 竖排.
		public static function decorateLabel5( label:LabelUU, text:String, size:uint, color:uint, bold:Boolean = true, blur:Number = 2, glowStrength:Number = 16, font:String = null ) : LabelUU {
			label.font = font ? font : FONT_A;
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(0x0, 1, blur, blur, glowStrength, 3)];
			label.bold = bold;
			label.text = text;
			label.wordWrap = true;
			label.width = 25 ;
			label.height = 50 ;
			label.leading = 2;
			label.letterSpacing = 2;
			
			return label;
		}
		
		
		public static function decorateLabel6( label:LabelUU,text:String,size:uint, color:uint, bold:Boolean = true,filterColor:uint = ColorUtil.BLACK, blur:Number = 2, font:String = null , letterSpacing:int = 1, glowStrength:Number = 22 ) : void {
			label.font = font ? font : FONT_A;
			label.text = String(text);
			label.color = color;
			label.size = size;
			label.filters = [new GlowFilter(filterColor, 1, blur, blur, glowStrength)];
			label.letterSpacing = letterSpacing;
			label.bold = bold;
			label.touchable = false;
		}
	}
}