package org.agony2d.flashApi.tips {
	import flash.utils.Dictionary;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.core.AbstractUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.inputs.Touch;
	import org.agony2d.inputs.events.ATouchEvent;
	
	use namespace agony_internal;
	
	// 可能情況.
	//   1. 註冊Node，移動到上面時觸發 (彈起狀態).
	//   2. 
	
	/** 工具提示. */
public class UUToolTip {
	
	/** 當前tips目標. */
	public static function get currTarget() : NodeUU {
		return g_currTarget;
	}
	
	/** 指定是否當滑鼠移動到節點上面時，會自動顯示tip. */
	public static function get enabled() : Boolean {
		return g_enabled;
	}
	
	public static function set enabled( b:Boolean ) : void {
		g_enabled = b;
	}
	
	/**
	 * 設定按下時的提示反應類型.
	 * 
	 * @param v
	 */	
	public static function setReactionTypeForPress( v:int ) : void {
		g_reactionTypeForPress = v;
	}
	
	/**
	 * 設定默認過渡效果狀態.
	 * 
	 * @param	effectStateRef
	 */
	public static function setDefaultEffect( effectStateRef:Class ) : void {
		g_defaultEffectStateRef = effectStateRef;
	}
	
	/**
	 * 註冊提示.
	 * 
	 * @param	target
	 * @param	viewStateRef
	 * @param	effectStateRef
	 */
	public static function registerTip( target:NodeUU, viewStateRef:Class, effectStateRef:Class = null ) : TipData {
		var tipData:TipData;
		
		// 初期化.
		if (!g_target2TipDataMap) {
			g_target2TipDataMap = new Dictionary;
			g_cachedEffectList = new Dictionary;
		}
		// 僅可註冊一次.
		if (g_target2TipDataMap[target]) {
			LogMachine.g_instance.error("UUToolTip", "registerTip", "目標已經註冊tip.");
		}
		tipData = g_target2TipDataMap[target] = new TipData;
		tipData.m_viewStateRef = viewStateRef;
		tipData.m_effectStateRef = effectStateRef ? effectStateRef : g_defaultEffectStateRef;
		tipData.m_target = target;
		target.addEventListener(ATouchEvent.HOVER,  ____onTargetHover,   AbstractUU.UU_TOOLTIP);
		target.addEventListener(ATouchEvent.LEAVING, ____onTargetLeave,   AbstractUU.UU_TOOLTIP);
		target.addEventListener(ATouchEvent.PRESS, ____onTargetPress,   AbstractUU.UU_TOOLTIP);
		target.addEventListener(NodeEvent.DISPOSE, ____onTargetDispose, AbstractUU.UU_TOOLTIP);
		
		return tipData;
	}
	
	/**
	 * 註銷提示.
	 * 
	 * @param	target
	 */
	public static function unregisterTip( target:NodeUU ) : void {
		if (!g_target2TipDataMap[target]) {
			LogMachine.g_instance.error("UUToolTip", "unregisterTip", "目標未註冊tip.");
		}
		target.removeEventListener(ATouchEvent.HOVER,   ____onTargetHover);
		target.removeEventListener(ATouchEvent.LEAVING, ____onTargetLeave);
		target.removeEventListener(ATouchEvent.PRESS,   ____onTargetPress);
		target.removeEventListener(NodeEvent.DISPOSE,   ____onTargetDispose);
		delete g_target2TipDataMap[target];
	}
	
	/**
	 * 隱藏提示.
	 * 
	 * @param	hasEffect
	 */	
	public static function hideTip( hasEffect:Boolean = true ) : void {
		____doHideTip(hasEffect);
	}
	
	/**
	 * 顯示被註冊目標的提示.
	 * 
	 * @param	target
	 */
	public static function showTargetTip( target:NodeUU ) : void {
		
	}
	
	//public static function showNoTargetTip( userData:*, viewStateRef:Class, effectStateRef:Class = null, stageId:String = null ) : void {
		//
	//}
	
	
	
	/** @private */
	agony_internal static var g_enabled:Boolean;
	/** @private */
	agony_internal static var g_tipFusion:TipFusionUU;
	/** @private */
	agony_internal static var g_target2TipDataMap:Dictionary; // target:TipData.
	/** @private */
	agony_internal static var g_cachedEffectList:Dictionary; // effRef:effInstance
	/** @private */
	agony_internal static var g_currTarget:NodeUU; // 若為NULL，表示當前tipFusion為被加入到RootUU.
	/** @private */
	agony_internal static var g_currEffectState:TipEffectStateUU;
	/** @private */
	agony_internal static var g_reactionTypeForPress:int;
	/** @private */
	agony_internal static var g_defaultEffectStateRef:Class;
	
	
	
	
	/** @private */
	agony_internal static function ____onTargetHover( e:ATouchEvent ) : void {
		var tipData:TipData;
		var touch:Touch;
		
		touch = e.touch;
		
		//-- Exit --------------------------
		
		// 初期化tip視圖.
		if(!g_tipFusion){
			g_tipFusion = new TipFusionUU;
			// tip視圖不可觸摸.
			g_tipFusion.touchable = false;
		}
		
		// 檢測并移除上一次殘留tip退出效果.
		if(g_currEffectState){
			g_currEffectState.onEnterInterrupted();
			g_currEffectState = null;
		}
		
		if(g_currTarget){
			____doViewExit();
		}
		
		//-- Enter --------------------------
		
		// 僅彈起時有效.
		if(!touch.isReleaseState) {
			return
		}
		
		// tip視圖.
		g_currTarget  =  e.target as NodeUU;
		tipData       =  g_target2TipDataMap[g_currTarget];
		//UUFacade.getRoot(tipData.m_stageId).addNode(g_tipFusion);
		tipData.m_target.root.addNode(g_tipFusion);
		g_tipFusion.setState(tipData, touch, g_currTarget);
		
		// 加入視圖.
		
		
		// tip出現效果.
		if(tipData.m_effectStateRef != null){
			g_currEffectState = g_cachedEffectList[tipData.m_effectStateRef];
			if(!g_currEffectState){
				g_currEffectState = new (tipData.m_effectStateRef);
				g_currEffectState.m_fusion = g_tipFusion;
				g_currEffectState.addEventListener(AEvent.COMPLETE, ____onEffectComplete);
			}
			
			g_currEffectState.onEnter();
		}
	}
	
	/** @private */
	agony_internal static function ____doRemoveTip( target:NodeUU ) : void {
		
	}
	
	/** @private */
	agony_internal static function ____onTargetLeave( e:ATouchEvent ) : void {
		// 僅彈起時有效.
		if(!e.touch.isReleaseState || !g_currTarget) {
			return
		}
		____doAllExit();
	}
	
	/** @private */
	agony_internal static function ____onEffectComplete( e:AEvent ) : void {
		g_currEffectState = null;
		____doViewExit();
	}
	
	/** @private */
	agony_internal static function ____doAllExit() : void {
		// tip出現效果.
		if(g_currEffectState){
			g_currEffectState.onExit();
		}
		else if(g_currTarget){
			____doViewExit();
		}
	}
	
	/** @private */
	agony_internal static function ____doViewExit() : void {
		var tipData:TipData;
		
		g_tipFusion.reset();
		tipData = g_target2TipDataMap[g_currTarget];
		g_tipFusion.parent.removeNode(g_tipFusion);
		g_currTarget = null;
	}
	
	/** @private */
	agony_internal static function ____onTargetPress( e:ATouchEvent ) : void {
		if(g_reactionTypeForPress == TipReactionType.EXIT_NO_EFFECT){
			____doHideTip(false);
		}
		else if(g_reactionTypeForPress == TipReactionType.EXIT_WITH_EFFECT){
			____doHideTip(true);
		}
	}
	
	/** @private */
	agony_internal static function ____onTargetDispose( e:AEvent ) : void {
		var target:NodeUU;
		
		target = e.target as NodeUU;
		if (target == g_currTarget) {
			if(g_currEffectState){
				g_currEffectState.onExitInterrupted();
				g_currEffectState = null;
			}
			if(g_currTarget){
				____doViewExit();
			}
		}
		unregisterTip(target);
	}
	
	/** @private */
	agony_internal static function ____doHideTip( hasEffect:Boolean ) : void {
		// 檢測并移除上一次殘留tip退出效果.
		if(g_currEffectState){
			g_currEffectState.onExitInterrupted();
			g_currEffectState = null;
		}
		
		if(hasEffect){
			____doAllExit();
		}
		else {
			if(g_currTarget){
				____doViewExit();
			}
		}
	}
}
}