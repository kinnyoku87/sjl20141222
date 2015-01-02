package res.handlers 
{
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.core.IAssetBundle;
	import org.agony2d.resources.core.IResHandler;
	import org.agony2d.resources.data.AtlasData;
	
	public class AtlasResHandler2 implements IResHandler
	{
		
		public function onHandle( bundle:IAssetBundle, handleArgs:Array ) : void {
			var atlas:AtlasData;
			var list:Array;
			var l:int;
			
			list = bundle.getAssetList()
			l = list.length;
			while (--l > -1) {
				atlas = list[l].data as AtlasData;
				UUFacade.cache.addAtlas2(atlas);
			}
		}
	}

}