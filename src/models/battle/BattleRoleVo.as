package models.battle
{
	import com.netease.protobuf.UInt64;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	
	import models.player.RoleVo;
	
	import proto.com.BattleMemberInfo;
	import proto.com.CampBattleCard;

	public class BattleRoleVo extends Notifier
	{
		public function initialize( v:BattleMemberInfo ) : void
		{
			this.playerId = v.uid;
			this.roleVo = new RoleVo;
			this.roleVo.setValue(v.roleInfo);
			
			this.chairId = v.roomMemberInfo.chairId;
			this.campId = v.roomMemberInfo.campId;
			this.ready = v.roomMemberInfo.ready;
			
			this.campBattleCards = v.campBattleCards;
			this.cardBagIndex = v.cardBagIndex;
			this.useBagCard = v.useBagCard;
			this.isRobot = v.isRobot;
			
		}
		
		
		
		public var playerId:UInt64;
		
		public var roleVo:RoleVo;
		
		
		
		// 0 - 2
		// 1 - 8
		
		public var chairId:int;
		
		public var campId:int;
		
		public var ready:Boolean;
		
		public var campBattleCards:Array;
		
//		CAMP_ID_SHANG = 1;		// 商国
//		CAMP_ID_ZHOU = 2;		// 周国
//		CAMP_ID_YAO = 3;		// 妖
//		CAMP_ID_WU = 4;			// 巫
		public var cardBagIndex:int;
		
		public var useBagCard:Boolean;
		
		public var isRobot:Boolean;
		
		public var kingGuid:UInt64;
		
		public function get kingVo() : CharacterVo
		{
			return BattleModel.getVoByGuid(kingGuid);
		}
		
		
		public var deadList:Array = [];
		
		public var numDead:int;
		
		public var numCurrentCards:int;
		
		public var numRemainCards:int;
		
		public function updateCards() : void {
			Agony.getLog().simplify("[ Update Cards ]: {0}, {1} - {2}: [{3}]", numCurrentCards, numRemainCards, numDead, deadList)
			
			this.dispatchDirectEvent(AEvent.CHANGE);
		}
		
		public function killCard( card_guid:* ) : void {
			this.deadList[numDead++] = card_guid;
			this.updateCards();
		}
		
		public function killCard2( card_guid:* ) : void {
			this.deadList[numDead++] = card_guid;
			numCurrentCards--;
			this.updateCards();
		}
		
		public function newCard() : void {
			numCurrentCards++;
			numRemainCards--;
			this.updateCards();
		}
		
		public function playCard( isMagic:Boolean, card_guid:* = null ) : void {
			numCurrentCards--;
			if (isMagic) {
				this.deadList[numDead++] = card_guid;
			}
			this.updateCards();
		}
		
		public function useDead() : int {
			numDead--;
			return int(deadList.pop());
		}
	}
}