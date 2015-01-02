package org.agony2d.sounds {
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.sounds.core.AbstractSoundManager;
	
	use namespace agony_internal;
	
public class SfxManager extends AbstractSoundManager {
	
	public function SfxManager() {
		if (!g_instance) {
			g_instance = this;
		}
		else {
			LogMachine.g_instance.error(this, "constructor", "It's a singleton !!!");
		}
	}
	
	/** Singleton. */
	public static function getInstance() : SfxManager {
		return g_instance ||= new SfxManager();
	}
	
	/** 是否為開啟狀態. */
	public function get enabled() : Boolean {
		return m_enabled;
	}
	
	/** 當前同時存在的音效數目. */
	public function get numSfx() : int {
		return m_numSfx;
	}
	
	/**
	 * 播放音效.
	 * 
	 * @param	soundData
	 * @param	loops
	 * @param	volume
	 * @param	asCached
	 * @return
	 */
	override public function play( soundData:*, loops:int = 1, volume:Number = 1, asCached:Boolean = true ) : ASound {
		if (!m_enabled) {
			return null;
		}
		return super.play(soundData, loops, volume, asCached);
	}
	
	/**
	 * 加載并播放音效.
	 * 
	 * @param	url
	 * @param	loops
	 * @param	volume
	 * @param	asCached
	 * @return
	 */
	override public function loadAndPlay( url:String, loops:int = 1, volume:Number = 1, asCached:Boolean = true ) : ASound {
		if (!m_enabled) {
			return null;
		}
		return super.loadAndPlay(url, loops, volume, asCached);
	}
	
	/**
	 * 關閉音效
	 * 
	 * @param	asPaused	是否處於暫停狀態，開啟音效可恢復之前最後的播放狀態.
	 */
	public function setDisable( asPaused:Boolean = false ) : void {
		var l:int;
		
		m_enabled = false;
		if (!asPaused) {
			while (m_numSfx) {
				m_propList[0].doForceRecycle();
			}
			LogMachine.g_instance.message(this, "Disable all SFX.");
		}
		else {
			l = m_numSfx
			while (--l > -1) {
				m_propList[l].paused = true;
			}
			LogMachine.g_instance.message(this, "Disable all SFX (Paused).");
		}
	}
	
	/**
	 * 開啟音效.
	 */
	public function setEnable() : void {
		var l:int;
		
		m_enabled  =  true;
		l          =  m_numSfx;
		while (--l > -1) {
			m_propList[l].paused = false;
		}
		LogMachine.g_instance.message(this, "Enable all SFX.");
	}
	
	/**
	 * 停止指定音效.
	 * 
	 * @param	sound
	 */
	public function stopSfx( sfx:ASound ) : void {
		var prop:ASound;
		var l:int;
		
		l = m_numSfx;
		while (--l > -1) {
			prop = m_propList[l];
			if (prop == sfx) {
				prop.doForceRecycle();
				return
			}
		}
		LogMachine.g_instance.warning(this, "stopSfx", "Not exist SFX: [ {0} ].", sfx ? sfx.m_key : "Null")
	}
	
	/**
	 * 停止全部音效.
	 */
	public function stopAll() : void {
		while (m_numSfx) {
			m_propList[0].doForceRecycle();
		}
	}
	
	
	
	/** @private */
	agony_internal static var g_instance:SfxManager;
	
	/** @private */
	agony_internal var m_propList:Vector.<ASound> = new <ASound>[];
	/** @private */
	agony_internal var m_numSfx:int;
	/** @private */
	agony_internal var m_enabled:Boolean = true;
	
	
	
	/** @private */
	override agony_internal function doRemoveSoundProp( prop:ASound, forced:Boolean ) : void {
		var index:int;
		
		if(m_numSfx > 1) {
			index              =  m_propList.indexOf(prop);
			m_propList[index]  =  m_propList[--m_numSfx];
			m_propList.pop();
		}
		else if (m_numSfx == 1) {
			m_propList.pop();
			--m_numSfx;
		}
		else {
			LogMachine.g_instance.error(this, "doRemoveSoundProp", "Unknown error: [ {0} ] !!!", prop.m_key);
		}
	}
	
	/** @private */
	override agony_internal function ____doPlaySound( sound:Sound, loops:int, volume:Number, key:String ) : ASound {
		var prop:ASound;
		
        prop                    =  ASound.toNewSound(sound, loops, volume, key, this);
		m_propList[m_numSfx++]  =  prop;
		return prop;
	}
	
	/** @private */
	override agony_internal function ____doUpdateVolume() : void {
		var i:int;
		
		while (i < m_numSfx) {
			m_propList[i++].doSetVolume(m_totalVolume);
		}
	}
	
	/** @private */
	override agony_internal function ____onIoError( e:IOErrorEvent ) : void {
		var sound:Sound;
		var prop:ASound;
		var l:int;
		
		super.____onIoError(e);
		sound  =  e.target as Sound;
		l      =  m_numSfx;
		while (--l > -1) {
			prop = m_propList[l];
			if (prop.m_sound == sound) {
				prop.doForceRecycle();
			}
		}
	}
}
}