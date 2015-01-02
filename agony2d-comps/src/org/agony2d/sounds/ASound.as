package org.agony2d.sounds {
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import org.agony2d.events.Notifier;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.events.AEvent;
	import org.agony2d.sounds.core.AbstractSoundManager;

	use namespace agony_internal;
	
	/** 聲音播放完成后觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
public class ASound extends Notifier {
	
	public function ASound() {
		super(null);
	}
	
	/** 源數據. */
	public function get source() : String { 
		return m_key;
	}
	
	/** 總時長. */
	public function get length() : int { 
		return m_sound.length;
	}
	
	/** 當前播放位置. */
	public function get position() : Number { 
		return this.paused ? m_cachedPosition : m_channel ? m_channel.position : 0;
	}
	
	public function set position( v:Number ) : void {
		if (m_currLoop < 0) {
			return;
		}
		else if (this.paused) {
			m_cachedPosition = v;
		}
		else if (m_channel) {
			m_channel.removeEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
			m_channel.stop()
			g_cachedTransform.volume  =  m_totalVolume * m_volume;
			v                         =  Boolean(v > this.length) ? this.length : v;
			m_channel                 =  m_sound.play(v, 1, g_cachedTransform);
			m_channel.addEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
		}
	}
	
	/** @private */
	agony_internal static function toNewSound( sound:Sound, loops:int, volume:Number, key:String, manager:AbstractSoundManager ) : ASound {
		var sp:ASound;
		
		sp                =  (g_cachedNumProps > 0 ? g_cachedNumProps-- : 0) ? g_cachedPropsList.pop() : new ASound;
		sp.m_manager      =  manager;
		sp.m_sound        =  sound;
		sp.m_loops        =  loops;
		sp.m_volume       =  volume > 1 ? 1 : ( volume < 0 ? 0 : volume );
		sp.m_totalVolume  =  manager.m_totalVolume;
		sp.m_key          =  key;
		sp.doStartPlay();
		//trace(g_cachedNumProps);
		return sp;
	}
	
	/** @private */
	agony_internal function get paused() : Boolean {
		// paused为true时，channel为空的.
		return Boolean(m_cachedPosition > 0);
	}
	
	/** @private */
	agony_internal function set paused( b:Boolean ) : void {
		if (m_currLoop < 0) {
			return;
		}
		else if (b) {
			if (m_channel) {
				m_channel.removeEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
				m_cachedPosition = m_channel.position;
				m_channel.stop();
				m_channel = null;
				LogMachine.g_instance.message(this, "Paused: [ {0} ]...Position: [ {1} ]...Length: [ {2} ].", b, m_cachedPosition * .001, length * .001)
			}
		}
		else if (m_cachedPosition > 0) {
			LogMachine.g_instance.message(this, "Paused: [ {0} ]...Position: [ {1} ]...Length: [ {2} ].", b, m_cachedPosition * .001, length * .001)
			g_cachedTransform.volume  =  m_totalVolume * m_volume;
			m_channel                 =  m_sound.play(m_cachedPosition, 1, g_cachedTransform);
			m_cachedPosition          =  0;
			m_channel.addEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
		}
	}
	
	/** @private */
	agony_internal function doStartPlay() : void {
		g_cachedTransform.volume  =  m_totalVolume * m_volume;
		m_channel                 =  m_sound.play(0, 1, g_cachedTransform);
		if (m_channel) {
			m_channel.addEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
		}
		else {
			m_currLoop = -1;
		}
	}
	
	// 分支音量.
	/** @private */
	agony_internal function doSetVolume( totalVolume:Number ) : void {
		m_totalVolume = totalVolume;
		if (m_channel) {
			g_cachedTransform.volume  =  totalVolume * m_volume;
			m_channel.soundTransform  =  g_cachedTransform;
		}
	}
	
	/** @private */
	agony_internal function ____onRoundComplete( e:Event ) : void {
		m_channel.removeEventListener(Event.SOUND_COMPLETE, ____onRoundComplete)
		if (m_loops > 0 && ++m_currLoop >= m_loops) {
			m_manager.doRemoveSoundProp(this, false);
			this.dispatchDirectEvent(AEvent.COMPLETE);
			this.removeAllListeners();
			g_cachedPropsList[g_cachedNumProps++] = this;
			return;
		}
		this.doStartPlay();
	}
	
	// 播放未完成時，強制關閉回收
	/** @private */
	agony_internal function doForceRecycle() : void {
		if (m_channel) {
			m_channel.removeEventListener(Event.SOUND_COMPLETE, ____onRoundComplete);
			m_channel.stop();
			m_channel = null;
		}
		m_cachedPosition = 0;
		m_manager.doRemoveSoundProp(this, true);
		this.removeAllListeners();
		g_cachedPropsList[g_cachedNumProps++] = this;
	}
	
	
	
	/** @private */
	agony_internal static var g_cachedTransform:SoundTransform = new SoundTransform();
	/** @private */
	agony_internal static var g_cachedPropsList:Array = [];
	/** @private */
	agony_internal static var g_cachedNumProps:int;
	
	/** @private */
	agony_internal var m_manager:AbstractSoundManager;
	/** @private */
	agony_internal var m_sound:Sound;
	/** @private */
	agony_internal var m_channel:SoundChannel;
	/** @private */
	agony_internal var m_loops:int;
	/** @private */
	agony_internal var m_currLoop:int;  // 第幾次播放，-1表示聲音異常.
	/** @private */
	agony_internal var m_cachedPosition:Number;
	/** @private */
	agony_internal var m_totalVolume:Number;
	/** @private */
	agony_internal var m_volume:Number; // 分支音量，僅可初期設定，播放時調節聲音使用totalVolume.
	/** @private */
	agony_internal var m_key:String;
}
}