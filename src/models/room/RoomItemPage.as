package models.room 
{
	import proto.com.RoomBaseInfo;
	/**
	 * ...房间翻页数据
	 * @author ... dcl
	 */
	public class RoomItemPage 
	{
		public var curPage:int;
		public var totalPage:int;
		public var data:Array;
		
		public function RoomItemPage(data:Array,curPage:int,totalPage:int) 
		{
			this.data = data;
			this.curPage = curPage;
			this.totalPage = totalPage;
		}
		
	}

}