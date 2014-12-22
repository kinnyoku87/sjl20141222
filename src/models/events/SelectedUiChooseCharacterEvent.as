package models.events
{
	import org.agony2d.events.AEvent;
	
	public class SelectedUiChooseCharacterEvent extends AEvent
	{
		public function SelectedUiChooseCharacterEvent(type:String, pathGirdIdList:Vector.<int>, startGridId:int, assaultableGridIdList:Vector.<int>, isMoveDiry:Boolean)
		{
			super(type);
			
			this.pathGirdIdList = pathGirdIdList;
			this.startGridId = startGridId;
			this.assaultableGridIdList = assaultableGridIdList;
			this.isMoveDiry = isMoveDiry;
		}
		
		
		
		public static const CHOOSE_CHARACTER:String  = "chooseCharacter";
		
		
		public var pathGirdIdList:Vector.<int>; // 可移動
		
		public var assaultableGridIdList:Vector.<int>; // 可攻擊
		
		public var startGridId:int;
		
		public var isMoveDiry:Boolean;
	}
}