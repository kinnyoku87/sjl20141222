package air
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.display.Sprite;
	
	import assets.air.AirAssets;
	
	import org.agony2d.Agony;
	import org.agony2d.air.AirFacade;
	import org.agony2d.air.events.FileEvent;
	import org.agony2d.air.files.AFile;
	import org.agony2d.air.files.AFolder;
	import org.agony2d.air.files.FolderType;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.loading.ALoader;
	import org.agony2d.loading.LoadManager;
	
public class FileTest extends Sprite {
	
	public function FileTest() {
		Agony.startup(stage)
		this.doInitFile()
		this.doInitController()
	}
	
	private function doInitFile() : void {
		mFolder = AirFacade.createFolder("agony_air", FolderType.DESKTOP, ["A", "B"])
		
		mImgFile = mFolder.createFile("img_air_role", "png")
			
		if(mImgFile.exists){
			mImgFile.download()
			mImgFile.addEventListener(AEvent.COMPLETE, onDataLoaded)
		}
		else {
			mBA = (new (AirAssets.IMG_A)).bitmapData
			mImgFile.bytes = mBA.encode(mBA.rect, new PNGEncoderOptions)
			mImgFile.upload()
		}
	}
	
	private function doInitController() : void {
		mFolder.addEventListener(FileEvent.SELECT_FILE, onSelectFile)
		mFolder.addEventListener(FileEvent.SELECT_MULTIPLE_FILES, onSelectMultipleFiles)
		
		KeyboardManager.getInstance().getState().press.addEventListener("N", function(e:AEvent):void{
			mFolder.browseFile("single")
		})
		KeyboardManager.getInstance().getState().press.addEventListener("M", function(e:AEvent):void{
			mFolder.browseMultipleFiles("multiple")
		})
		KeyboardManager.getInstance().getState().press.addEventListener("S", function(e:AEvent):void{
			mImgFile.saveAs("save as...")
		})
		KeyboardManager.getInstance().getState().press.addEventListener("K", function(e:AEvent):void{
			mFolder.destroy()
		})
		KeyboardManager.getInstance().getState().press.addEventListener("L", function(e:AEvent):void{
			mImgFile.destroy()
		})
		KeyboardManager.getInstance().getState().press.addEventListener("C", function(e:AEvent):void{
			trace(mFolder.contains("img_air_role", "png"))
		})
		KeyboardManager.getInstance().getState().press.addEventListener("P", function(e:AEvent):void{
			trace(mFolder.path)
		})
		KeyboardManager.getInstance().getState().press.addEventListener("Q", function(e:AEvent):void{
			trace(mFolder.size)
		})
	}
	
	
	private var mFolder:AFolder
	private var mBA:BitmapData
	private var mImgFile:AFile
	
	
	private function onDataLoaded(e:AEvent):void{
		LoadManager.getInstance().getBytesLoader(mImgFile.bytes).addEventListener(AEvent.COMPLETE, onImgLoaded)
//		mImgFile.kill()
		trace("download complete...")
	}
	
	private function onImgLoaded(e:AEvent):void{
		mBA = (e.target as ALoader).data.bitmapData
			
		this.addChild(new Bitmap(mBA))
	}
	
	
	private function onSelectFile(e:FileEvent):void{
		trace(e.filePathData)
	}
	private function onSelectMultipleFiles(e:FileEvent):void{
		trace(e.filePathData)
	}
}
}