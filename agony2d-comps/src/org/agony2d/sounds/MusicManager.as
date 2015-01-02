package org.agony2d.sounds {
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import org.agony2d.loading.events.AProgressEvent;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.sounds.core.AbstractSoundManager;
	
	use namespace agony_internal;
	use namespace event_internal;
	
	/** 音樂播放完成后觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]

	/** 加載音樂進程改變時觸發. */
	[Event(name = "progress", type = "org.agony2d.loading.events.AProgressEvent")]
	
public class MusicManager extends AbstractSoundManager {
	
	public function MusicManager() {
		if (!g_instance) {
			g_instance = this;
		}
		else {
			LogMachine.g_instance.error(this, "constructor", "It's a singleton !!!");
		}
	}
	
	/** Singleton. */
	public static function getInstance() : MusicManager {
		return g_instance ||= new MusicManager();
	}
	
	/** 當前音樂. */
	public function get currMusic() : String { 
		return m_prop ? m_prop.m_key : null;
	}
	
	/** 音樂時長. */
	public function get length() : int { 
		return m_prop ? m_prop.length : 0;
	}
	
	/** 音樂播放位置. */
	public function get position() : Number {
		return m_prop ? m_prop.position : 0;
	}
	
	public function set position( v:Number ) : void {
		if (m_prop) {
			m_prop.position = v;
		}
	}
	
	/** 是否為暫停狀態. */
	public function get paused() : Boolean {
		return m_prop && m_prop.paused;
	}
	
	public function set paused( b:Boolean ) : void {
		if (m_prop) {
			m_prop.paused = b;
		}
	}
	
	/**
	 * 重置音樂.
	 */
	public function reset() : void {
		if (m_prop) {
			LogMachine.g_instance.message(this, "Reset music: [ {0} ].", m_prop.m_key);
			this.____doPlaySound(m_prop.m_sound, m_prop.m_loops, m_prop.m_volume, m_prop.m_key);
		}
	}
	
	/**
	 * 停止音樂.
	 */
	public function stop() : void {
		if (m_prop) {
			LogMachine.g_instance.message(this, "Stop music: [ {0} ].", m_prop.m_key);
			m_prop.doForceRecycle();
			m_prop = null;
		}
	}
	
	
	
	/** @private */
	agony_internal static var g_instance:MusicManager;
	/** @private */
	agony_internal static var g_progressEvent:AProgressEvent;
	
	/** @private */
	agony_internal var m_prop:ASound;
	
	
	
	/** @private */
	override agony_internal function doRemoveSoundProp( prop:ASound, forced:Boolean ) : void {
		if (prop == m_prop) {
			if (m_prop.m_sound.isBuffering) {
				m_prop.m_sound.close();
			}
			m_prop.m_sound.removeEventListener(ProgressEvent.PROGRESS, ____onProgress);
			m_prop = null;
			if (!forced) {
				this.dispatchDirectEvent(AEvent.COMPLETE);
			}
		}
		else {
			LogMachine.g_instance.error(this, "doRemoveSoundProp", "Unknown error: [ {0} ] !!!", m_prop.m_key);
		}
	}
	
	/** @private */
	override agony_internal function ____doPlaySound( sound:Sound, loops:int, volume:Number, key:String ) : ASound {
		if (m_prop) {
			m_prop.doForceRecycle();
		}
		m_prop = ASound.toNewSound(sound, loops, volume, key, this);
		sound.addEventListener(ProgressEvent.PROGRESS, ____onProgress);
		return m_prop;
	}
	
	/** @private */
	override agony_internal function ____doUpdateVolume() : void {
		if (m_prop) {
			m_prop.doSetVolume(m_totalVolume);
		}
	}
	
	/** @private */
	agony_internal function ____onProgress( e:ProgressEvent ) : void {
		if (!g_progressEvent) {
			g_progressEvent = new AProgressEvent(AProgressEvent.PROGRESS);
		}
		g_progressEvent.bytesLoaded  =  e.bytesLoaded;
		g_progressEvent.bytesTotal   =  e.bytesTotal;
		this.dispatchEvent(g_progressEvent);
	}
	
	/** @private */
	override agony_internal function ____onIoError( e:IOErrorEvent ) : void {
		super.____onIoError(e);
		this.stop();
	}
}
}