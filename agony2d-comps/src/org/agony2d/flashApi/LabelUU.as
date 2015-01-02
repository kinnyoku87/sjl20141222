package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.inside.flashViews.FlashTextField;
	import org.agony2d.inputs.Touch;
	
	use namespace agony_internal;
	
	// Flash字體無法旋轉，否則無法顯示 !!!
public class LabelUU extends NodeUU {
	
	public function get textWidth() : Number {
		return m_textRenderer.textWidth / g_pixelRatio;
	}
	
	public function get textHeight() : Number {
		return m_textRenderer.textHeight / g_pixelRatio;
	}
	
	/**
	 * Constructor.
	 * 
	 * @param	autoSize	文本大小與對齊的自動調整類型.
	 */
	public function LabelUU( autoSize:String = "left" ) {
		m_textRenderer.autoSize = autoSize;
	}
	
	/** 默認字體. */
	public static function get defaultFont() : String {
		return g_defaultFont;
	}
	
	public static function set defaultFont( v:String ) : void {
		g_defaultFont = v;
	}
	
	/**
	 * 文本寬度.
	 */
	public function set width( v:Number ) : void {
//		if(m_textRenderer.autoSize != "none"){
//			m_textRenderer.autoSize = "none";
//			m_textRenderer.wordWrap = true;
//		}
		m_textRenderer.width = v// * g_pixelRatio;
		
//		trace("label - ", v);
	}
	
	/**
	 * 文本高度.
	 */
	public function set height( v:Number ) : void {
//		if(m_textRenderer.autoSize != "none"){
//			m_textRenderer.autoSize = "none";
//			m_textRenderer.wordWrap = true;
//		}
		m_textRenderer.height = v //* g_pixelRatio;
	}
	
	/**
	 * 文本內容.
	 */
	public function get text() : String {
		return m_text;
	}
	
	public function set text( v:String ) : void {
		m_text = v;
		this.____doReset();
	}
	
	/**
	 * html文本內容.
	 */
	public function get htmlText() : String {
		return m_textRenderer.htmlText;
	}
	
	public function set htmlText( v:String ) : void {
		m_textRenderer.htmlText = v;
	}
	
	/**
	 * 文本顏色.
	 */
	public function get color() : uint {
		return m_color;
	}
	
	public function set color( v:uint ) : void {
		m_color = v;
		this.____doReset();
	}
	
	/**
	 * 文本大小.
	 */
	public function get size() : uint {
		return m_size;
	}
	
	public function set size( v:uint ) : void {
		m_size = (v == 0) ? 1 : v;
		this.____doReset();
	}
	
	/**
	 * 字體類型.
	 */
	public function get font() : String {
		return m_font;
	}
	
	public function set font( v:String ) : void {
		if(m_font != v){
			m_font = v;
			this.____doReset();
		}
	}
	
	/**
	 * 是否為粗體.
	 */
	public function get bold() : Boolean {
		return m_bold;
	}
	
	public function set bold( b:Boolean ) : void {
		if(m_bold != b){
			m_bold = b;
			this.____doReset();
		}
	}
	
	public function get letterSpacing() : Number {
		return m_letterSpacing;
	}
	
	public function set letterSpacing( v:Number ) : void {
		if (m_letterSpacing != v) {
			m_letterSpacing = v;
			this.____doReset();
		}
	}
	
	public function get leading() : Object {
		return m_leading;
	}
	
	public function set leading( v:Object ) : void {
		if (m_leading != v) {
			m_leading = v;
			this.____doReset();
		}
	}
	
	/**
	 * 文本內部對齊類型.
	 */
	//public function get align() : String {
		//return m_align;
	//}
	//
	//public function set align( v:String ) : void {
		//m_align = v;
		//this.____doReset();
	//}
	
	/**
	 * 是否具有邊框.
	 */
	public function get border() : Boolean {
		return m_textRenderer.border;
	}
	
	public function set border( b:Boolean ) : void {
		m_textRenderer.border = b;
	}
	
	/**
	 * 邊框顏色.
	 */
	public function get borderColor() : uint {
		return m_textRenderer.borderColor;
	}
	
