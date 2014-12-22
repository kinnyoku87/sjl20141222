package ui 
{
	import models.GameModel;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.inputs.events.ATouchEvent;
	/**
	 * ... 列表（可用于翻页） 
	 * @author ... dcl
	 */
	public class ListUU2 extends FusionUU
	{
		private var _dataProvide:Array;
		private var ItemClass:Class;
		private var _totalPages:int; //总页数
		private var _currentPageIndex:int = 1; //当前页数
		private var _selectedItem:ItemView; //当前选中的item
		private var _selectedItemData:Object; //当前选中的item的数据
		
		public var rowCount:int = 10; //一次可见的Item的最大数量
		public var itemArr:Array = [];
		public var paddingLeft:Number = 0; //Item 距离左边的距离
		public var paddingTop:Number = 0; //Item 距离顶部的距离
		public var itemGap:Number = 0; //Item 的间距
		private var _initSelectedItemIndex:int = 0;
		private var _selectedItemIndex:int = _initSelectedItemIndex;
		
		public var canUpPage:Boolean = false;
		public var canDownPage:Boolean = false;
		public var canHeadPage:Boolean = false;
		public var canEndPage:Boolean = false;
		
		
		private static const H:String = "H";
		private static const L:String = "L";
		private var direction:String = "L";
		
		public function ListUU2(itemClass:Class,_direction:String="L") 
		{
			ItemClass = itemClass;
			direction = _direction;
		}
		
		public function get dataProvide():Array 
		{
			return _dataProvide;
		}
		
		public function set dataProvide(value:Array):void 
		{
			_dataProvide = value;
			if (dataProvide.length <= rowCount)
			{
				_totalPages = 1;
			}
			else
			{
				_totalPages = dataProvide.length / rowCount;
				if (dataProvide.length % rowCount != 0)
				{
					_totalPages += 1;
				}
			}
			
			if (_dataProvide.length <= 0)
			{
				_selectedItem = null;
				_selectedItemData = null;
			}
			currentPageIndex = _currentPageIndex;
			updateView();
		}
		
		private var dataArr:Array;
		public function updateView():void
		{
			var i:int = 0;		
			for (i = this.numNodes - 1 ; i >= 0;i-- ) {
				this.removeNode(itemArr[i]);
			}
			itemArr = [];
			dataArr = getItemData();
			for (i = 0; i < dataArr.length; i++)
			{
				//var item:ItemView = itemArr[i];
				//if (item == null)
				//{
					var item:ItemView = new ItemClass() as ItemView;	
					
					itemArr.push(item);
					item.x = paddingLeft;
					item.y = i * (item.height + itemGap) + paddingTop;
					if (direction==H) 
					{
						item.x = i * (item.width + itemGap) + paddingLeft;
						item.y = paddingTop;
					}
				//}		
				//GameModel.getLog().simplify("ItemView===[0]",item.m_flashView);
				this.addNode(item);
				item.row = i;
				item.data = dataArr[i];
				item.selected = false;				
				if (i == selectedItemIndex)
				{
					item.selected = true;					
					_selectedItem = item;
					_selectedItemData = item.data;
					dispatchChangeEvent();
				}
				item.addEventListener(ATouchEvent.CLICK, onItemClick);
			}
		}
		
		private function onItemClick(evt:ATouchEvent):void
		{
			var itemIndex:int = itemArr.indexOf(evt.target);
			//if (itemArr[itemIndex].cannotClick) return;
			if (itemIndex != selectedItemIndex)
			{
				selectedItemIndex = itemIndex;
				//updateView();
			}
			//dispatchEvent(new Event(EventItemClick));
		}
		
		private function dispatchChangeEvent():void
		{
			this.dispatchEvent(new AEvent(AEvent.CHANGE) );
		}
		
		private function getItemData():Array
		{
			var head:int, end:int;			
			head = (currentPageIndex - 1) * rowCount;
			if (currentPageIndex < totalPages)
			{				
				end = currentPageIndex * rowCount - 1;
			}
			else
			{
				end = dataProvide.length - 1;
			}
			var tmpData:Array = [];
			for (var i:int = head; i <= end; i++)
			{
				tmpData.push(dataProvide[i]);
			}
			return tmpData;
		}
		
		public function get totalPages():int 
		{
			return _totalPages;
		}
		
		public function set initSelectedItemIndex(value:int):void 
		{
			_initSelectedItemIndex = value;
		}
		
		public function get currentPageIndex():int 
		{
			return _currentPageIndex;
		}
		
		public function set currentPageIndex(value:int):void 
		{
			if (value < 1) value = 1;
			_currentPageIndex = value;
			canUpPage = true;
			canDownPage = true;
			canHeadPage = true;
			canEndPage = true;
			if (totalPages <= 1)
			{
				canUpPage = canDownPage = canHeadPage = canEndPage = false;
			}
			else
			{
				if (_currentPageIndex == 1)
				{
					canUpPage = canHeadPage = false;
				}
				else if (_currentPageIndex == totalPages)
				{
					canDownPage = canEndPage = false;
				}
			}
		}
		
		public function get selectedItem():ItemView 
		{
			return _selectedItem;
		}
		
		public function get selectedItemData():Object 
		{
			return _selectedItemData;
		}		
		
		public function get selectedItemIndex():int 
		{
			return _selectedItemIndex;
		}
		
		public function set selectedItemIndex(value:int):void 
		{
			_selectedItemIndex = value;
			updateView();
		}
		
		public function pageFirst():void
		{
			currentPageIndex = 1;
			selectedItemIndex = 0;
			updateView();
		}
		
		public function pageEnd():void
		{
			currentPageIndex = totalPages;
			selectedItemIndex = 0;
			updateView();
		}
		
		public function pageUp():void
		{
			if (currentPageIndex != 1)
			{
				currentPageIndex -= 1;
				selectedItemIndex = 0;
				updateView();
			}
		}
		
		public function pageDown():void
		{
			if (currentPageIndex < totalPages)
			{
				currentPageIndex += 1;
				selectedItemIndex = 0;
				updateView();
			}
		}
		//override public function doDispose():void {
			//
		//}
		
	}
}