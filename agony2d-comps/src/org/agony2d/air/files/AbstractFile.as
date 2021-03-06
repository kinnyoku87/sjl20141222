package org.agony2d.air.files {
	import flash.filesystem.File;
	import org.agony2d.events.Notifier;
	
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class AbstractFile extends Notifier {
	
	public function AbstractFile( file:File ) {
		super(null)
		m_file = file
	}
	
	public function get rawFile() : File {
		return m_file
	}
	
	public function get exists() : Boolean {
		return m_file.exists
	}
	
	public function get path() : String {
		return m_file.nativePath
	}
	
	public function get url() : String {
		return m_file.url
	}
	
	public function get name() : String {
		return m_file.name
	}
	
	public function get size() : Number {
		if (m_file.isDirectory) {
			return this.calcFileSize(m_file)
		}
		return m_file.size
	}
	
	public function trash() : void {
		this.removeAllListeners()
		if(m_file.exists){
			m_file.moveToTrash()
		}
	}
	
	public function destroy() : void {
		this.removeAllListeners()
	}
	
	
	
	agony_internal var m_file:File
	
	
	
	agony_internal function dispose() : void {
		this.removeAllListeners()
	}
	
	agony_internal function calcFileSize( target:File ) : Number {
		var result:Number
		var subTarget:File
		var subTargetList:Array
		var i:int, l:int
		
		result         =  0
		subTargetList  =  target.getDirectoryListing()
		l              =  subTargetList.length
		while(--l > -1) {
			subTarget = subTargetList[l]
			result += subTarget.isDirectory ? this.calcFileSize(subTarget) : subTarget.size
		}
		return result
	}
}
}