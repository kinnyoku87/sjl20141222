package org.agony2d.flashApi {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.core.AbstractUU;
	import org.agony2d.flashApi.inside.ViewFusionUU;
	
	use namespace agony_internal;
	
	/** UU視圖. */
public class ViewUU {
	
	public function ViewUU( winName:String, stageId:String ) {
		m_winName = winName;
		m_stateRef = getDefinitionByName(winName) as Class;
		m_stageId = stageId;
	}
	
	public function get state() : StateUU {
		return m_stateFusion.state;
	}
	
	public function get fusion() : PivotFusionUU {
		return m_stateFusion;
	}
	
	/** 
	 * 激活視窗.
	 * 
	 * @param	stateArgs
	 * @param	index
	 * @param	globalX
	 * @param	globalY
	 */
	public function activate( stateArgs:Array = null, index:int = -1, globalX:Number = NaN, globalY:Number = NaN ) : void {
		if (m_stateFusion) {
			this.doClose();
		}
 		m_stateFusion            =  new ViewFusionUU;
		m_stateFusion.addEventListener(NodeEvent.DISPOSE, onViewDispose);
		m_stateFusion.m_winName  =  m_winName;
		
		m_root = AbstractUU.getRoot(m_stageId);
		m_root.addNodeAt(m_stateFusion, index);
		//trace("\n");
		LogMachine.g_instance.message(this, "[ {0} ]，Init...stateArgs: [ {1} ].", m_winName, stateArgs);
		m_stateFusion.setState(m_stateRef, stateArgs);
		if (!isNaN(globalX)) {
			m_stateFusion.x = globalX;
		}
		if (!isNaN(globalY)) {
			m_stateFusion.y = globalY;
		}
		
	}
	
	/** 
	 * 關閉視窗.
	 */
	public function close() : void {
		if (m_stateFusion) {
			LogMachine.g_instance.message(this, "[ {0} ]，Close.", m_winName);
			this.doClose();
		}
	}
	
	
	
	/** @private */
	agony_internal var m_stateRef:Class;
	/** @private */
	agony_internal var m_stateFusion:ViewFusionUU;
	/** @private */
	agony_internal var m_winName:String;
	/** @private */
	agony_internal var m_root:RootUU;
	/** @private */
	agony_internal var m_winList:Object;
	/** @private */
	agony_internal var m_stageId:String;
	
	
	
	
	/** @private */
	final agony_internal function doClose() : void {
		m_root.removeFromList(m_stateFusion);
		m_stateFusion.doDispose();
		m_stateFusion = null;
	}
	
	final agony_internal function onViewDispose( e:NodeEvent ) : void {
		LogMachine.g_instance.message(this, "[ {0} ]，Close.", m_winName);
		m_stateFusion = null;
	}
}
}