package res.handlers {
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.core.IAssetBundle;
	import org.agony2d.resources.core.IAssetData;
	import org.agony2d.resources.core.IResHandler;
	import org.agony2d.resources.data.AtlasData;
	import org.agony2d.resources.ResMachine;
	
public class Atlas2_ResHandler implements IResHandler {
	
	public function onHandle( bundle:IAssetBundle, handleArgs:Array ) : void {
		
		//trace(bundle.id, bundle.isReady(), bundle.numAssets, "...", bundle);
		
		//trace(handleArgs);
		
		var atlas:AtlasData;
		var list:Array;
		var l:int;
		var asset:IAssetData;
		
		list = bundle.getAssetList()
		l = list.length;
		while (--l > -1) {
			asset = list[l];
			if (asset.hasError()) {
				Agony.getLog().message(this, "不存在的Atlas資源: [ {0} ]", asset.id);
				
				ResMachine.getInstance().dispatchDirectEvent(asset.id);
			}
			else {
				atlas = asset.data as AtlasData;
				UUFacade.cache.addAtlas2(atlas, 1);
				UUFacade.cache.addEventListener(atlas.m_path, onDisposeAtlasAsset);
				//bundle.dispose();
			}
		}
	}
	
	private function onDisposeAtlasAsset(e:AEvent):void {
		UUFacade.cache.removeEventListener(e.type, onDisposeAtlasAsset);
		ResMachine.getInstance().getBundle(e.type + ".atlas").dispose();
		
		Agony.getLog().message(this, "释放Atlas资源: [ {0} ]", e.type);
	}
	
}
}