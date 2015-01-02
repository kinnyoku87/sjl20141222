package org.agony2d.resources.events
{
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.resources.TZipFile;
	
	use namespace agony_internal;
	
	public class TZipEvent extends AEvent
	{
		public function TZipEvent( type:String, zipFile:TZipFile = null )
		{
			super(type);
			m_zipFile = zipFile;
		}
		
		public static const ZIP_FILE_COMPLETE:String = "zipFileComplete";
		
		
		public function get file() : TZipFile {
			return m_zipFile;
		}
		
		
		
		private static var g_zipFileEvent:TZipEvent = new TZipEvent(TZipEvent.ZIP_FILE_COMPLETE);
		
		
		public static function dispatchZipFileEvent( target:Notifier, zipFile:TZipFile ) : void {
			g_zipFileEvent.m_zipFile = zipFile;
			target.dispatchEvent(g_zipFileEvent);
		}
		
		
		agony_internal var m_zipFile:TZipFile;
			
	}
}