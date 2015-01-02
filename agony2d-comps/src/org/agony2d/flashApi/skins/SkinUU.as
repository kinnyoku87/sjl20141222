package org.agony2d.flashApi.skins {
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.skins.inside.SkinRegistry;
	
	use namespace agony_internal;
	
public class SkinUU {
	
	/**
	 * 初期化.
	 * 
	 * @param	skinArgs
	 */
	agony_internal function initialize( skinArgs:Array ) : void {
		LogMachine.g_instance.error(this, "initialize", "The method must be overwrited !!!");
	}
	
	
	
	/** @private */
	agony_internal var m_id:String;
	/** @private */
	agony_internal var m_disposable:Boolean;
	
	
	/** @private */
	agony_internal static var g_skinList:Object = {};
	/** @private */
	agony_internal static var g_skinRegistryList:Object = {};
	
	
	
	/////////////////////////
	// Static
	/////////////////////////
	
	agony_internal static function registerSkin( id:String, skinRef:Class, skinArgs:Array ) : void {
		if (g_skinRegistryList[id]) {
			LogMachine.g_instance.error("UU", "registerSkin", "不可加入重複id的組件皮膚: [ {0} ]", id);
		}
		g_skinRegistryList[id] = new SkinRegistry(id, skinRef, skinArgs, false);
	}
	
	agony_internal static function registerDisposableSkin( id:String, skinRef:Class, skinArgs:Array ) : void {
		if (g_skinRegistryList[id]) {
			LogMachine.g_instance.error("UU", "registerDisposableSkin", "不可加入重複id的組件皮膚: [ {0} ]", id);
		}
		g_skinRegistryList[id] = new SkinRegistry(id, skinRef, skinArgs, true);
	}
	
	/**
	 * @private
	 * 清除全部一次性使用皮膚.
	 */
	agony_internal static function clearAllDisposableSkins() : void {
		var id:*;
		
		for ( id in g_skinList ) {
			if (g_skinList[id].m_disposable) {
				delete g_skinList[id];
			}
		}
	}
	
	/**
	 * @private
	 * 由id名稱檢索或生成皮膚.
	 */
	agony_internal static function toRetrieveSkin( id:String ) : SkinUU {
		var registry:SkinRegistry;
		
		if (!g_skinList || (!g_skinList[id] && !g_skinRegistryList[id])) {
			LogMachine.g_instance.error("UU", "____toRetrieveSkin", "Not exist skin: [ {0} ] !!!", id);
		}
		if (!g_skinList[id]) {
			registry = g_skinRegistryList[id];
			g_skinList[id] = registry.toSkinInstance();
			if (!registry.m_disposable) {
				delete g_skinRegistryList[id];
			}
		}
		return g_skinList[id];
	}
	
}
}