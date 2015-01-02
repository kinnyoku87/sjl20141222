package org.agony2d.keyboard {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.StageManager;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.keyboard.inside.TKeyProp;
	import org.agony2d.keyboard.inside.TKeyboardState;
	
	use namespace agony_internal;
	use namespace event_internal;
	
public class TKeyboardManager {
	
	public function TKeyboardManager() {
		var i:uint;
		
		FrameManager.doCheckAgonyEnabled(this);
		if (!g_instance) {
			g_instance = this;
		}
		else {
			throw new Error("It's a singleton !!!");
		}
		
		m_keyList = new Vector.<TKeyProp>(m_keyTotal, true);
		
		// A - Z.
		i = 65;
		while (i <= 90) {
			this.____doAddKey(String.fromCharCode(i),i++);
		}
		
		// Number.
		i = 48;
		this.____doAddKey("ZERO", i++);
		this.____doAddKey("ONE",  i++);
		this.____doAddKey("TWO",  i++);
		this.____doAddKey("THREE",i++);
		this.____doAddKey("FOUR", i++);
		this.____doAddKey("FIVE", i++);
		this.____doAddKey("SIX",  i++);
		this.____doAddKey("SEVEN",i++);
		this.____doAddKey("EIGHT",i++);
		this.____doAddKey("NINE", i++);
		
		// others
		this.____doAddKey("UP",    38);
		this.____doAddKey("DOWN",  40);
		this.____doAddKey("LEFT",  37);
		this.____doAddKey("RIGHT", 39);
		
		this.____doAddKey("ENTER", 13);
		this.____doAddKey("SHIFT", 16);
		this.____doAddKey("CONTROL",17);
		this.____doAddKey("ALT", 18);
		this.____doAddKey("BACKSPACE",8);
		this.____doAddKey("SPACE", 32);
		this.____doAddKey("TAB", 9);
		this.____doAddKey("ESC",27);
		this.____doAddKey("MINUS",189);
		this.____doAddKey("PLUS", 187);
		//this.____doAddKey("PAGEUP", 33);
		//this.____doAddKey("PAGEDOWN", 34);
		//this.____doAddKey("HOME", 36);
		//this.____doAddKey("END", 35);
		//this.____doAddKey("INSERT", 45);
		//this.____doAddKey("DELETE", 46)
		
		//////////////////////////////////////////////////////////////////
		// F1 - F12.
		//////////////////////////////////////////////////////////////////
		//i = 1;
		//while (i <= 12) {
			//this.____doAddKey("F" + i, 111 + (i++));
		//}
		
		//////////////////////////////////////////////////////////////////
		// SPECIAL KEYS + PUNCTUATION(标点)，Number Pad.
		//////////////////////////////////////////////////////////////////
		//i = 96;
		//this.____doAddKey("NUMPAD_ZERO", i++);
		//this.____doAddKey("NUMPAD_ONE",  i++);
		//this.____doAddKey("NUMPAD_TWO",  i++);
		//this.____doAddKey("NUMPAD_THREE",i++);
		//this.____doAddKey("NUMPAD_FOUR", i++);
		//this.____doAddKey("NUMPAD_FIVE", i++);
		//this.____doAddKey("NUMPAD_SIX",  i++);
		//this.____doAddKey("NUMPAD_SEVEN",i++);
		//this.____doAddKey("NUMPAD_EIGHT",i++);
		//this.____doAddKey("NUMPAD_NINE", i++);
		
		//this.____doAddKey("LBRACKET",219);
		//this.____doAddKey("RBRACKET",221);
		//this.____doAddKey("BACKSLASH",220);
		//this.____doAddKey("CAPSLOCK",20);
		//this.____doAddKey("SEMICOLON",186);
		//this.____doAddKey("QUOTE",222);
		
		//this.____doAddKey("COMMA",188);
		//this.____doAddKey("PERIOD",190);
		//this.____doAddKey("SLASH", 191);
		
		m_head = new TKeyboardState();
		StageManager.g_initStage.addEventListener(KeyboardEvent.KEY_DOWN, ____onKeyDown);
		StageManager.g_initStage.addEventListener(KeyboardEvent.KEY_UP,   ____onKeyUp);
		FrameManager.g_target.addEventListener(Event.ENTER_FRAME, ____onEnterFrame, false, 1);
	}
	
	/** 
	 * 是否按下某鍵.
	 * 
	 * @param	keyName
	 * @return
	 */
	final public function isKeyPressed( keyName:String ) : Boolean {
		return Boolean(m_keyList[m_lookup[keyName]].m_state & k_press);
	}
	
	/**
	 * 是否剛按下某鍵.
	 * 
	 * @param	keyName
	 * @return
	 */
	final public function justPressed( keyName:String ) : Boolean { 
		return Boolean(m_keyList[m_lookup[keyName]].m_state & k_justPressB);
	}
	
	/**
	 * 是否剛彈起某鍵.
	 * 
	 * @param	keyName
	 * @return
	 */
	final public function justReleased( keyName:String ) : Boolean { 
		return Boolean(m_keyList[m_lookup[keyName]].m_state & k_justReleaseB);
	}
	
	/**
	 * 是否存在任何鍵被按下.
	 * @return
	 */
	final public function any() : Boolean {
		var i:int;
		
		while (i < m_dirtyLength) {
			if (Boolean(m_dirtyList[i++].m_state & k_press)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 重置全部按鍵.
	 */
	public function reset() : void {
		var K:TKeyProp;
		var i:int;
		
		while (i < m_keyTotal) {
			K = m_keyList[i++];
			if (!K) {
				continue;
			}
			K.m_state = 0;
		}
		m_dirtyList.length = m_dirtyLength = 0;
	}
	
	/**
	 * 獲取當前輸入狀態
	 * @return
	 */
	public function getState() : ITKeyboardState {
		return m_head
	}
	
	/**
	 * 加入新輸入狀態
	 * @return
	 */
	public function addState() : ITKeyboardState {	
		var KS:TKeyboardState;
		
		m_numStates++;
		KS = new TKeyboardState();
		KS.m_next = m_head;
		m_head = m_head.m_prev = KS;
		return KS;
	}
	
	/**
	 * 削除狀態
	 */
	public function removeState() : void {
		if (m_head.m_next) {
			m_head = m_head.m_next;
			m_head.m_prev.dispose();
			m_head.m_prev = null;
			--m_numStates;
		}
		else {
			LogMachine.g_instance.warning(this, "removeState", "未加入額外輸入狀態.");
		}
	}
	
	/**
	 * 削除全部輸入狀態.
	 */
	public function removeAllStates() : void {
		while (m_head.m_next) {
			m_head = m_head.m_next;
			m_head.m_prev.dispose();
			m_head.m_prev = null;
		}
		m_numStates = 0;
	}
	
	//final public function toString() : String
	//{
		//var list:Array = [];
		//var i:int;
		//
		//while (i < m_dirtyLength)
		//{
			//list[i] = m_dirtyList[i].name;
			//i++
		//}
		//return "【KeyboardManager × " + m_dirtyLength + "】 >>>> " + list.join(",");
	//}
	
	private const k_justReleaseA:uint  =  0x01;
	private const k_justReleaseB:uint  =  0x02;
	private const k_press:uint         =  0x10;
	private const k_justPressA:uint    =  0x20;
	private const k_justPressB:uint    =  0x40;
	private const k_dirtyKey:uint      =  0x80;
	
	private var m_lookup:Object = { };  // keyName : keyCode
	private var m_keyList:Vector.<TKeyProp>;
	private var m_dirtyList:Array = [];
	private var m_dirtyLength:int
	private var m_head:TKeyboardState
	private var m_numStates:int
	private const m_keyTotal:uint = 256;  // 256
	
	//public var ESC:Boolean, ENTER:Boolean, SHIFT:Boolean, CONTROL:Boolean, ALT:Boolean, SPACE:Boolean, UP:Boolean, DOWN:Boolean, LEFT:Boolean, RIGHT:Boolean;

	//public var ONE:Boolean, TWO:Boolean, THREE:Boolean, FOUR:Boolean, FIVE:Boolean, SIX:Boolean, SEVEN:Boolean, EIGHT:Boolean, NINE:Boolean, ZERO:Boolean;
	//
	//public var F1:Boolean, F2:Boolean, F3:Boolean, F4:Boolean, F5:Boolean, F6:Boolean, F7:Boolean, F8:Boolean, F9:Boolean, F10:Boolean, F11:Boolean, F12:Boolean;
	//
	//public var NUMPADONE:Boolean, NUMPADTWO:Boolean, NUMPADTHREE:Boolean, NUMPADFOUR:Boolean, NUMPADFIVE:Boolean, NUMPADSIX:Boolean, NUMPADSEVEN:Boolean, NUMPADEIGHT:Boolean, NUMPADNINE:Boolean, NUMPADZERO:Boolean;
//
	//public var PAGEUP:Boolean, PAGEDOWN:Boolean, HOME:Boolean, END:Boolean, INSERT:Boolean, MINUS:Boolean, PLUS:Boolean, DELETE:Boolean, BACKSPACE:Boolean, TAB:Boolean, CAPSLOCK:Boolean;
	
	//public var LBRACKET:Boolean;    // [
	//public var RBRACKET:Boolean;    // ]
	//public var BACKSLASH:Boolean;    // "\"
	//public var SEMICOLON:Boolean;    // ;
	//public var QUOTE:Boolean;    // ""
	//public var COMMA:Boolean;    // ,
	//public var PERIOD:Boolean;    // .
	//public var SLASH:Boolean;    // /
		
	private static var g_instance:TKeyboardManager
	public static function getInstance() : TKeyboardManager {
		return g_instance ||= new TKeyboardManager()
	}
	
	agony_internal function ____onEnterFrame( e:Event ) : void {
		var state:int;
		var index:int;
		var i:int;
		var K:TKeyProp;
		
		while (i < m_dirtyLength) {
			K = m_dirtyList[i++];
			state = K.m_state;
			if (Boolean(state & k_justPressA)) {
				K.m_state &= ~k_justPressA;
				K.m_state |= k_justPressB;
				if (m_head.m_pressNotifier) {
					m_head.m_pressNotifier.dispatchDirectEvent(K.m_keyName);
				}
				//trace(K.m_keyName + " >>>> press");
			}
			else if (Boolean(state & k_justPressB)) {
				K.m_state &= ~k_justPressB;
			}
			if (Boolean(state & k_justReleaseA)) {
				K.m_state &= ~k_justReleaseA;
				K.m_state |= k_justReleaseB;
				if (m_head.m_releaseNotifier) {
					m_head.m_releaseNotifier.dispatchDirectEvent(K.m_keyName);
				}
				//trace(K.m_keyName + " >>>> release");
			}
			else if (Boolean(state & k_justReleaseB)) {
				K.m_state &= ~k_justReleaseB;
			}
			if (Boolean(K.m_state & k_press)) {
				if (m_head.m_straightNotifier) {
					m_head.m_straightNotifier.dispatchDirectEvent(K.m_keyName);
				}
			}
			else if (Boolean(K.m_state == k_dirtyKey)) {
				if (m_dirtyLength == 1) {
					--m_dirtyLength;
					m_dirtyList.pop();
				}
				else {
					index = m_dirtyList.indexOf(K);
					m_dirtyList[index] = m_dirtyList[--m_dirtyLength];
					m_dirtyList.pop();
					i--;
				}
				K.m_state = 0;
			}
		}
	}
	
	// 一些特殊情况下，某些键可能会连续产生press或release.
	agony_internal function ____onKeyDown( e:KeyboardEvent ) : void {
		var K:TKeyProp
		
		if(e.keyCode > 255 || !m_keyList[e.keyCode]) {
			return
		}
		K = m_keyList[e.keyCode]
		
		//trace("当前按键: " + e.keyCode + " | " + K.m_keyName)
		if (!Boolean(K.m_state & k_dirtyKey)) {
			m_dirtyList[m_dirtyLength++] = K;
			K.m_state |= k_dirtyKey;
		}
		// 已按下或刚弹起时，不能再按.
		if (!Boolean(K.m_state & ( k_press | k_justReleaseA ))) {
			K.m_state |= ( k_press | k_justPressA );
		}
	}
	
	agony_internal function ____onKeyUp( e:KeyboardEvent ) : void {
		var K:TKeyProp
		
		if(e.keyCode > 255 || !m_keyList[e.keyCode]) {
			return
		}
		K = m_keyList[e.keyCode]
		if (!Boolean(K.m_state & k_dirtyKey)) {
			m_dirtyList[m_dirtyLength++] = K;
			K.m_state |= k_dirtyKey;
		}
		// 只有按下时，才可弹起.
		if (Boolean(K.m_state & k_press)) {
			K.m_state &= ~k_press;
			K.m_state |= k_justReleaseA;
		}
	}
	
	/**
	 * 加入指定键侦听.
	 * 
	 * @param	keyName
	 * @param	keyCode
	 */
	agony_internal function ____doAddKey( keyName:String, keyCode:uint ) : void {
		var prop:TKeyProp;
		
		if (m_lookup[keyName] || m_keyList[keyCode]) {
			throw new Error("Repeat key name : " + keyName + ".");
		}
		m_lookup[keyName]  =  keyCode;
		prop               =  m_keyList[keyCode]  =  new TKeyProp;
		prop.m_keyName     =  keyName
	}
}
}