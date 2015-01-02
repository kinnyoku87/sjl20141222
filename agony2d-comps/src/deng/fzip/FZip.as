package deng.fzip
{
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.*;

	[Event(name="fileLoaded", type="deng.fzip.FZipEvent")]
	[Event(name="parseError", type="deng.fzip.FZipErrorEvent")]
	[Event(name="complete", type="flash.events.Event")]
	[Event(name="httpStatus", type="flash.events.HTTPStatusEvent")]
	[Event(name="ioError", type="flash.events.IOErrorEvent")]
	[Event(name="open", type="flash.events.Event")]
	[Event(name="progress", type="flash.events.ProgressEvent")]
	[Event(name="securityError", type="flash.events.SecurityErrorEvent")]

	public class FZip extends EventDispatcher {
		
		public function FZip(filenameEncoding:String = "utf-8") {
			super();
			charEncoding = filenameEncoding;
			parseFunc = parseIdle;
		}
		
		protected var filesList:Array;
		protected var filesDict:Dictionary;
		protected var urlStream:URLStream;
		protected var charEncoding:String;
		protected var parseFunc:Function;
		
		protected var currentFile:FZipFile;
		protected var ddBuffer:ByteArray;
		protected var ddSignature:uint;
		protected var ddCompressedSize:uint;
		
		// PKZIP record signatures
		internal static const SIG_CENTRAL_FILE_HEADER:uint = 0x02014b50;
		internal static const SIG_SPANNING_MARKER:uint = 0x30304b50;
		internal static const SIG_LOCAL_FILE_HEADER:uint = 0x04034b50;
		internal static const SIG_DIGITAL_SIGNATURE:uint = 0x05054b50;
		internal static const SIG_END_OF_CENTRAL_DIRECTORY:uint = 0x06054b50;
		internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:uint = 0x06064b50;
		internal static const SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:uint = 0x07064b50;
		internal static const SIG_DATA_DESCRIPTOR:uint = 0x08074b50;
		internal static const SIG_ARCHIVE_EXTRA_DATA:uint = 0x08064b50;
		internal static const SIG_SPANNING:uint = 0x08074b50;
		
		public function get active():Boolean {
			return (parseFunc !== parseIdle);
		}
		
		public function load(request:URLRequest):void {
			if(!urlStream && parseFunc == parseIdle) {
				urlStream = new URLStream();
				urlStream.endian = Endian.LITTLE_ENDIAN;
				addEventHandlers();
				filesList = [];
				filesDict = new Dictionary();
				parseFunc = parseSignature;
				urlStream.load(request);
			}
		}
		
		public function loadBytes(bytes:ByteArray):void {
			if (!urlStream && parseFunc == parseIdle) {
				filesList = [];
				filesDict = new Dictionary();
				bytes.position = 0;
				bytes.endian = Endian.LITTLE_ENDIAN;
				parseFunc = parseSignature;
				if (parse(bytes)) {
					parseFunc = parseIdle;
					dispatchEvent(new Event(Event.COMPLETE));
				} else {
					dispatchEvent(new FZipErrorEvent(FZipErrorEvent.PARSE_ERROR, "EOF"));
				}
			}
		}

		public function close():void {
			if(urlStream) {
				parseFunc = parseIdle;
				removeEventHandlers();
				urlStream.close();
				urlStream = null;
			}
		}

		/**
		 * Serializes this zip archive into an IDataOutput stream (such as 
		 * ByteArray or FileStream) according to PKZIP APPNOTE.TXT
		 * 
		 * @param stream The stream to serialize the zip file into.
		 * @param includeAdler32 To decompress compressed files, FZip needs Adler32
		 * 		checksums to be injected into the zipped files. FZip will do that 
		 * 		automatically if includeAdler32 is set to true. Note that if the
		 * 		ZIP contains a lot of files, or big files, the calculation of the
		 * 		checksums may take a while.
		 */		
		public function serialize(stream:IDataOutput, includeAdler32:Boolean = false):void {
			if(stream != null && filesList.length > 0) {
				var endian:String = stream.endian;
				var ba:ByteArray = new ByteArray();
				stream.endian = ba.endian = Endian.LITTLE_ENDIAN;
				var offset:uint = 0;
				var files:uint = 0;
				for(var i:int = 0; i < filesList.length; i++) {
					var file:FZipFile = filesList[i] as FZipFile;
					if(file != null) {
						// first serialize the central directory item
						// into our temporary ByteArray
						file.serialize(ba, includeAdler32, true, offset);
						// then serialize the file itself into the stream
						// and update the offset
						offset += file.serialize(stream, includeAdler32);
						// keep track of how many files we have written
						files++;
					}
				}
				if(ba.length > 0) {
					// Write the central directory items
					stream.writeBytes(ba);
				}
				// Write end of central directory:
				// Write signature
				stream.writeUnsignedInt(SIG_END_OF_CENTRAL_DIRECTORY);
				// Write number of this disk (always 0)
				stream.writeShort(0);
				// Write number of this disk with the start of the central directory (always 0)
				stream.writeShort(0);
				// Write total number of entries on this disk
				stream.writeShort(files);
				// Write total number of entries
				stream.writeShort(files);
				// Write size
				stream.writeUnsignedInt(ba.length);
				// Write offset of start of central directory with respect to the starting disk number
				stream.writeUnsignedInt(offset);
				// Write zip file comment length (always 0)
				stream.writeShort(0);
				// Reset endian of stream
				stream.endian = endian;
			}
		}
	
		public function getFileCount():uint {
			return filesList ? filesList.length : 0;
		}
			
		public function getFileAt(index:uint):FZipFile {
			return filesList ? filesList[index] as FZipFile : null;
		}
		
		public function getFileByName(name:String):FZipFile {
			return filesDict[name] ? filesDict[name] as FZipFile : null;
		}

		public function addFile(name:String, content:ByteArray = null, doCompress:Boolean = true):FZipFile {
			return addFileAt(filesList ? filesList.length : 0, name, content, doCompress);
		}
	
		public function addFileFromString(name:String, content:String, charset:String = "utf-8", doCompress:Boolean = true):FZipFile {
			return addFileFromStringAt(filesList ? filesList.length : 0, name, content, charset, doCompress);
		}
			
		public function addFileAt(index:uint, name:String, content:ByteArray = null, doCompress:Boolean = true):FZipFile {
			if(filesList == null) {
				filesList = [];
			}
			if(filesDict == null) {
				filesDict = new Dictionary();
			} else if(filesDict[name]) {
				throw(new Error("File already exists: " + name + ". Please remove first."));
			}
			var file:FZipFile = new FZipFile();
			file.filename = name;
			file.setContent(content, doCompress);
			if(index >= filesList.length) {
				filesList.push(file);
			} else {
				filesList.splice(index, 0, file);
			}
			filesDict[name] = file;
			return file;
		}
		
		public function addFileFromStringAt(index:uint, name:String, content:String, charset:String = "utf-8", doCompress:Boolean = true):FZipFile {
			if(filesList == null) {
				filesList = [];
			}
			if(filesDict == null) {
				filesDict = new Dictionary();
			} else if(filesDict[name]) {
				throw(new Error("File already exists: " + name + ". Please remove first."));
			}
			var file:FZipFile = new FZipFile();
			file.filename = name;
			file.setContentAsString(content, charset, doCompress);
			if(index >= filesList.length) {
				filesList.push(file);
			} else {
				filesList.splice(index, 0, file);
			}
			filesDict[name] = file;
			return file;
		}
		
		public function removeFileAt(index:uint):FZipFile {
			if(filesList != null && filesDict != null && index < filesList.length) {
				var file:FZipFile = filesList[index] as FZipFile;
				if(file != null) {
					filesList.splice(index, 1);
					delete filesDict[file.filename];
					return file;
				}
			}
			return null;
		}
		
		
		
		///////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////
		
		protected function addEventHandlers():void {
			urlStream.addEventListener(Event.COMPLETE, defaultHandler);
			urlStream.addEventListener(Event.OPEN, defaultHandler);
			urlStream.addEventListener(HTTPStatusEvent.HTTP_STATUS, defaultHandler);
			urlStream.addEventListener(IOErrorEvent.IO_ERROR, defaultErrorHandler);
			urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, defaultErrorHandler);
			urlStream.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		}
		
		protected function removeEventHandlers():void {
			urlStream.removeEventListener(Event.COMPLETE, defaultHandler);
			urlStream.removeEventListener(Event.OPEN, defaultHandler);
			urlStream.removeEventListener(HTTPStatusEvent.HTTP_STATUS, defaultHandler);
			urlStream.removeEventListener(IOErrorEvent.IO_ERROR, defaultErrorHandler);
			urlStream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, defaultErrorHandler);
			urlStream.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
		}
		
		protected function progressHandler(evt:ProgressEvent):void {
			dispatchEvent(evt.clone());
			//trace(evt.bytesLoaded, evt.bytesTotal, urlStream.bytesAvailable);
			try {
				// 從這裡開始解析接受到的字節碼，如果返回TRUE，解析完成.
				if(parse(urlStream)) {
					close();
					dispatchEvent(new Event(Event.COMPLETE));
				}
			// 解析發生錯誤，中斷.
			} catch(e:Error) {
				close();
				if(hasEventListener(FZipErrorEvent.PARSE_ERROR)) {
					dispatchEvent(new FZipErrorEvent(FZipErrorEvent.PARSE_ERROR, e.message));
				} else {
					throw(e);
				}
			}
		}
		
		protected function defaultHandler(evt:Event):void {
			dispatchEvent(evt.clone());
		}
		
		protected function defaultErrorHandler(evt:Event):void {
			close();
			dispatchEvent(evt.clone());
		}
		
		/**
		 * @private
		 */		
		protected function onFileLoaded():void {
			filesList.push(currentFile);
			if (currentFile.filename) {
				filesDict[currentFile.filename] = currentFile;
			}
			dispatchEvent(new FZipEvent(FZipEvent.FILE_LOADED, currentFile));
			currentFile = null;
		}
		
		protected function parse(stream:IDataInput):Boolean {
			while (parseFunc(stream)) {}
			return (parseFunc === parseIdle);
		}
		
		
		
		///////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////
		
		protected function parseIdle(stream:IDataInput):Boolean {
			return false;
		}
		
		// 解析入口.
		protected function parseSignature(stream:IDataInput):Boolean {
			
			if (stream.bytesAvailable >= 4) {
				// 讀取一個4字節整數
				var sig:uint = stream.readUnsignedInt();
				switch(sig) {
					case SIG_LOCAL_FILE_HEADER:
						parseFunc = parseLocalfile;
						currentFile = new FZipFile(charEncoding);
						break;
					case SIG_CENTRAL_FILE_HEADER:
					case SIG_END_OF_CENTRAL_DIRECTORY:
					case SIG_SPANNING_MARKER:
					case SIG_DIGITAL_SIGNATURE:
					case SIG_ZIP64_END_OF_CENTRAL_DIRECTORY:
					case SIG_ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR:
					case SIG_DATA_DESCRIPTOR:
					case SIG_ARCHIVE_EXTRA_DATA:
					case SIG_SPANNING:
						parseFunc = parseIdle;
						break;
					default:
						throw(new Error("Unknown record signature: 0x" + sig.toString(16)));
						break;
				}
				return true;
			}
			return false;
		}
		
		protected function findDataDescriptor(stream:IDataInput):Boolean {
			while(stream.bytesAvailable > 0) {
				var c:uint = stream.readUnsignedByte();
				ddSignature = (ddSignature >>> 8) | (c << 24);
				if(ddSignature == SIG_DATA_DESCRIPTOR) {
					// Data descriptor signature found
					// Remove last three (signature-) bytes from buffer
					ddBuffer.length -= 3;
					parseFunc = validateDataDescriptor;
					return true;
				}
				ddBuffer.writeByte(c);
			}
			return false;
		}
		
		protected function validateDataDescriptor(stream:IDataInput):Boolean {
			// TODO [CW]
			// In case validation fails, we should reexamine the 
			// alleged sig/crc32/size bytes (minus the first byte)
			if (stream.bytesAvailable >= 12) {
				// Get data from descriptor
				var ddCRC32:uint = stream.readUnsignedInt();
				var ddSizeCompressed:uint = stream.readUnsignedInt();
				var ddSizeUncompressed:uint = stream.readUnsignedInt();
				// If the compressed size from the descriptor matches the buffer length,
				// we can be reasonably sure that this really is the descriptor.
				if(ddBuffer.length == ddSizeCompressed) {
					ddBuffer.position = 0;
					// Inject the descriptor data into current file
					currentFile._crc32 = ddCRC32;
					currentFile._sizeCompressed = ddSizeCompressed;
					currentFile._sizeUncompressed = ddSizeUncompressed;
					// Copy buffer into current file
					currentFile.parseContent(ddBuffer);
					// Register file and dispatch FILE_LOADED event
					onFileLoaded();
					// Continue with next file
					parseFunc = parseSignature;
				} else {
					// TODO [CW] check endianness (i think it's big endian, gotta set that on buffer)
					ddBuffer.writeUnsignedInt(ddCRC32);
					ddBuffer.writeUnsignedInt(ddSizeCompressed);
					ddBuffer.writeUnsignedInt(ddSizeUncompressed);
					parseFunc = findDataDescriptor;
				}
				return true;
			}
			return false;
		}
		
		protected function parseLocalfile(stream:IDataInput):Boolean {
			if(currentFile.parse(stream)) {
				if(currentFile.hasDataDescriptor) {
					
					// This file uses a data descriptor:
					
					// "[A data] descriptor exists only if bit 3 of the
					// general purpose bit flag is set.  It is byte aligned
					// and immediately follows the last byte of compressed data.
					// This descriptor is used only when it was not possible to
					// seek in the output .ZIP file, e.g., when the output .ZIP file
					// was standard output or a non-seekable device" (APPNOTE.TXT).
					
					// The file parser stops parsing after the file header.
					// We need to figure out the compressed size of the file's
					// payload (by searching ahead for the data descriptor
					// signature). See findDataDescriptor() below.
					
					parseFunc = findDataDescriptor;
					ddBuffer = new ByteArray();
					ddSignature = 0;
					ddCompressedSize = 0;
					return true;
				} else {
					// No data descriptor: We're done.
					// Register file and dispatch FILE_LOADED event
					onFileLoaded();
					// TODO [CW] why do we check for parseIdle here?
					if (parseFunc != parseIdle) {
						parseFunc = parseSignature;
						return true;
					}
				}
			}
			return false;
		}
	}
}