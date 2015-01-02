package org.agony2d.flashApi {
	import flash.events.Event;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.layouts.ILayout;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	
	use namespace agony_internal;
	use namespace event_internal;
	
	/** 渲染內容變化時觸發. */
	[Event( name = "change", type = "org.agony2d.events.AEvent" )]
	
	/**
	 * 列表的特性 :
	 * 		1. 單向滑動
	 * 		2. 不可縮放
	 * 		3. 項目渲染器尺寸具規律性，具"首尾"，數據僅可統一刷新.
	 */
public class ListUU extends FusionUU {
	
    public function ListUU( viewportWidth:Number = int.MAX_VALUE, viewportHeight:Number = int.MAX_VALUE ) {
		m_viewportWidth   =  viewportWidth;
		m_viewportHeight  =  viewportHeight;
	}
	
	/**
	 * 全部項目數目.
	 */
	public function get numItems() : int {
		return m_numItems;
	}
	
	/**
	 * 正在被顯示的項目渲染器.
	 */
//	public function get renderers() : Vector.<ItemRendererUU> {
		//return m_currRenderers;
//	}
	
	/**
	 * 是否可多重選取.
	 */
	public function get allowMultipleSelection() : Boolean {
		return m_allowMultipleSelection;
	}
	
	public function set allowMultipleSelection( b:Boolean ) : void {
		if (m_allowMultipleSelection != b) {
			m_allowMultipleSelection = b;
		}
	}
	
	/**
	 * 列表項目佈局.
	 */
	public function get layout() : ILayout {
		return m_layout;
	}
	
	public function set layout( v:ILayout ) : void {
		if (m_layout != v) {
			m_layout = v;
		}
	}
	
	/**
	 * 是否強制選取.
	 */
	public function get requireSelection() : Boolean {
		return m_requireSelection;
	}
	
	public function set requireSelection( b:Boolean ) : void {
		if (m_requireSelection != b) {
			m_requireSelection = b;
		}
	}
	
	/**
	 * 滾動位置.
	 */
	public function get scrollPosition() : Number {
		return m_scrollPosition;
	}
	
	public function set scrollPosition( v:Number ) : void {
		if (m_scrollPosition != v) {
			m_scrollPosition = v;
		}
	}
	
	/**
	 * 被選取的項目索引數組.
	 */
	public function get selectedIndices() : Vector.<int> {
		return m_selectedIndices;
	}
	
	public function set selectedIndices( v:Vector.<int> ) : void {
		m_selectedIndices = v;
	}
	
	/**
	 * 排序方法.
	 */
	public function get sortFunction() : Function {
		return m_sortFunction;
	}
	
	public function set sortFunction( v:Function ) : void {
		m_sortFunction = v
	}
	
	/**
	 * 加入項目數據.
	 * 
	 * @param	v
	 */
	public function addItems( v:Array ) : void {
		//m_dataProvider.concat(Vector.<Object>(v))
		m_dataDirty = true;
	}
	
	/**
	 * 由索引削除項目.
	 * 
	 * @param	startIndex
	 * @param	length
	 */ 
	public function killItemsAt( startIndex:int = 0, length:int = -1 ) : void {
//		m_dataProvider.splice(beginIndex, length < 0 ? m_numItems : length);
	}
	
	/**
	 * 滑至索引項目.
	 */
	public function scrollToIndex() : void {
		
	}
	
	/**
	 * 強制排序.
	 */
	public function forceSort() : void {
		this.____doCheckSort();
	}
	
	
	
	agony_internal var m_dataDirty:Boolean;
	agony_internal var m_sortDirty:Boolean;
	
	agony_internal var m_sortFunction:Function;
	agony_internal var m_scrollPosition:Number;
	agony_internal var m_prevScrollPosition:Number;
	agony_internal var m_scrollPositionDirty:Boolean;
	
	agony_internal var m_allowMultipleSelection:Boolean;
	agony_internal var m_requireSelection:Boolean;
	agony_internal var m_selectedIndices:Vector.<int>;
	agony_internal var m_dataProvider:Vector.<Object>;
	agony_internal var m_numItems:int;
	//agony_internal var m_currRenderers:Vector.<NodeUU>;
	agony_internal var m_cachedRenderers:Vector.<NodeUU>;
	//agony_internal var m_numCachedRenderers:int;
	agony_internal var m_viewportWidth:Number;
	agony_internal var m_viewportHeight:Number;
	agony_internal var m_layout:ILayout;
	
	
	
	
	override agony_internal function doDispose() : void {
		super.doDispose();
	}
	
	/**
	 * 每次刷新列表時，默認以上一次的scrollPosition為參照，
	 * 也可手動設置刷新后的位置.
	 */
	agony_internal function ____doUpdateList() : void {
		// 排序.
		this.____doCheckSort();
		
		this.dispatchDirectEvent(AEvent.CHANGE);
		
		//this.____doSeekPosition();
		this.____doRenderItems();
	}
	
	agony_internal function ____doCheckSort() : void {
		if (m_sortDirty && m_sortFunction != null) {
			m_dataProvider.sort(m_sortFunction);
		}
	}
	
	agony_internal function ____doSeekPosition( index:int ) : void {
		
	}
	
	agony_internal function ____doRenderItems() : void {
		var R_A:ListItemUU;
		var delList:Vector.<NodeUU>;
		
		// data / sort dirty，renderer全部重置.
		if (m_dataDirty || m_sortDirty) {
			// 全部削除.
			m_cachedRenderers.concat(this.removeNodesAt());
			// 加入新的.
			this.____doAddRenderers();
			
			m_dataDirty = m_sortDirty = false;
		}
		
		// 否則，僅渲染出新的項目
		else {
			
		}
		
		
	}
	
	agony_internal function ____doAddRenderers() : void {
		
	}
}
}