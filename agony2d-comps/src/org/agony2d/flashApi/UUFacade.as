package org.agony2d.flashApi {
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractButtionUU;
	import org.agony2d.flashApi.core.AbstractUU;
	import org.agony2d.flashApi.core.CacheManager;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.skins.SkinUU;
	import org.agony2d.inputs.events.ATouchEvent;
	
	use namespace agony_internal;
	
	/** Agony2D for "Upper UI". */
	
	// Location的主要使用分類.
	//   1. Window的space等於Adapter的初期尺寸，stage尺寸改變時自動佈局.
	//   2. 
	
	
public class UUFacade {
	
	/** 默認的觸摸從按鈕上面移出移入時的顯示變化類型. */
	public static function get defaultOutInReaction() : String {
		return AbstractButtionUU.g_outInReaction;
	}
	
	public static function set defaultOutInReaction( v:String ) : void {
		ButtonOutInReaction.doValidateValue(v);
		AbstractButtionUU.g_outInReaction = v;
	}
	
	/**
	 * 註冊根渲染支點.
	 * 
	 * @param stageId
	 */	
	public static function registerRoot( stageId:String = null ) : void {
		AbstractUU.registerRoot(stageId)
	}
	
	/**
	 * 註銷根渲染支點.
	 * 
	 * @param stageId
	 */	
	public static function unregisterRoot( stageId:String ) : void {
		AbstractUU.unregisterRoot(stageId);
	}
	
	/**
	 * 獲取根顯示支點.
	 * 
	 * @param id
	 */	
	public static function getRoot( id:String = null ) : RootUU {
		return AbstractUU.getRoot(id);
	}
	
	/**
	 * 獲取視窗，不存在則創建.
	 * 
	 * @param	stateData	複寫StateUU的類對象或類名稱.
	 */
	public static function getWindow( stateData:*, stageId:String = null ) : ViewUU {
		var win_A:ViewUU;
		var winName:String;
		
		winName = (stateData is Class) ? getQualifiedClassName(stateData) : stateData as String;
		if ((m_winList ||= {})[winName]) {
			return m_winList[winName];
		}
		m_winList[winName] = win_A = new ViewUU(winName, stageId);
		return win_A;
	}
	
	/**
	 * 關閉全部視窗.
	 * 
	 * @param	...exceptant
	 */
	public static function closeAllWindows( ...exceptant ) : void {
		var winName:String;
		
		if (exceptant.length == 0) {
			for (winName in m_winList) {
				m_winList[winName].close();
			}
		}
		else {
			for (winName in m_winList) {
				if (exceptant.indexOf(getDefinitionByName(winName) as Class) == -1) {
					m_winList[winName].close();
				}
			}
		}
	}
	
	
	
	//////////////////////////////
	// Cache Images
	//////////////////////////////
	
	/** @private */
	agony_internal static var m_winList:Object;
	
	
	
	/**
	 * 緩存管理器.
	 */
	public static function get cache() : CacheManager {
		return CacheManager.g_instance ||= new CacheManager;
	}
	
	
	//////////////////////////////
	// Skin
	//////////////////////////////
	
	public static function registerSkin( id:String, skinRef:Class, ...skinArgs ) : void {
		SkinUU.registerSkin(id, skinRef, skinArgs);
	}
	
	public static function registerDisposableSkin( id:String, skinRef:Class, ...skinArgs ) : void {
		SkinUU.registerDisposableSkin(id, skinRef, skinArgs);
	}
	
	/**
	 * 削除全部可釋放皮膚.
	 */
	public static function clearAllDisposableSkins() : void {
		SkinUU.clearAllDisposableSkins();
	}
	
	
	
	
	
	
	//////////////////////////////
	// Double Click
	//////////////////////////////
	
	
	/** @private */
	agony_internal static var g_doublePressNodeList:Dictionary;
	/** @private */
	agony_internal static var g_doubliePressInterval:Number = 0.25;
	
	
	/** @private */
	public static function addDoublePressEvent( node:NodeUU, listener:Function, priority:int = 0 ) : void {
		if (!g_doublePressNodeList) {
			g_doublePressNodeList = new Dictionary;
		}
		if (!g_doublePressNodeList[node]) {
			g_doublePressNodeList[node] = -1;
			node.addEventListener(ATouchEvent.PRESS, ____onCheckDoublePress, 44000);
		}
		node.addEventListener(ATouchEvent.DOUBLE_PRESS, listener, priority);
	}
	
	/** @private */
	public static function removeDoublePressEvent( node:NodeUU, listener:Function ) : void {
		if (g_doublePressNodeList[node]) {
			node.removeEventListener(ATouchEvent.DOUBLE_PRESS, listener);
			node.removeEventListener(ATouchEvent.PRESS, ____onCheckDoublePress);
			delete g_doublePressNodeList[node];
		}
	}
	
	/** @private */
	public static function removeAllDoublePressEvent( node:NodeUU ) : void {
		if (g_doublePressNodeList[node]) {
			node.removeEventAllListeners(ATouchEvent.DOUBLE_PRESS);
			node.removeEventListener(ATouchEvent.PRESS, ____onCheckDoublePress);
			delete g_doublePressNodeList[node];
		}
	}
	
	/** @private */
	agony_internal static function ____onCheckDoublePress( e:ATouchEvent ) : void {
		var node:NodeUU;
		var event:ATouchEvent;
		
		node = e.target as NodeUU;
		if (g_doublePressNodeList[node] == -1) {
			g_doublePressNodeList[node] = setTimeout(doInvalidateDoublePress, g_doubliePressInterval * 1000, node);
		}
		else {
			g_doublePressNodeList[node]  =  -1;
			event                        =  new ATouchEvent(ATouchEvent.DOUBLE_PRESS);
			event.m_touch                =  e.m_touch;
			node.dispatchEvent(event);
			// 中斷冒泡執行.
			e.breakExecution();
		}
	}
	
	/** @private */
	agony_internal static function doInvalidateDoublePress( node:NodeUU ) : void {
		//trace("doInvalidateDoublePress...");
		if (g_doublePressNodeList[node]) {
			g_doublePressNodeList[node] = -1;
		}
	}
	
	/**
	 * 設定觸發雙擊事件的時間間隔.
	 * 
	 * @param	v	optional 0.25s
	 */
	public static function setDoubliePressInterval( v:Number ) : void {
		g_doubliePressInterval = v;
	}
}
}