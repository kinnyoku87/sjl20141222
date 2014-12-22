package utils
{
	import com.greensock.TweenMax;
	import com.netease.protobuf.UInt64;
	import configs.battle.BattleConfigurator;
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.cards.EquipmentCardCfg;
	import configs.cards.MagicCardCfg;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import models.player.PlayerModel;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	import views.UU.comps.cardFustions.CharacterCard_UU;
	import views.UU.comps.cardFustions.EquipmentCard_UU;
	import views.UU.comps.cardFustions.MagicCard_UU;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;

	public class GameUtil
	{
		
		public static function isUint64Equal( A:UInt64, B:UInt64 ) : Boolean {
			return A && B && (A.low == B.low) && (A.high == B.high);
		}
		
		/**
		 * 是否为王
		 * @param	cardId
		 * @return
		 */
		public static function isKing( cardId:int ):Boolean
		{
			return (cardId == 10000 || cardId == 10026 || cardId == 10052 || cardId == 10075 || cardId == 10098);
		}
		
		
		/**
		 * 获取王的id
		 * @param	campId
		 * @return
		 */
		public static function getKing( campId:int ):int
        {
            var kingId:int = 0;
			switch(campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					kingId = 10000;
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					kingId = 10026;
					break;
				case CAMP_ID.CAMP_ID_YAO:
					kingId = 10052;
					break;
				case CAMP_ID.CAMP_ID_WU:
					kingId = 10075;
					break;
			}
            return kingId;
        }
		
			/**
		 * 人民币是否足够
		 *  
		 * @param roldId
		 * @return 
		 * 
		 */		
		public static function isEnoughRmb( rmb:int ) : Boolean {
			return PlayerModel.getInstance().myRole.rmb >= rmb;
		}
	
	
		/**
		 * 银子是否足够
		 *  
		 * @param roldId
		 * @return 
		 * 
		 */		
		public static function isEnoughMoney( money:int ) : Boolean {
			return PlayerModel.getInstance().myRole.money >= money;
		}
	
	
			/**
		 * 玄玉是否足够
		 *  
		 * @param roldId
		 * @return 
		 * 
		 */		
		public static function isEnoughXuanyu( xuanyu:int ) : Boolean {
			return PlayerModel.getInstance().myRole.xuanyu >= xuanyu;
		}
		
		/**
		 * 获取卡牌元素
		 * @param	cardId
		 * @return
		 */
		public static function getCardUU(cardId:int):FusionUU {
			var cardUU:FusionUU;
			// Role.
			
			if (cardId >= 10000 && cardId < 15000) {
				
				cardUU = new CharacterCard_UU(CardConfigurator.getCardById(cardId) as CharacterCardCfg);
			}
			// Magic
			else if (cardId >= 20000 && cardId < 25000) {
				cardUU = new MagicCard_UU(CardConfigurator.getCardById(cardId) as MagicCardCfg);
				
			}
			// Equipment.
			else if (cardId >= 30000 && cardId < 35000) {
				cardUU = new EquipmentCard_UU(CardConfigurator.getCardById(cardId) as EquipmentCardCfg);
			}
			return cardUU;
		}
		
		/**
		 * 获取卡牌小头像路径
		 * @param	cardId
		 * @return
		 */
		public static function getCardSmallHead(cardId:int):String {
			var url:String = "";
			if (cardId >= 10000 && cardId < 15000) {
				url = "assets/temp/smallHead/role/"+CardConfigurator.getCardById(cardId).imageURL+".png";
			}else if(cardId >= 2000 && cardId < 35000){
				url = "assets/temp/smallHead/magic_equip/"+CardConfigurator.getCardById(cardId).imageURL+".png";
			}
			return url;
		}
		
		
		//添加鼠标移上去
		public static function addOverState(mc:NodeUU):void
		{
			mc.addEventListener(ATouchEvent.HOVER, onMouseOver);
			mc.addEventListener(ATouchEvent.LEAVING, onMouseOut);
		}
		
		private static function onMouseOver(evt:ATouchEvent):void
		{
			TweenMax.to(evt.target,0.2, {scaleX:1.2, scaleY:1.2 } );   
		}
		
		private static function onMouseOut(evt:ATouchEvent):void 
		{
			TweenMax.to(evt.target,0.2, {scaleX:1, scaleY:1 } );   
		}
		
		//添加鼠标移上去
		public static function addOverFilter(mc:NodeUU):void
		{
			mc.addEventListener(ATouchEvent.HOVER, onMouseOverFilter);
			mc.addEventListener(ATouchEvent.LEAVING, onMouseOutFilter);
		}
		
		private static function onMouseOverFilter(evt:ATouchEvent):void
		{
			var target:NodeUU = evt.target as NodeUU;
			//target.filters = [new ColorMatrixFilter(new Array())];
		}
		
		private static function onMouseOutFilter(evt:ATouchEvent):void
		{
			var target:NodeUU = evt.target as NodeUU;
			target.filters = [];
		}
	}
}