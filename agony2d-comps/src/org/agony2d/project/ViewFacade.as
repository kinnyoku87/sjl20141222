package org.agony2d.project {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import org.agony2d.base.inside.agony_internal;
	
	import org.agony2d.display.core.AbstractViewState;
	
	use namespace agony_internal;
	
public class ViewFacade {
	
	/**
	 * 當前視圖狀態是否為指定視圖狀態.
	 * 
	 * @param	stateViewData
	 * @return
	 */
	public static function isCurrentStateView( stateViewData:* ) : Boolean {
		var stateViewRef:Class;
		
		if (!stateViewData && !g_stateView) {
			return true;
		}
		stateViewRef = (stateViewData is String) ? getDefinitionByName(stateViewData) as Class : stateViewData as Class;
		return (g_stateView is stateViewRef);
	}
	
	/**
	 * 設定視圖狀態.
	 * 
	 * @param	stateViewData
	 * @param	...stateArgs
	 */
	public static function setStateView( stateViewData:*, ...stateArgs ) : void {
		var stateViewRef:Class;
		
		if (g_stateView) {
			g_stateView.onExit();
			g_stateView = null;
		}
		if (stateViewData) {
			stateViewRef = (stateViewData is String) ? getDefinitionByName(stateViewData) as Class : stateViewData as Class;
			g_stateView = new stateViewRef;
			g_stateView.m_stateArgs = stateArgs;
			g_stateView.onEnter();
		}
	}
	
	
	
	/** @private */
	agony_internal static var g_stateView:StateVV;
}
}