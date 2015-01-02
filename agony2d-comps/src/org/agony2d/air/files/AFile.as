package org.agony2d.air.files {
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	import org.agony2d.loading.events.AProgressEvent;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.loading.events.IOErrorEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.loading.ALoader;
	import org.agony2d.loading.URLLoadManager;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	use namespace event_internal;
	
	/** [ FileProxy ]
	 *  [◆]
	 *  	1.  exists
	 *  	2.  path
	 *  	3.  size
	 *  	4.  name
	 *  	5.  extension
	 *  	6.  bytes
	 *  [◆◆]
	 *  	1.  upload
	 *  	2.  download
	 *  	3.  saveAs
	 *  	4.  trash
	 *  	5.  destroy
	 *  [★]
	 *  	a.  文件对象被创建后，路径、名称、扩展名无法再改变...!!
	 *  	b.  控制文件流
	 *  		[ APPEND ] - 写入模式使用.
	 *  		[ READ ]   - 只读模式 (文件必须存在...)
	 *  		[ UPDATE ] - ???
	 *  		[ WRITE ]  - 打开文件时，会创建任何不存在的文件，并削除现有存在文件...
	 */
public class AFile extends AbstractFile {
	
	public function AFile( file:File ) {
		super(file)
	}
	
	public function get extension() : String {
		return m_file.extension
	}
	
	public function get bytes() : ByteArray {
		return m_bytes
	}
	
	public function set bytes( v:ByteArray ) : void {
		m_bytes = v
	}
	
	public function upload() : void {
		var stream:FileStream
		
		stream = new FileStream
		try {
			stream.open(m_file, FileMode.WRITE)
			stream.writeBytes(m_bytes)
			stream.close()
		}
		catch ( e:Error ) {
			LogMachine.g_instance.warning(this, "upload", "Failed : [ " + m_file.url + " ]...")
		}
	}
	
	public function download() : void {
		if(!m_dataLoader){
			m_dataLoader = URLLoadManager.getInstance().getLoader(m_file.url, URLLoaderDataFormat.BINARY)
			m_dataLoader.addEventListener(AEvent.COMPLETE,         ____onLoaded)
			//m_dataLoader.addEventListener(AProgressEvent.PROGRESS, ____onProgress);
			m_dataLoader.addEventListener(IOErrorEvent.IO_ERROR,   ____onError)
		}
	}
	
	public function saveAs( optionalName:String ) : void {
		m_file.save(m_bytes, optionalName + m_file.extension)
	}
	
	override public function destroy() : void {
		super.destroy()
		if (m_file.exists) {
			m_file.deleteFile()
		}
	}
	
		
	agony_internal var m_bytes:ByteArray
	agony_internal var m_dataLoader:ALoader
	
	
	
	override agony_internal function dispose() : void {
		super.dispose();
		if (m_dataLoader) {
			m_dataLoader.removeEventListener(AEvent.COMPLETE,       ____onLoaded);
			m_dataLoader.removeEventListener(IOErrorEvent.IO_ERROR, ____onError);
		}
	}
	
	agony_internal function ____onLoaded( e:AEvent ) : void {
		m_bytes = m_dataLoader.data as ByteArray
		m_dataLoader = null
		this.dispatchDirectEvent(AEvent.COMPLETE)
	}
	
	agony_internal function ____onProgress( e:AProgressEvent ) : void {
		
	}
	
	agony_internal function ____onError( e:IOErrorEvent ) : void {
		m_dataLoader = null
		LogMachine.g_instance.warning(this, '____onError', 'Download(sync) failed...')
		this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR, e.text, e.errorID, e.info))
	}
	
}
}