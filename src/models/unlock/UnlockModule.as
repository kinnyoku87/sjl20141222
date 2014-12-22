package models.unlock 
{
	import com.netease.protobuf.Int64;
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.unlock.UnlockConfiguration;
	import configs.unlock.UnlockInfoCfg;
	import models.GameModel;
	import models.player.PlayerModel;
	import proto.com.CAMP_ID;
	import proto.com.CardHoldUnit;
	import proto.cs.GetBattleParamRes;
	import proto.cs.GetOtherCardNtf;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class UnlockModule 
	{
		
		
		public static var allUnlockCards:Object = {};
		private static var _unlockCamp:int;
		private static var _unlockLevel:int;
		public function UnlockModule() 
		{
			
		}
		
		//获取玩家所有拥有的卡牌
		public static function saveAllCards(v:GetBattleParamRes):void {
			var i:int;
			var j:int;
			var k:int;
			for (i = 0; i < v.otherCards.length;i++ ) {
				var card:CardHoldUnit = v.otherCards[i];
				if (!allUnlockCards[card.cardId]) {
					allUnlockCards[card.cardId] = card.cardNum;
				}
			}
			for (j = 0; j < CAMP_ID.CAMP_ID_WU;j++ ) {
				for (k = 0; k < PlayerModel.getInstance().myRole.getCampLevel(j + 1);k++ ) {
					addUnlockCard(j+1,k+1);
				}
			}
		}
		
		public static function getUnlockCardNum(cardId:int):int {
			return allUnlockCards[cardId];
		}
		
		 // 获取单张的卡牌(如商店购买)
        public static function  saveOtherCard(v:GetOtherCardNtf):void
        {
			var cardId:int = v.cardId;
			addOtherCard(cardId);
        }
		
		public static function addOtherCard(cardId:int):void {
			if (!allUnlockCards[cardId]) {
				allUnlockCards[cardId] = 1;
			}	
			else {
				allUnlockCards[cardId] += 1;
			}
		}
		
		// 获取解锁的卡牌(包含购买的卡牌)
		public static function getOwnCards(campID:int):Array
		{
			var unlockList:Array = [];
			for (var key:String in allUnlockCards) {
				var card:CardCfg =	CardConfigurator.getCardById(int(key));
				if (card.camp != campID) {
					continue;
				}
				unlockList.push(int(key));
			}
			return unlockList;
		}
		
		
		public static function addUnlockCard(campId:int,campLevel:int):void {
			var unlock:UnlockInfoCfg = UnlockConfiguration.getUnlock(campId, campLevel);
			if (!unlock) return;
			var unlockMax:int = unlock.num;
			var i:int;
			for ( i = 0; i < unlockMax; i++ ) {
				var unlockId:int = unlock["unlock" + (i + 1)];
				var carryMax:int = CardConfigurator.getCardById(unlockId).carryMax;
				if (allUnlockCards[unlockId])
                {
                    if (carryMax > allUnlockCards[unlockId])
                    {
                        allUnlockCards[unlockId] += 1;
                    }
                }
                else
                {
					allUnlockCards[unlockId] = 1;
                }
			}
		}
		
		//public static function onLevelUp( campID:int, level:int, exp:int)
		//{
				//for (var i:int = PlayerModel.getInstance().myRole.getCampLevel(campID); i < level; i++)
			//{
				//addUnlockCard(campID, i + 1);
			//}
			//_unlockCamp = campID;
			//if (level > PlayerModel.getInstance().myRole.getCampLevel(campID))
				//_unlockLevel = level;
		//}
		
		//当前阵营解锁的等级
		//public static function get unLockMinLevel():int {
			//return PlayerModel.getInstance().myRole.getCampLevel(GameModel.campBag.campId);
		//}
		
		//当前阵营最大的解锁等级
		public static function get unLockMaxLevelLevel():int {
			return UnlockConfiguration.getMaxLevel(GameModel.campBag.campId);
		}
		//当前阵营解锁的等级
		public static function get campLevel():int {
			return PlayerModel.getInstance().myRole.getCampLevel(GameModel.campBag.campId);
		}
		
		//检测是否展示卡牌解锁 
		public static function checkCanUnlock():Boolean {
			// 当前阵营等级==0 或者大于解锁最大等级 或者 当前解锁信息找不到 或者 解锁卡牌列表值大于上限值
			if (campLevel <= 1 || campLevel > unLockMaxLevelLevel) {
				return false;
			}
			if ( UnlockConfiguration.getUnlock(GameModel.campBag.campId, campLevel) == null) {
				return false;
			}
			var arr:Array = getUnlockCards(GameModel.campBag.campId,campLevel);
			if ( arr == null || arr.length == 0) {
				return false;
			}
			return true;
		}
		
		//获取解锁的卡牌  
		public static function getUnlockCards(campID:int,campLevel:int):Array {
			var arr:Array = UnlockConfiguration.getUnlockCards(campID, campLevel);
			//TODO  与卡包里的卡牌做比较 删除出可展示的卡牌
			var cardInfo:CardCfg;
			var carryMax:int;
			var i:int;
			if ( arr != null && arr.length > 0) {
				for ( i = arr.length - 1 ; i >=0  ;i-- ) {
				
					cardInfo = CardConfigurator.getCardById(arr[i] as int);
					carryMax = cardInfo.carryMax;
				 
					var hasNum:int = getUnlockCardNum(arr[i] as int);
					if (hasNum >= carryMax) {
						arr.splice(i,1);
					}
				}
			}
			return arr;
		}
		
	}

}