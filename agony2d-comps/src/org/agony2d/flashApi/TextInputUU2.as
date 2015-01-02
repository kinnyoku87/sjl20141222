package org.agony2d.flashApi {
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import org.agony2d.display.events.NodeEvent;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	use namespace event_internal;
	
	[Event(name = "change",   type = "org.agony2d.events.AEvent")]
	
	[Event(name = "focusIn",  type = "org.agony2d.display.events.NodeEvent")]
	
	[Event(name = "focusOut", type = "org.agony2d.display.events.NodeEvent")]
	
public class TextInputUU2 extends RawSpriteUU {
	
	public function TextInputUU2( isFocusIn:Boolean = true ) {
		m_textField                    =  new TextField;
		m_textFormat                   =  new TextFormat;
		m_textField.type               =  TextFieldType.INPUT;
		m_textField.needsSoftKeyboard  =  true;
		
		this.addChild(m_textField);
		m_textField.addEventListener(Event.CHANGE,         ____onTextInput);
		m_textField.addEventListener(FocusEvent.FOCUS_IN,  ____onFocusIn);
		m_textField.addEventListener(FocusEvent.FOCUS_OUT, ____onFocusOut);
		this.addEventListener(ATouchEvent.PRESS,           ____onPress);
		this.addEventListener("addedToRoot", function(e:AEvent):void {
			if (isFocusIn) {
				root.stage.focus = m_textField;
			}
		});
		
	}
	
	public function set width( v:Number ) : void {
		m_textField.width = v;
	}
	
	public function set height( v:Number ) : void {
		m_textField.height = v;
	}
	
	/**
	 * 文本內容.
	 */
	public function get text() : String { 
		return m_textField.text;
	}
	
	public function set text( v:String ) : void { 
		m_textField.text = v;
	}
	
	/**
	 * 字體類型.
	 */
	public function get font() : String { 
		return m_textFormat.font as String;
	}
	
	public function set font( v:String ) : void {
		m_textFormat.font = v;
		m_textField.defaultTextFormat = m_textFormat;
		m_textField.setTextFormat(m_textFormat);
	}
	
	/**
	 * 字體大小.
	 */
	public function get size() : int { 
		return m_textFormat.size as int;
	}
	
	public function set size( v:int ) : void {
		m_textFormat.size = v;
		m_textField.defaultTextFormat = m_textFormat;
		m_textField.setTextFormat(m_textFormat);
	}
	
	/**
	 * 字體顏色.
	 */
	public function get color() : uint { 
		return m_textFormat.color as uint 
	}
	
	public function set color( v:uint ) : void {
		m_textFormat.color = v;
		m_textField.defaultTextFormat = m_textFormat;
		m_textField.setTextFormat(m_textFormat);
	}
	
	/**
	 * 是否具有邊框.
	 */
	public function get border() : Boolean {
		return m_textField.border;
	}
	
	public function set border( b:Boolean ) : void {
		m_textField.border = b;
	}
	
	/**
	 * 邊框顏色.
	 */
	public function get borderColor() : uint {
		return m_textField.borderColor;
	}
	
	public function set borderColor( v:uint ) : void {
		m_textField.borderColor = v;
	}
	
	/**
	 * 是否具有背景顏色.
	 */
	public function get background() : Boolean {
		return m_textField.background;
	}
	
	public function set background( b:Boolean ) : void {
		m_textField.background = b;
	}
	
	/**
	 * 背景顏色.
	 */
	public function get backgroundColor() : uint {
		return m_textField.backgroundColor;
	}
	
	public function set backgroundColor( v:uint ) : void {
		m_textField.backgroundColor = v;
	}
	
	/**
	 * 最多可包含的字符數.
	 */
	public function get maxChars() : int { 
		return m_textField.maxChars;
	}
	
	public function set maxChars( v:int ) : void { 
		m_textField.maxChars = v;
	}
	
	/**
	 * 是否為多行文本字段.
	 */
	public function get multiline() : Boolean { 
		return m_textField.multiline;
	}
	
	public function set multiline( b:Boolean ) : void { 
		m_textField.multiline = b;
	}
	
	/** 是否自動換行. */
	public function get wordWrap() : Boolean { 
		return m_textField.wordWrap;
	}
	
	public function set wordWrap( b:Boolean ) : void { 
		m_textField.wordWrap = b;
	}
	
	/**
	 * 指示用戶可輸入到文本字段中的字符集.
	 */
	public function get restrict() : String {
		return m_textField.restrict;
	}
	
	public function set restrict( v:String ) : void {
		m_textField.restrict = v;
	}
	
	/**
	 * 是否為密碼形式.
	 */
	public function get displayAsPassword() : Boolean {
		return m_textField.displayAsPassword;
	}
	
	public function set displayAsPassword( b:Boolean ) : void {
		m_textField.displayAsPassword = b;
	}
	
	/**
	 * 是否為嵌入型字體.
	 */
	public function get embedFonts() : Boolean {
		return m_textField.embedFonts;
	}
	
	public function set embedFonts( b:Boolean ) : void {
		m_textField.embedFonts = b;
	}
	
	/**
	 * 抗鋸齒類型.
	 */
	public function get antiAliasType() : String {
		return m_textField.antiAliasType;
	}
	
	public function set antiAliasType( v:String ) : void {
		m_textField.antiAliasType = v;
	}
	
	/**
	 * 邊緣粗細.
	 */
	public function get thickness() : Number {
		return m_textField.thickness;
	}
	
	public function set thickness( v:Number ) : void {
		m_textField.thickness = v;
	}
	
	
	
	/** @private */
	agony_internal var m_textField:TextField;
	/** @private */
	agony_internal var m_textFormat:TextFormat;
	/** @private */
	agony_internal var m_isFocusIn:Boolean;
	/** @private */
	agony_internal var m_index_A:int;
	
	
	
	/** @private */
	override public function onPostUpdate() : void {
		super.onPostUpdate();
		if (!m_isFocusIn) {
			//this.dispatchDirectEvent(AEvent.FOCUS_OUT);
			
			this.dispatchEvent(NodeEvent.cachedFocusOutEvt);
			//trace("FOCUS_OUT");
		}
		else {
			m_textField.requestSoftKeyboard();
			//this.dispatchDirectEvent(AEvent.FOCUS_IN);
			
			this.dispatchEvent(NodeEvent.cachedFocusInEvt);
			//trace("FOCUS_IN");
		}
	}
	
	/** @private */
	override agony_internal function doDispose() : void {
		m_textField.removeEventListener(Event.CHANGE,         ____onTextInput);
		m_textField.removeEventListener(FocusEvent.FOCUS_IN,  ____onFocusIn);
		m_textField.removeEventListener(FocusEvent.FOCUS_OUT, ____onFocusOut);
		super.doDispose();
	}
	
	/** @private */
	agony_internal function ____onPress( e:ATouchEvent ) : void {
		var rect:Rectangle;
		
		m_index_A = this.____toSelectedIndex();
		this.____doTextPressed(m_index_A, m_index_A);
		
		this.addEventListener(ATouchEvent.MOVE,    ____onSelectTextArea);
		this.addEventListener(ATouchEvent.RELEASE, ____onRelease);
	}
	
	/** @private */
	// 距离最近char.
	agony_internal function ____toSelectedIndex() : int {
		var index:int;
		var index_A:int;
		var index_C:int;
		var index_R:int;
		var rect:Rectangle;
		var touchX:Number;
		var touchY:Number;
		var widthTxt:Number;
		var heightTxt:Number;
		var numCharsLine:int;
		var charRect:Rectangle;
		
		touchX = m_textField.mouseX;
		touchY = m_textField.mouseY;
		widthTxt = m_textField.width;
		heightTxt = m_textField.height;
		
		index = m_textField.getCharIndexAtPoint(touchX, touchY);
		// 文字外.
		if (index == -1) {
			// 判断在哪行.
			index_R = m_textField.getLineIndexAtPoint(widthTxt / 2, touchY);
			// 确定Row.
			if (index_R > -1) {
				if (touchX > widthTxt / 2) {
					index_C = m_textField.getLineOffset(index_R) + m_textField.getLineLength(index_R) - 1;
				}
				else {
					index_C = m_textField.getLineOffset(index_R) - 1;
				}
			}
			// .
			else {
				
			}
		}
		else {
			index_R = m_textField.getLineIndexOfChar(index);
			index_C = index - m_textField.getLineOffset(index_R);
			
			rect = m_textField.getCharBoundaries(index);
			if (m_textField.scrollH + m_textField.mouseX > rect.x + rect.width * .5) {
				index += 1;
			}
		}
		//if (touchX < 0) {
			//touchX = 0;
		//}
		//else if (touchX > m_textField.width) {
			//touchX = m_textField.width;
		//}
		//if (touchY < 0) {
			//touchY = 0;
		//}
		//else if (touchY > m_textField.height) {
			//touchY = m_textField.height;
		//}
		//index = m_textField.getCharIndexAtPoint(m_textField.scrollH + m_textField.mouseX, m_textField.scrollV + m_textField.mouseY);
		
		//index_A = m_textField.getLineIndexAtPoint(touchX, touchY);
		
		//numCharsLine = m_textField.getLineLength(index_R);
		//charRect = m_textField.getCharBoundaries(index);
		trace(index_R, index_C, index, touchX, touchY);
		
		//trace(index);
		//if (index == -1) {
			//if(m_textField.mouseX + m_textField.scrollH > m_textField.textWidth) {
				//index = m_textField.length;
			//}
		//}
		//else {
			//rect = m_textField.getCharBoundaries(index);
			//if (m_textField.scrollH + m_textField.mouseX > rect.x + rect.width * .5) {
				//index += 1;
			//}
		//}
		
		return index;
	}
	
	/** @private */
	agony_internal function ____doTextPressed( beginIndex:int, endIndex:int ) : void {
		this.root.stage.focus = m_textField;
		m_textField.setSelection(beginIndex, endIndex);
	}
	
	/** @private */
	agony_internal function ____onSelectTextArea( e:ATouchEvent ) : void {
		m_textField.setSelection(m_index_A, this.____toSelectedIndex());
	}
	
	/** @private */
	agony_internal function ____onRelease( e:ATouchEvent ) : void {
		this.removeEventListener(ATouchEvent.MOVE,    ____onSelectTextArea);
		this.removeEventListener(ATouchEvent.RELEASE, ____onRelease);
	}
	
	/** @private */
	agony_internal function ____onTextInput( e:Event ) : void {
		this.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	/** @private */
	agony_internal function ____onFocusIn( e:FocusEvent ) : void {
		this.____doAddToPostUpdateList();
		m_isFocusIn = true;
	}
	
	/** @private */
	agony_internal function ____onFocusOut( e:FocusEvent ) : void {
		this.____doAddToPostUpdateList();
		m_isFocusIn = false;
	}
}
}