package org.agony2d.sounds.core {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import org.agony2d.events.Notifier;
	import org.agony2d.resources.TAssetBundle;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.sounds.ASound;
	
	use namespace agony_internal;
	
public class AbstractSoundManager extends Notifier {
	
	//public static function get baseURL() : String {
		//return g_baseURL;
	//}
	
	//public static function set baseURL( v:String ) : void {
		//g_baseURL = v;
	//}
	
	/** 總音量大小. */
	public function get totalVolume() : Number { 
		return m_totalVolume;
	}
	
	public function set totalVolume( v:Number ) : void {
		m_totalVolume = v > 1 ? 1 : ( v < 0 ? 0 : v );
		this.____doUpdateVolume();
	}
	
	/**
	 * 設定聲音 (下載)緩衝時間.
	 * 
	 * @param	bufferTime
	 */
	public function setBufferTime( bufferTime:Number ) : void {
		if (!m_context) {
			m_context = new SoundLoaderContext(bufferTime, false);
		}
		else {
			m_context.bufferTime = bufferTime;
		}
	}
	
	/**
	 * 播放聲音.
	 * 
	 * @param	soundData
	 * @param	loops
	 * @param	volume
	 * @param	asCached
	 * @return
	 */
	public function play( soundData:*, loops:int = 1, volume:Number = 1, asCached:Boolean = true ) : ASound {
		var key:String;
		var sound:Sound;
		var definition:Class;
		
		if (soundData is Class) {
			key         =  getQualifiedClassName(soundData);
			definition  =  soundData as Class;
		}
		else if (soundData is String) {
			try {
				key         =  soundData;
				definition  =  getDefinitionByName(soundData) as Class;
			}
			catch (error:Error) {
				LogMachine.g_instance.warning(this, "play", "Not exist sound type: [ {0} ].", soundData);
				return null;
			}
		}
		else {
			LogMachine.g_instance.error(this, "play", "Data type error: [ {0} ] !!!", soundData);
		}
		sound = g_soundList[key];
		if (!sound) {
			try {
				sound = new definition() as Sound;
			}
			catch (error:Error) {
				LogMachine.g_instance.error(this, "play", "Instance of sound happens error: [ {0} ] !!!", new definition);
				return null;
			}
			if (asCached) {
				g_soundList[key] = sound;
			}
		}
		return this.____doPlaySound(sound, loops, volume, key);
	}
	
	/**
	 * 加載并播放聲音.
	 * 
	 * @param	url
	 * @param	loops
	 * @param	volume
	 * @param	asCached
	 * @return
	 */
	public function loadAndPlay( url:String, loops:int = 1, volume:Number = 1, asCached:Boolean = true ) : ASound {
		var sound:Sound;
		
		sound = g_soundList[url];
		if (!sound) {
			if (!m_context) {
				m_context = new SoundLoaderContext(DEFAULT_BUFFET_TIME, false);
			}
			sound = new Sound(new URLRequest(TAssetBundle.g_externalField + url), m_context);
			sound.addEventListener(Event.COMPLETE,        ____onLoadComplete);
			sound.addEventListener(IOErrorEvent.IO_ERROR, ____onIoError);
			if (asCached) {
				g_soundList[url] = sound;
			}
		}
		return this.____doPlaySound(sound, loops, volume, url);
	}
	
	
	
	/** @private */
	agony_internal static const DEFAULT_BUFFET_TIME:int = 4000;
	/** @private */
	agony_internal static var g_soundList:Object = {};
	//agony_internal static var g_baseURL:String = "";
	
	/** @private */
	agony_internal var m_context:SoundLoaderContext;
	/** @private */
	agony_internal var m_totalVolume:Number = 1;
	
	
	
	/** @private */
	agony_internal function ____onLoadComplete( e:Event ) : void {
		var sound:Sound;
		
		sound = e.target as Sound;
		sound.removeEventListener(Event.COMPLETE,        ____onLoadComplete);
		sound.removeEventListener(IOErrorEvent.IO_ERROR, ____onIoError);
	}
	
	/** @private */
	agony_internal function ____onIoError( e:IOErrorEvent ) : void {
		var tmpSnd:Sound;
		var sound:Sound;
		var key:*;
		
		LogMachine.g_instance.warning(this, "____onIoError", e.text);
		sound = e.target as Sound
		sound.removeEventListener(Event.COMPLETE,        ____onLoadComplete);
		sound.removeEventListener(IOErrorEvent.IO_ERROR, ____onIoError);
		for (key in g_soundList) {
			tmpSnd = g_soundList[key];
			if(sound == tmpSnd) {
				delete g_soundList[key];
				return;
			}
		}
	}
	
	/** @private */
	agony_internal function doRemoveSoundProp( prop:ASound, forced:Boolean ) : void {
		
	}
	
	/** @private */
	agony_internal function ____doPlaySound( sound:Sound, loops:int, volume:Number, key:String ) : ASound {
		return null;
	}
	
	/** @private */
	agony_internal function ____doUpdateVolume() : void {
		
	}
}
}