	public function set borderColor( v:uint ) : void {
		m_textRenderer.borderColor = v;
	}
	
	/**
	 * 是否具有背景顏色.
	 */
	public function get background() : Boolean {
		return m_textRenderer.background;
	}
	
	public function set background( b:Boolean ) : void {
		m_textRenderer.background = b;
	}
	
	/**
	 * 背景顏色.
	 */
	public function get backgroundColor() : uint {
		return m_textRenderer.backgroundColor;
	}
	
	public function set backgroundColor( v:uint ) : void {
		m_textRenderer.backgroundColor = v;
	}
	
	/**
	 * 是否自動換行.
	 */
	public function get wordWrap() : Boolean {
		return m_textRenderer.wordWrap;
	}
	
	public function set wordWrap( b:Boolean ) : void {
		m_textRenderer.wordWrap = b;
	}
	
	/**
	 * 多行
	 */
	public function get multiline() : Boolean {
		return m_textRenderer.multiline;
	}
	
	public function set multiline( b:Boolean ) : void {
		m_textRenderer.multiline = b;
	}
	
	//--  [ Embed Fonts ]  --------------------------------------------------------------
	
	/**
	 * 是否為嵌入型字體.
	 */
	public function get embedFonts() : Boolean {
		return m_textRenderer.embedFonts;
	}
	
	public function set embedFonts( b:Boolean ) : void {
		m_textRenderer.embedFonts = b;
	}
	
	/**
	 * 抗鋸齒類型.
	 */
	public function get antiAliasType() : String {
		return m_textRenderer.antiAliasType;
	}
	
	public function set antiAliasType( v:String ) : void {
		m_textRenderer.antiAliasType = v;
	}
	
	/**
	 * 邊緣粗細.
	 */
	public function get thickness() : Number {
		return m_textRenderer.thickness;
	}
	
	public function set thickness( v:Number ) : void {
		m_textRenderer.thickness = v;
	}
	
	
	
	/** @private */
	agony_internal static var g_defaultFont:String = "Courier New";
	/** @private */
	agony_internal var m_textRenderer:FlashTextField;
	/** @private */
	agony_internal var m_font:String;
	/** @private */
	agony_internal var m_size:uint;
	/** @private */
	agony_internal var m_color:uint;
	/** @private */
	//agony_internal var m_align:String;
	/** @private */
	agony_internal var m_text:String;
	/** @private */
	agony_internal var m_bold:Boolean;
	/** @private */
	agony_internal var m_letterSpacing:Number;
	/** @private */
	agony_internal var m_leading:Object;
	
	
	
	
	
	/** @private */
	override agony_internal function ____doRegisterRenderer() : void {
		m_flashView         =  m_textRenderer     =  FlashTextField.toTextField(this);
		m_flashView.scaleX  =  m_flashView.scaleY  =  g_pixelRatio;
	}
	
	/** @private */
	agony_internal function ____doReset() : void {
		m_textRenderer.htmlText ='<textformat leading="'+(leading ? leading : 0)+'">'+'<p align="'+ m_textRenderer.autoSize +'"> '+ '<font size = "' + (m_size == 0 ? 12 : m_size) + '" face = "' + (m_font ? m_font : g_defaultFont) + '" letterSpacing = "' + (isNaN(m_letterSpacing) ? 0 : m_letterSpacing) + '" color = "#' + m_color.toString(16)  + (m_bold ? '"><b>' : '">') + m_text + (m_bold ? '</b></font>' : '</font>'+'</p></textformat>');
		//m_textComp.htmlText = '<font size = "' + (m_size == 0 ? 12 : m_size) + '" face = "' + m_font + '" color = "#' + m_color.toString(16) + '">' + m_text + '</font>';
		//m_textComp.htmlText = '<font size = "' + (m_size == 0 ? 12 : m_size) + '" face = "' + m_font + '" color = "#' + m_color.toString(16) + '" align = "' + (m_align ? "left" : m_align) + '">' + m_text + '</font>';
	}
}
}