package models.events 
{
	import org.agony2d.events.AEvent;
	
	public class SelectedUiAoeSkillEvent extends AEvent
	{
		
		public function SelectedUiAoeSkillEvent( type:String, aoeGridIdList:Vector.<int>, aoeSkillId:int) 
		{
			super(type);
			this.aoeGridIdList = aoeGridIdList;
			this.aoeSkillId = aoeSkillId;
		}
		
		public static const AOE:String = "aoe";
		
		
		public var aoeGridIdList:Vector.<int>;
		public var aoeSkillId:int;
		
	}

}