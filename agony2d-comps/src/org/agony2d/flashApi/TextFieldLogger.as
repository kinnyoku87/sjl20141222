package org.agony2d.flashApi {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	import org.agony2d.base.ILogger;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.utils.formatString;
	
	use namespace agony_internal;
	
	/** 調試記錄器. */
public class TextFieldLogger implements ILogger {
	
	public function TextFieldLogger( stage:Stage, isLocatingLeft:Boolean, y:int, width:int = 550, height:int = 550, hasTrace:Boolean = false ) : void {
		m_stage = stage;
		m_sprite = new Sprite;
		m_sprite.graphics.beginFill(0x0, 0.75);
		m_sprite.graphics.drawRect(0, 0, width, height);
		
		//m_sprite.x = x;
		m_isLocatingLeft = isLocatingLeft;
		m_hasTrace = hasTrace;
		
		m_sprite.y = y;
		m_txt = new TextField;
		m_width = m_txt.width = width;
		//m_txt.wordWrap = true;
		//m_txt.multiline = true;
		m_height = m_txt.height = height;
		m_txt.textColor = 0xFFFFFF;
		
		m_sprite.addChild(m_txt);
		
		var css:TextFormat = new TextFormat;
		css.font = "courier New";
		css.leading = 3;
		
		m_txt.defaultTextFormat = css;
		
		stage.addEventListener(Event.RESIZE, onResize);
		
		this.onResize(null);
	}
	
	
	private var m_maxLength:int = 200;
	
	
	private function onResize(e:Event):void {
		if (!m_isLocatingLeft) {
			m_sprite.x = m_stage.stageWidth - m_width;
		}
	}
	
	public function get visible() : Boolean {
		return m_visible;
	}
	
	public function set visible( b:Boolean ) : void {
		if (m_visible == b) {
			return;
		}
		m_visible = b;
		if (m_visible) {
			if (m_hintAY.length > m_maxLength) {
				m_hintAY.shift();
			}
			m_txt.text = m_hintAY.join("\n");
			m_txt.scrollV = m_txt.maxScrollV;
			m_stage.addChild(m_sprite);
			m_txt.scrollH = 0;
			
		}
		else {
			m_stage.removeChild(m_sprite)
		}
	}
	
	private function ____doFlush() : void {
		if (m_hintAY.length > m_maxLength) {
			m_hintAY.shift();
		}
		
		if (!m_visible) {
			return;
		}
		
		m_txt.text = m_hintAY.join("\n");
		m_txt.scrollV = m_txt.maxScrollV;
	}
	
	final public function simplify( hint:*, formatArgs:Array ) : void {
		var STR:String;
		
		STR = formatArgs.length ? formatString(String(hint), formatArgs) : hint;
		
		if (m_hasTrace) {
			trace(STR);
		}
		
		m_hintAY.push(STR);
		____doFlush();
	}
	
	final public function message( module:*, hint:*, formatArgs:Array ) : void {
		var STR:String;
		
		STR = ____toMakeInfo(module) + "...◎  " + (formatArgs.length ? formatString(String(hint), formatArgs) : hint);
		
		if (m_hasTrace) {
			trace(STR);
		}
		
		m_hintAY.push(STR);
		____doFlush();
	}
	
	final public function warning( module:*, method:String, hint:*, formatArgs:Array ) : void {
		var STR:String;
		
		STR = ____toMakeInfo(module) + "...!!! [ " + method + " ]...◎  " + (formatArgs.length ? formatString(String(hint), formatArgs) : hint);
		
		if (m_hasTrace) {
			trace("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××");
			trace(STR);
			trace("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××");
		}
		
		m_hintAY.push("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××");
		m_hintAY.push(STR);
		m_hintAY.push("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××");
		____doFlush();
	}
	
	final public function error( module:*, method:String, hint:*, formatArgs:Array ) : void {
		var STR:String;
		
		STR = ____toMakeInfo(module) + "...!!!!!!!! [ " + method + " ]...◎  " + (formatArgs.length ? formatString(String(hint), formatArgs) : hint);
		
		m_hintAY.push(STR);
		____doFlush();
		
		throw new Error(STR);
	}
	
	
	
	
	/** @private */
	agony_internal var m_hintAY:Vector.<String> = new <String>[];
	agony_internal var m_stage:Stage;
	agony_internal var m_txt:TextField;
	agony_internal var m_sprite:Sprite;
	agony_internal var m_visible:Boolean;
	agony_internal var m_width:int;
	agony_internal var m_height:int;
	agony_internal var m_isLocatingLeft:Boolean;
	agony_internal var m_hasTrace:Boolean;
	
	
	
	
	/** @private */
	[Inline]
	final agony_internal function ____toMakeInfo( module:* ) : String {
		var moduleName:String;
		var time:int;
		
		moduleName  =  (module is String) ? module : getQualifiedClassName(module).replace("::",".");
		time        =  getTimer();
		return "[ " + (moduleName.substr(moduleName.lastIndexOf(".") + 1)) + " -> " + ((int(time / 60000) < 10) ? "0" + int(time / 60000) : int(time / 60000)) + ":" + (((time % 60000) < 10000) ? "0" + Number((time % 60000) * .001).toFixed(3) : Number((time % 60000) * .001 ).toFixed(3)) + " ]";
	}
}
}