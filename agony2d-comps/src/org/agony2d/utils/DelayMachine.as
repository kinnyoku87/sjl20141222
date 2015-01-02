package org.agony2d.utils {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/** 延遲回調機. */
public class DelayMachine {
	
	public function DelayMachine( target:DisplayObject = null ) {
		m_delayProps       =  new <DelayProp>[null];
		m_masterList       =  {};
		m_internalTime     =  0.0;
		m_timeScaleFactor  =  1.0;
		m_target           =  target ? target : new Shape;
	}
	
	/** Optional instance. */
	public static function getInstance() : DelayMachine { 
		return g_instance ||= new DelayMachine();
	}
	
	/** 延遲回調數目. */
	public function get numDelays() : int {
		return m_numDelays;
	}
	
	/** 時間縮放率. */
	public function get timeScaleFactor() : Number { 
		return m_timeScaleFactor;
	}
	
	public function set timeScaleFactor( v:Number ) : void {
		m_timeScaleFactor = (isNaN(v) || v < 0) ? 0 : v;
	}
	
	/** 是否為暫停狀態. */
	public function get paused() : Boolean { 
		return m_paused;
	}
	
	public function set paused( b:Boolean ) : void {
		if (m_paused == b) {
			return;
		}
		m_paused = b;
		if (m_paused) {
			if (m_existed) {
				m_target.removeEventListener(Event.ENTER_FRAME, ____onEnterFrame);
			}
		}
		else {
			if (m_existed) {
				m_target.addEventListener(Event.ENTER_FRAME, ____onEnterFrame, false, 1);
				m_oldTime = getTimer();
			}
		}
		trace((!b ? "▲" : "▼") + "Paused [ {0} ]...Remains [ {1} ].", b, m_numDelays);
	}
	
	/** 內部進行時間 (sec). */
	public function get internalTime() : Number {
		return m_internalTime * .001;
	}
	
	/**
	 * 加入一個延遲回調.
	 * 
	 * @param	delay
	 * @param	callback
	 * @param	...args
	 * @return	一個大於零的32位整數.
	 */
	public function delayedCall( delay:Number, callback:Function, ...args ) : uint {
		var dp:DelayProp;
		
		if (!m_existed) {
			if (!m_paused) {
				m_target.addEventListener(Event.ENTER_FRAME, ____onEnterFrame, false, 1);
				m_oldTime = getTimer();
			}
			m_existed = true;
		}
		dp           =  m_masterList[++m_idCount] = m_delayProps[++m_numDelays] = new DelayProp;
		dp.goalTime  =  (delay * 1000.0 + m_internalTime + 0.5) >> 0;
		dp.callback  =  callback;
		dp.params    =  args;
		dp.delayID   =  m_idCount;
		this.____doInsert(m_numDelays);
		return m_idCount;
	}
	
	/**
	 * 削除一個延遲回調 (不存在則忽略).
	 * 
	 * @param	delayID
	 * @param	complete
	 */
	public function killDelayedCall( delayID:uint, complete:Boolean = false ) : void {
		var dp:DelayProp;
		var index:int;
		
		if (!m_masterList[delayID]) {
			return;
		}
		dp = m_masterList[delayID];
		delete m_masterList[delayID];
		if (complete) {
			dp.callback.apply(null, dp.params);
		}
		// only
		if (--m_numDelays == 0) {
			m_delayProps.length = 1;
			this.____doFinish();
		}
		else {
			index = m_delayProps.indexOf(dp);
			// tail
			if (index == m_numDelays + 1) {
				m_delayProps.pop();
			}
			else {
				m_delayProps[index] = m_delayProps.pop();
				this.____doSink(index);
			}
		}
	}
	
	/**
	 * 削除全部延遲回調.
	 * 
	 * @param	complete	是否觸發完成事件 (若為true，回調使用次序將被打亂).
	 */
	public function killAll( complete:Boolean = false ) : void {
		var dp:DelayProp;
		
		if (m_numDelays > 0) {
			if (complete) {
				while (m_numDelays > 0) {
					dp = m_delayProps[m_numDelays--];
					dp.callback.apply(null, dp.params);
					delete m_masterList[dp.delayID];
				}
			}
			else {
				while (m_numDelays > 0) {
					dp = m_delayProps[m_numDelays--];
					delete m_masterList[dp.delayID];
				}
			}
			m_delayProps.length = 1;
			m_numDelays = m_idCount = 0;
			this.____doFinish();
		}
	}
	
	
	
	/** @private */
	private static var g_instance:DelayMachine;
	
	/** @private */
	private var m_delayProps:Vector.<DelayProp>;
	/** @private */
	private var m_masterList:Object; // delayID : DelayProp
	/** @private */
	private var m_numDelays:int;
	/** @private */
	private var m_existed:Boolean;
	/** @private */
	private var m_paused:Boolean;
	/** @private */
	private var m_idCount:uint;
	/** @private */
	private var m_internalTime:Number;
	/** @private */
	private var m_oldTime:Number;
	/** @private */
	private var m_timeScaleFactor:Number;
	/** @private */
	private var m_target:DisplayObject;
	
	
	
	/** @private */
	private function ____onEnterFrame( elapsedTime:Number ) : void {
		var dp:DelayProp;
		
		// 1.  parent ---- prev = (N-1 / 2) >> 0
		// 2.  child  ---- next = N*2+1 / N*2+2
		// 3.  Execute the callback after removed from register map，to prevent occur an error when removes a delayedCall in the executing update.
		elapsedTime     =  getTimer() - m_oldTime;
		m_oldTime      +=  elapsedTime;
		m_internalTime +=  elapsedTime * m_timeScaleFactor;
		dp              =  m_delayProps[1];
		while (m_internalTime >= dp.goalTime) {	
			if (--m_numDelays == 0) {
				m_delayProps.pop();
				delete m_masterList[dp.delayID];
				dp.callback.apply(null, dp.params);
				// a new delay is maybe added while the tail callback is executed...
				if(m_numDelays == 0){
					this.____doFinish();
				}
				return;
			}
			else {
				m_delayProps[1] = m_delayProps.pop();
				this.____doSink(1);
			}
			delete m_masterList[dp.delayID];
			dp.callback.apply(null, dp.params);
			dp = m_delayProps[1];
		}
	}
	
	/** @private */
	[Inline]
	final private function ____doInsert( index:int ) : void {
		var dp:DelayProp;
		var prev:int;
		
		// 1.  N - 1 / 2 = N >> 1
		// 2.  bubble up
		while (index > 1) {
			prev = index >> 1;
			if (m_delayProps[index].goalTime < m_delayProps[prev].goalTime) {
				dp                   =  m_delayProps[index];
				m_delayProps[index]  =  m_delayProps[prev];
				m_delayProps[prev]   =  dp;
				index                =  prev;
			}
			else {
				break;
			}
		} 
	}
	
	/** @private */
	[Inline]
	final private function ____doSink( index:int ) : void {
		var dp:DelayProp;
		var oldIndex:int;
		var next:int;
		
		while (true) {
			oldIndex  =  index;
			next      =  index * 2;
			if (next < m_numDelays + 1) {
				if (m_delayProps[index].goalTime > m_delayProps[next].goalTime) {
					index = next;
				}
				if (next < m_numDelays && m_delayProps[index].goalTime > m_delayProps[next + 1].goalTime) {
					index = next + 1;
				}
			}
			if (index != oldIndex) {
				dp                      =  m_delayProps[index];
				m_delayProps[index]     =  m_delayProps[oldIndex];
				m_delayProps[oldIndex]  =  dp;
			}	
			else {
				break;
			}
		} 
	}
	
	/** @private */
	[Inline]
	final private function ____doFinish() : void {
		if (m_existed && !m_paused) {
			m_target.removeEventListener(Event.ENTER_FRAME, ____onEnterFrame);
		}
		m_existed = false;
		m_internalTime = 0;
	}
}
}

{
	class DelayProp {
		
		public var goalTime:int;
		public var callback:Function;
		public var params:Array;
		public var delayID:uint;
	}
}