package org.agony2d.air {
	import flash.filesystem.File;
	
	import org.agony2d.air.files.AFolder;
	import org.agony2d.air.files.FolderType;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	/**
	 * 负责处理本地系统（文件等）
	 */
public class AirFacade {
	
	/** 代理指定文件夹(不存在则自动生成)
	 *  @param	folderName
	 *  @param	baseFolderType
	 *  @param	baseSubFolders
	 *  @example	AgonyAir.createFolder("agony_air", FolderType.DESKTOP, ["A", "B"])
	 */
	public static function createFolder( folderName:String, baseFolderType:String, baseSubFolders:Array = null ) : AFolder {
		var parentFolder:File
		var folder:File
		var subPath:String
		var path:String
		var i:int, l:int
		
		parentFolder = FolderType.getFolderByType(baseFolderType)
		path = parentFolder.nativePath
		subPath = ""
		if(baseSubFolders){
			l = baseSubFolders.length
			while(i < l){
				path += "/" + baseSubFolders[i++]
			}
		}
		folder = new File(path + "/" + folderName)
		return new AFolder(folder)
	}
	
	
}
}