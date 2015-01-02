package org.agony2d.resources {
	import flash.display.Bitmap;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.IPreUpdater;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.loading.ALoader;
	import org.agony2d.loading.LoadManager;
	import org.agony2d.loading.URLLoadManager;
	import org.agony2d.loading.events.AProgressEvent;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.resources.events.TZipEvent;
	import org.agony2d.resources.data.AtlasData;
	
	use namespace agony_internal;
	
	/** 加載并處理完成時觸發. */
	[Event(name = "complete", type = "org.agony2d.events.AEvent")]
	
	/** 加載進度變化時觸發. */
	[Event(name = "progress", type = "org.agony2d.loading.events.AProgressEvent")]
	
	// 封裝一個zip對象，使用stream方式對zip進行動態資源解析.
	// 由AssetManager獲取，不可實例化.
	
public class TAssetBundle extends Notifier implements IPreUpdater {
	
	public function TAssetBundle( source:* ) {
		m_source = source;
		g_loaderMachine = LoadManager.getInstance();
		g_urlLoaderMachine = URLLoadManager.getInstance();
		m_ratio = 0.0;
	}
	
	public function get assetList() : Vector.<TAssetData> {
		return m_assetList;
	}
	
	public function get userData() : Object{
		return m_userData;
	}
	
	public function set userData( v:Object ) : void {
		m_userData = v;
	}
	
	
	
	agony_internal static const ASSETS_ROOT:String = "assets/";
	
	public static var g_externalField:String = "";
	agony_internal static var g_assetsMap:Object = {};
	agony_internal static var g_loaderMachine:LoadManager;
	agony_internal static var g_urlLoaderMachine:URLLoadManager;
	agony_internal static var g_bundleMap:Object = {};
	//agony_internal static var g_loadDirty:Boolean; //  是否正在加載中.
	
	agony_internal var m_zip:TZip;
	agony_internal var m_assetList:Vector.<TAssetData>;// = new <TAssetData>[];
	agony_internal var m_numLoading:int;
	agony_internal var m_numAsset:int;
	agony_internal var m_totalAsset:int;
	agony_internal var m_isAllComplete:Boolean;
	agony_internal var m_source:*;
	agony_internal var m_currAsset:TAssetData;
	agony_internal var m_ratio:Number;
	agony_internal var m_userData:Object;
	agony_internal var m_id:String;
	
	
	
	
	agony_internal function doNextBundle() : void {
		var i:int;
		var list:Array;
		var fileUrl:String;
		var loader_A:ALoader;
		var assetData:TAssetData;
		
//		trace(m_id);

		//if(g_bundleMap[m_id]){
			//TResourceManager.doLoadNext();
			//return;
		//}
		
		//if(isStart){
			//g_loadDirty = true;
			//TResourceManager.g_notifier.dispatchDirectEvent(AEvent.START);
		//}
		if (m_source is Array) {
			list = m_source as Array;
			m_totalAsset = list.length;
			// 單獨加載.
			while (i < m_totalAsset) {
				fileUrl = list[i];
				loader_A = g_urlLoaderMachine.getLoader(g_externalField + ASSETS_ROOT + fileUrl, URLLoaderDataFormat.BINARY);
				loader_A.addEventListener(AEvent.COMPLETE,       ____onFileLoaded);
				loader_A.addEventListener(IOErrorEvent.IO_ERROR, ____onFileError);
				loader_A.userData = g_assetsMap[fileUrl] = assetData = new TAssetData(fileUrl);
				assetData.m_index = ((i++) << 16) | 0xFF;
			}
			m_assetList = new Vector.<TAssetData>(m_totalAsset, true);
		}
		// 整體加載.
		else {
			m_assetList = new Vector.<TAssetData>();
			m_zip = new TZip;
			m_zip.addEventListener(TZipEvent.ZIP_FILE_COMPLETE, ____onZipFileComplete);
			m_zip.addEventListener(AEvent.COMPLETE, onAllComplete);
			m_zip.addEventListener(AProgressEvent.PROGRESS, onProgress);
			m_zip.addEventListener(IOErrorEvent.IO_ERROR, ____onIOError);
			if (m_source is String) {
				m_zip.load(new URLRequest(g_externalField + ASSETS_ROOT + String(m_source)));
			}
			else {
				m_zip.loadBytes(ByteArray(m_source));
			}
			
		}
	}
	
	agony_internal function doDispose() : void {
		if (!(m_source is Array) && m_zip) {
			m_zip.removeEventListener(TZipEvent.ZIP_FILE_COMPLETE, ____onZipFileComplete);
			m_zip.removeEventListener(AEvent.COMPLETE, onAllComplete);
			m_zip.removeEventListener(AProgressEvent.PROGRESS, onProgress);
			m_zip.removeEventListener(IOErrorEvent.IO_ERROR, ____onIOError);
		}
		this.removeAllListeners();
	}
	
	agony_internal function onProgress(e:AProgressEvent):void {
		AProgressEvent.dispatchProgressEvent(this, e.bytesLoaded, e.bytesTotal);
		
		m_ratio = e.bytesLoaded / e.bytesTotal;
		//trace(e.type, e.bytesLoaded, e.bytesTotal);
		
		//TResourceManager.g_notifier.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	agony_internal function onAllComplete(e:AEvent):void {
		m_isAllComplete = true;
		
		//if(m_numLoading == 0 && (m_numAsset == m_totalAsset || m_zip)){
			//this.____doComplete();
		//}
		this.____doCheckFinish();
	}
	
	
	agony_internal var m_preUpdateDirty:Boolean;
	
	agony_internal function ____doComplete():void {
		if (!m_preUpdateDirty) {
			FrameManager.doAddPreUpdateObject(this);
			m_preUpdateDirty = true;
		}
		
		//this.dispatchDirectEvent(AEvent.COMPLETE);
		//ResourceManager.doLoadNext();
		m_ratio = 1.0;
		
		//TResourceManager.g_notifier.dispatchDirectEvent(AEvent.CHANGE);
	}
	
	public function onPreUpdate() : void 
	{
		//m_preUpdateDirty = false;
		
		//if (m_numLoading > 0) {
			//return;
		//}
		if(m_id != null){
			g_bundleMap[m_id] = this;
		}
		this.dispatchDirectEvent(AEvent.COMPLETE);
		TResourceManager.doLoadNext();
	}
	
	agony_internal function ____onIOError(e:IOErrorEvent):void{
		LogMachine.g_instance.warning(this, "____onIOError", "Error asset URL: {0}",e.info);
	}
	
	agony_internal function ____onZipFileComplete(e:TZipEvent):void {
		var file:TZipFile;
		var assetData:TAssetData;
		var bytes:ByteArray;
		
		file = e.file;
		bytes = file.content;
		// 空文件夾.
		if(bytes.length == 0){
			return;
		}
		assetData = g_assetsMap[file.filename] = new TAssetData(file.filename);
		this.____doFileToAsset(bytes, assetData);
	}
	
	agony_internal function ____onFileLoaded(e:AEvent):void {
		this.____doFileToAsset(e.target.data as ByteArray, e.target.userData);
		
		//if(--m_numAsset == 0 && m_numLoading == 0){
			//this.____doComplete()
		//}
		//else {
			//m_isAllComplete = true;
		//}
	}
	
	agony_internal function ____onFileError(e:IOErrorEvent):void {
		LogMachine.g_instance.warning(this, "____onFileError", e.info);
		//if(m_numAsset == m_totalAsset && m_numLoading == 0){
			//this.____doComplete()
		//}
		//else {
			//m_isAllComplete = true;
		//}
		//if((m_numAsset == m_totalAsset || (m_zip && m_isAllComplete)) && m_numLoading == 0){
			//this.____doComplete();
		//}
		
		this.____doCheckFinish();
	}
	
	private function ____doCheckFinish() : void {
		if((m_numAsset == m_totalAsset || (m_zip && m_isAllComplete)) && m_numLoading == 0){
			this.____doComplete();
		}
	}
	
	agony_internal function ____doFileToAsset( bytes:ByteArray, assetData:TAssetData ) : void {
		var index:int;
		var extension:String;
		var loader_A:ALoader;
		var i:int;
		var fileName:String;
		
		fileName = assetData.m_id;
		index = fileName.lastIndexOf(".");
		extension = fileName.substring(index + 1);
		if (extension == "png" || extension == "jpg") {
			loader_A = g_loaderMachine.getBytesLoader(bytes);
			loader_A.addEventListener(AEvent.COMPLETE, onImageLoaded);
			loader_A.userData = assetData;
			m_numLoading++;
			return;
		}
		else if (extension == "swf") {
			loader_A = g_loaderMachine.getBytesLoader(bytes);
			loader_A.addEventListener(AEvent.COMPLETE, onSWFLoaded);
			loader_A.userData = assetData;
			m_numLoading++;
			return;
		}
		else if (extension == "atlas") {
			var tmpZip:TZip = new TZip;
			tmpZip.addEventListener(AEvent.COMPLETE, onFromAtlasToImage);
			m_currAsset = assetData;
			m_currAsset.m_data = new AtlasData(fileName.substring(0, index));
			tmpZip.loadBytes(bytes);
			return;
		}
		else if (extension == "xml") {
			m_assetList[m_numAsset++] = assetData;
			assetData.m_data = XML(bytes);
			LogMachine.g_instance.simplify("[ Asset - XML ]: " + fileName);
		}
		else {
			m_assetList[m_numAsset++] = assetData;
			assetData.m_data = bytes;
			LogMachine.g_instance.simplify("[ Asset - Bytes ]: " + fileName);
		}
		
		//if((m_numAsset == m_totalAsset || m_zip) && m_numLoading == 0 && m_isAllComplete){
			//this.____doComplete();
		//}
		this.____doCheckFinish();
	}
	
	private function onFromAtlasToImage(e:AEvent):void {
		var zip:TZip;
		var file:TZipFile;
		var index:int;
		var extension:String;
		var loader_A:ALoader;
		var fileName:String;
		
		zip = e.target as TZip;
		file = zip.getFileAt(0);
		fileName = file.filename;
		index = fileName.lastIndexOf(".");
		extension = fileName.substring(index + 1);
		
		if (extension == "xml") {
			(m_currAsset.m_data as AtlasData).m_atlasXML = XML(file.content);
			loader_A = g_loaderMachine.getBytesLoader(zip.getFileAt(1).content);
		}
		else {
			(m_currAsset.m_data as AtlasData).m_atlasXML = XML(zip.getFileAt(1).content);
			loader_A = g_loaderMachine.getBytesLoader(file.content);
		}
		loader_A.addEventListener(AEvent.COMPLETE, onAtlasImageLoaded);
		loader_A.userData = m_currAsset;
		m_numLoading++;
	}
	
	agony_internal function onAtlasImageLoaded(e:AEvent):void {
		var loader_A:ALoader;
		var assetData:TAssetData;
		
		loader_A = e.target as ALoader;
		assetData = loader_A.userData as TAssetData;
		(assetData.m_data as AtlasData).m_bitmapData = (loader_A.data as Bitmap).bitmapData;
		
		if (assetData.m_index & 0xFF) {
			m_assetList[assetData.m_index >> 16] = assetData;
			m_numAsset++;
		}
		else {
			m_assetList[m_numAsset++] = assetData;
		}
		
		LogMachine.g_instance.simplify("[ Asset - Atlas ]: " + loader_A.userData.m_id);
		
		--m_numLoading;
		//if(--m_numLoading == 0 && (m_numAsset == m_totalAsset || m_zip) && m_isAllComplete){
			//this.____doComplete();
			//trace("!!!!!!!!!!!!!!!");
		//}
		this.____doCheckFinish();
	}
	
	agony_internal function onImageLoaded(e:AEvent):void{
		var loader_A:ALoader;
		var assetData:TAssetData;
		
		loader_A = e.target as ALoader;
		assetData = loader_A.userData as TAssetData;
		assetData.m_data = (loader_A.data as Bitmap).bitmapData;
		
		if (assetData.m_index & 0xFF) {
			m_assetList[assetData.m_index >> 16] = assetData;
			m_numAsset++;
		}
		else {
			m_assetList[m_numAsset++] = assetData;
		}
		
		LogMachine.g_instance.simplify("[ Asset - Image ]: " + loader_A.userData.m_id);

		--m_numLoading;
		//if(--m_numLoading == 0 && (m_numAsset == m_totalAsset || m_zip) && m_isAllComplete){
			//this.____doComplete();
			//trace("!!!!!!!!!!!!!!!");
		//}
		
		
		this.____doCheckFinish();
	}
	
	agony_internal function onSWFLoaded(e:AEvent):void{
		var loader_A:ALoader;
		var assetData:TAssetData;
		
		loader_A = e.target as ALoader;
		
		assetData = loader_A.userData as TAssetData;
		
		if (assetData.m_index & 0xFF) {
			m_assetList[assetData.m_index >> 16] = assetData;
			m_numAsset++;
		}
		else {
			m_assetList[m_numAsset++] = assetData;
		}
		
		//LogMachine.g_instance.simplify("[ Asset - SWF ]:({0} - {1}) " + loader_A.userData.m_id, m_id, m_numLoading);
		LogMachine.g_instance.simplify("[ Asset - SWF ]: " + loader_A.userData.m_id);
		
		--m_numLoading;
		//if(--m_numLoading == 0 && (m_numAsset == m_totalAsset || m_zip) && m_isAllComplete){
			//this.____doComplete();
			//trace("!!!!!!!!!!!!!!!");
		//}
		
		this.____doCheckFinish();
	}
	
}
}