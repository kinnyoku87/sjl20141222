package org.agony2d.resources {
	import flash.utils.ByteArray;
	
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	
	use namespace agony_internal;
	
	// 資源分四種使用方式:
	//   1. [預加載]: 常規分散資源 (AssetBundle標準使用).
	//      [ ResourceManager.loadAssets ].
	//         - 完整路徑: assets/login.zip (login/../..)
	
	//   2. [預加載]: Atlas資源一般根文件夾後面需要加"_atlas" (如login_atlas).
	//      [ ResourceManager.loadAssets ].
	//      同級子目錄只能有一個Atlas資源.
	//         - 完整路徑: assets/login_atlas.zip (login.atlas/../..)
	
	//   3. [動態加載]: 加載後直接使用，可設定加載完成前的缺省數據.
	//      [ 一般為圖像，不經過ResourceManager處理 ].
	//      使用後廢棄或緩存可選 (圖像數據，無需經過AssetData).
	//         - 完整路徑: assets/temp/img/../..
	
	//   4. [動態加載]: 不確定的需處理後使用的資源.
	//      [ ResourceManager.loadAssets2 ].
	//         - 完整路徑: assets/common/../../..
	//         - 完整路徑: assets/common_atlas/../..
	
	// 特殊資源格式:
	//   1. atlas (圖像集).
	
	// 1. 加載 (獲取原始bytes數據)
	// 2. 處理 / 解析 (對原始bytes數據的處理，使用多線程處理，單線程處理，是否做本地文件緩存)
	// 3. 緩存
	
	/** 開始加載時觸發. */
	[Event(name = "start",     type = "org.agony2d.events.AEvent")]
	
	/** 準備加載的資源全部已存在時觸發. */
	[Event(name = "interrupt", type = "org.agony2d.events.AEvent")]
	
	/** 全部加載并處理完成時觸發. */
	[Event(name = "complete",  type = "org.agony2d.events.AEvent")]
	
	/** 資源管理器，可獲取外部資源并轉換為程序中的相應資源. */
	// A. 採用Post Update方式處理隊列，與LoadManager的機制接近.
	// B. 
	
	
	// Class.
	// URL.
	// AssetData.
	// BitmapData.
public class TResourceManager {
	
	/** 剩餘加載值，計算全部加載進度時使用. */
	public static function get totalValue() : Number {
		return (g_readyBundles[0] ? g_numReadyBundles - g_readyBundles[0].m_ratio : g_numReadyBundles);
	}
	
	/** (資源) 外部字段. */
	public static function get externalField() : String {
		return TAssetBundle.g_externalField;
	}
	
	public static function set externalField( v:String ) : void {
		TAssetBundle.g_externalField = v
	}
	
	public static function get numReadyAssets() : int {
		return g_numReadyBundles;
	}
	
	/**
	 * 初期化.
	 */
	public static function initialize() : void {
		FrameManager.doCheckAgonyEnabled("ResourceManager");
		g_assetsList = TAssetBundle.g_assetsMap;
		g_readyBundles = [];
		g_notifier = new Notifier;
	}
	
	/**
	 * 加載資源集合.
	 * 這是一個解析過程，對bundle進行事件偵聽，此時bundle裡面什麼都沒有.
	 * 
	 * @param	zipURL
	 * @return
	 */
	public static function loadAssets( zipURL:String ) : TAssetBundle {
		var bundle:TAssetBundle;
		
		bundle = g_readyBundles[g_numReadyBundles] = new TAssetBundle(zipURL);
		bundle.m_id = zipURL;
		if (g_numReadyBundles++ == 0) {
			bundle.doNextBundle();
		}
		return bundle;
	}
	
	public static function loadAssets2( ...fileURLs ) : TAssetBundle {
		var bundle:TAssetBundle;
		
		bundle = g_readyBundles[g_numReadyBundles] = new TAssetBundle(fileURLs);
		bundle.m_id = fileURLs.join("");
		if (g_numReadyBundles++ == 0) {
			bundle.doNextBundle();
		}
		return bundle;
	}
	
	/**
	 * 嵌入資源集合.
	 * 
	 * @param	bytes
	 * @return
	 */
	public static function embedAssets( bytes:ByteArray ) : TAssetBundle {
		var bundle:TAssetBundle;
		
		bundle = g_readyBundles[g_numReadyBundles] = new TAssetBundle(bytes);
		if (g_numReadyBundles++ == 0) {
			bundle.doNextBundle();
		}
		return bundle;
	}
	
	/**
	 * 獲取資源.
	 * 
	 * @param	id
	 * @return
	 */
	public static function getAsset( id:String ) : TAssetData {
		return g_assetsList[id];
	}
	
	//public static function deleteAssets( zipURL:String ) : void {
		
	//}
	
	/**
	 * 加入事件偵聽器.
	 * 
	 * @param	type
	 * @param	listener
	 * @param	priority
	 */
	public static function addEventListener( type:String, listener:Function, priority:int = 0 ) : void {
		g_notifier.addEventListener(type, listener, priority);
	}
	
	/**
	 * 削除事件偵聽器.
	 * 
	 * @param	type
	 * @param	listener
	 */
	public static function removeEventListener( type:String, listener:Function ) : void {
		g_notifier.removeEventListener(type, listener);
	}
	
	
	
	
	agony_internal static var g_assetsList:Object;
	agony_internal static var g_notifier:Notifier;
	agony_internal static var g_readyBundles:Array;
	agony_internal static var g_numReadyBundles:int;
	
	
	
	agony_internal static function doLoadNext() : void {
		var bundle:TAssetBundle;
		
		//if (g_numReadyBundles == 0) {
			//return;
		//}
		bundle = g_readyBundles.shift();
		bundle.doDispose();
		if (--g_numReadyBundles > 0) {
			g_readyBundles[0].doNextBundle();
		}
		else {
			//if(TAssetBundle.g_loadDirty){
				//TAssetBundle.g_loadDirty = false;
				g_notifier.dispatchDirectEvent(AEvent.COMPLETE);
			//}
			//else {
				//g_notifier.dispatchDirectEvent(AEvent.INTERRUPT);
			//}
		}
	}
}
}