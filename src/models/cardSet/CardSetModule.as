package models.cardSet 
{
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.cardset.CardSetConfig;
	import models.GameModel;
	import models.unlock.UnlockModule;
	import org.agony2d.events.Notifier;
	import org.agony2d.flashApi.UUFacade;
	import proto.com.CAMP_ID;
	import proto.com.CampBattleCard;
	import proto.com.CardHoldUnit;
	import proto.cs.GetBattleParamRes;
	import proto.cs.SetBattleParamRes;
	import views.CardSet_StateVV;
	import views.events.CardUUEvent;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSetModule 
	{
		private static var _notifier:Notifier = new Notifier();
		
		private static var cardGetList:Array;                  //整个卡包数据
		private static var _allUnlockList:Array;                //获取某个阵营所有解锁的卡牌 
		private static var _showList:Array;                    //经过删选后的展示的列表     
		public static var _bagList:Array;           //原始的卡包数据
		
		private static var cardSet:CampBattleCard;
		public function CardSetModule() 
		{
			
		}
		
		/**
		 * 偵聽事件.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function addEventListener( type:String, listener:Function ) : void {
			_notifier.addEventListener(type, listener);
		}
		
		/**
		 * 移除偵聽.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function removeEventListener( type:String, listener:Function ) : void {
			_notifier.removeEventListener(type, listener);
		}
		
		public static function dispatchEvent( str:String, data:Object = null ) : void {
			_notifier.dispatchEvent(new CardSetEvent(str, data));
		}
		
		public static function onSetCardInfo(v:SetBattleParamRes):void {
			cardSet = v.campBattleCard;
			if (v.isDelete) {
				deleteCard(cardSet);
			}else {
				setCardBag(cardSet);
			}
		}
		
		//设置新增的卡包数据
		public static function setCardBag(cardBag:CampBattleCard):void {
			for (var i:int = 0 ; i < cardGetList.length;i++ ) {
				if (cardGetList[i].bagIndex == cardBag.bagIndex) {
					cardGetList[i] = cardBag;
					return;
				}
			}
			cardGetList.push(cardBag);
			CardSetConfig.curBagIndex = cardBag.bagIndex;
			dispatchEvent(CardSetEvent.Add_Card_Bag);
		}
		
		//删除卡包
		private static function deleteCard(cardBag:CampBattleCard):void {
			for (var i:int = 0 ; i < cardGetList.length;i++ ) {
				if (cardGetList[i].bagIndex == cardBag.bagIndex) {
					cardGetList.splice(i, 1);
					dealGameDataBagIndex(cardBag.bagIndex);
				}
			}
			dispatchEvent(CardSetEvent.Remove_Card_Bag);
			
		}
		
		//删除卡包要处理当前玩家使用的卡包 删掉的是玩家使用的   则重置为第一个卡包
		private static function dealGameDataBagIndex(bagIndex:int):void {
			if (GameModel.campBag == null || bagIndex == GameModel.campBag.bagIndex) {
				var campCard:CampBattleCard = getCardBgByIndex(0);
				if (campCard) {
					GameModel.campBag = campCard;
				}
				
			}
		}
		
		
        /// 接收请求后的数据
        public static function onGetCardInfo(v:GetBattleParamRes):void
        {
            cardGetList = v.campBattleCards;
            cardSort();
			//UUFacade.getWindow(CardSet_StateVV).activate();
        }
		/// 背包创建后排序,
        private static function cardSort():void {
            var card:CampBattleCard = new CampBattleCard();
			var i:int;
			var j:int;
			
            for (i = 0; i < cardGetList.length; i++)
            {
                for (j = 0; j < cardGetList.length - 1; j++)
                {
                    if (CampBattleCard(cardGetList[j]).sortIndex > CampBattleCard(cardGetList[j + 1]).sortIndex)
                    {
                        card = cardGetList[j];
                        cardGetList[j] = cardGetList[j + 1];
                        cardGetList[j + 1] = card;
                    }
                }
				//处理没有名称的套牌
				if (CampBattleCard(cardGetList[i]).name == "") {
					CampBattleCard(cardGetList[i]).name = getBagName(CampBattleCard(cardGetList[i]).campId);
				}
				
            }
        }
		
		// 根据卡牌包索引获取卡包
		public static function getCardBag(bagIndex:int):CampBattleCard {
			var cardBag:CampBattleCard = new CampBattleCard();
			var i:int;
			for (i = 0 ; i < cardGetList.length;i++ ) {
				if (CampBattleCard(cardGetList[i]).bagIndex == bagIndex) {
					cardBag = cardGetList[i];
				}
			}
			return cardBag;
		}
		
		// 取卡包数据  （主要是用于第一次进卡包去原始数据，后面操作_bagList）
		public static function get bagList():Array {
			_bagList = getCardBag(CardSetConfig.curBagIndex).cardIds;
			return _bagList;
		}
		
		//卡包中卡牌数目
		public static function get bagListCount():int{
			if (!_bagList || _bagList.length == 0) {
				return 0;
			}
			var count:int;
			var i:int
			for (i = 0; i < _bagList.length;i++ ) {
				count += CardHoldUnit(_bagList[i]).cardNum;
			}
			return count;
		}
		
		//获取卡包中卡牌的数目
		public static function getBagCardNum(cardId:int):int {
			if (!_bagList || _bagList.length == 0) {
				return 0;
			}
			var i:int
			for (i = 0; i < _bagList.length;i++ ) {
				if (cardId == CardHoldUnit(_bagList[i]).cardId) {
					return CardHoldUnit(_bagList[i]).cardNum;
				}
			}
			return 0;
		}
		
		//添加卡牌到卡包中
		public static function addCardNumToBag(cardId:int):void {
			var i:int;
			var has:Boolean = false;
			for (i = 0; i < _bagList.length;i++ ) {
				if (cardId == CardHoldUnit(_bagList[i]).cardId) {
					has = true;
					CardHoldUnit(_bagList[i]).cardNum++;
					dispatchEvent(CardSetEvent.Change_Card_Num);
				}
			}
			if (!has) {
				var cardUnit:CardHoldUnit = new CardHoldUnit();
				cardUnit.cardId = cardId;
				cardUnit.cardNum = 1;
				_bagList.push(cardUnit);
				dispatchEvent(CardSetEvent.Add_Card_Num);
			}
		}
		
		//减掉卡包中卡牌
		public static function deleteCardNumFromBag(cardId:int):void {
			var i:int;
			for (i = _bagList.length - 1; i >=0;i-- ) {
				if (cardId == CardHoldUnit(_bagList[i]).cardId) {
					var num:int = CardHoldUnit(_bagList[i]).cardNum;
					if (num <= 1) {
						_bagList.splice(i, 1);
						dispatchEvent(CardSetEvent.Delete_Card_Num);
					}else {
						CardHoldUnit(_bagList[i]).cardNum--;
						dispatchEvent(CardSetEvent.Change_Card_Num);
					}
				}
			}
			
		}
		
		
		// 根据卡牌包阵营获取卡包
		public static function getCardBagByCamp(campId:int):CampBattleCard {
			var cardBag:CampBattleCard = new CampBattleCard();
			var i:int;
			for (i = 0 ; i < cardGetList.length;i++ ) {
				if (CampBattleCard(cardGetList[i]).campId == campId) {
					cardBag = cardGetList[i];
				}
			}
			return cardBag;
		}
		
		//获取卡包中数目
		//public static function getBagCardNum(cardId:int):int {
			//var bagList:Array = getCardBag(CardSetConfig.curBagIndex).cardIds;
			//var i:int
			//for (i = 0; i < bagList.length;i++ ) {
				//if (cardId == CardHoldUnit(bagList[i]).cardId) {
					//return CardHoldUnit(bagList[i]).cardNum;
				//}
			//}
			//return 0;
		//}
		
		
		
		//卡包数量
		public static function get cardBagNum():int {
			return cardGetList.length;
		}
		
		static public function get showList():Array 
		{
			return _showList;
		}
		
		//static public function get allUnlockList():Array 
		//{
			//return _allUnlockList;
		//}
		
		
		//索引获取卡包
		public static function getCardBgByIndex(index:int):CampBattleCard {
			return cardGetList[index] as CampBattleCard;
		}
	
		//设置当前阵营全部卡牌
		public static function dealAllUnlockList(campId:int):void {
			_allUnlockList = UnlockModule.getOwnCards(campId);
			_allUnlockList.sort(sortByMagicId);
		}
		
		//设置当前显示列表的最大页数
		public static function dealPageMaxNum(len:int):void {
			CardSetConfig.maxPage = len % CardSetConfig.Page_Num == 0 ? int(len / CardSetConfig.Page_Num) : int(len / CardSetConfig.Page_Num) + 1;
		}
		
		//根据删选内容设置当前显示数据列表
		public static function getShowList(campId:int = CAMP_ID.CAMP_ID_SHANG,page:int = 1, quality:int =0,magic:int = -1,searchName:String = "" ):Array {
			dealAllUnlockList(campId);
			var id:int;
			var card:CardCfg;
			
			var magicList:Array = [];
			var qualityList:Array = [];
			var searchList:Array = [];
			var i:int;
			if (magic == -1) {
				magicList = _allUnlockList;
			}else {
				for (i = 0; i < _allUnlockList.length;i++ ) {
					id = _allUnlockList[i];
					card = CardConfigurator.getCardById(id);
					if (card.mana == magic) {
						magicList.push(id);
					}
				}
			}
			
			if (quality == 0) {
				qualityList = magicList;
			}else {
				for (i = 0; i < magicList.length;i++ ) {
					id = magicList[i];
					card = CardConfigurator.getCardById(id);
					if (card.quality == quality) {
						qualityList.push(id);
					}
				}
			}
			if (searchName == "") {
				searchList = qualityList;
			}else {
				for (i = 0; i < qualityList.length;i++ ) {
					id = qualityList[i];
					card = CardConfigurator.getCardById(id);
					if (card.name == searchName) {
						searchList.push(qualityList[i]);
					}
				}
			}
			
			var listNum:int = searchList.length;
			dealPageMaxNum(listNum);
			
			
			var startIndex:int = (page - 1) * CardSetConfig.Page_Num;
			var endIndex:int = page * CardSetConfig.Page_Num ;
			var listMax:int;
			if (listNum <= startIndex) {
				_showList = [];
				return _showList;
			}
			_showList = [];
			listMax = Math.min(listNum, endIndex);
			for (i = startIndex; i < listMax;i++ ) {
				_showList.push(searchList[i]);
			}
			//_showList.sort(sortByMagicId);
			return _showList;
		}
		
		
		public static function getPinzhiStr(pinzhi:int):String {
			return CardSetConfig.Card_Pinzhi_Str[pinzhi];
		}
		
		public static function getPinzhiColor(pinzhi:int):uint {
			return CardSetConfig.Card_Pinzhi_Color[pinzhi];
		}
		
		public static function getBagName(campId:int):String {
			var source:String = "";
			switch(campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					source = "商国套牌";
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					source = "周国套牌";
					break;
				case CAMP_ID.CAMP_ID_YAO:
					source = "妖族套牌";
					break;
				case CAMP_ID.CAMP_ID_WU:
					source = "巫族套牌";
					break;
			}
			return source;
		}
		
		public static function getCampAnimator(campId:int):String {
			var source:String = "";
			switch(campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					source = "atlas/camps/shang";
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					source = "atlas/camps/zhou";
					break;
				case CAMP_ID.CAMP_ID_YAO:
					source = "atlas/camps/yao";
					break;
				case CAMP_ID.CAMP_ID_WU:
					source = "atlas/camps/wu";
					break;
			}
			return source;
		}
		
		public static function getCampTitle(campId:int):String {
			var source:String = "";
			switch(campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					source = "camp/img/label_shang.png";
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					source = "camp/img/label_zhou.png";
					break;
				case CAMP_ID.CAMP_ID_YAO:
					source = "camp/img/label_yao.png";
					break;
				case CAMP_ID.CAMP_ID_WU:
					source = "camp/img/label_wu.png";
					break;
			}
			return source;
		}
		
		//获取可新建的卡包索引
		public static function get newBagIndex():int {

			var indexs:Array = [0,0,0,0,0,0,0,0];
			var i:int;
			for (i = 0; i < cardGetList.length; i++)
			{
				indexs[cardGetList[i].bagIndex] = 1;
			}

			for (i = 0; i < indexs.length; i++)
			{
				if (indexs[i] == 0)
					return i;
			}
			return -1;

		}
		
		
		//按磨耗和卡牌id 排序    两字段均从小到大排
		public static function sortByMagicId(aId:int,bId:int):int {
			var aCard:CardCfg = CardConfigurator.getCardById(aId);
			var bCard:CardCfg = CardConfigurator.getCardById(bId);
			if (aCard.mana == bCard.mana) {
				if (aCard.id < bCard.id) {
					return -1;
				}else if(aCard.id == bCard.id){
					return 0;
				}else if (aCard.id > bCard.id) {
					return 1;
				}
			}else {
				if (aCard.mana < bCard.mana) {
					return -1;
				}else if (aCard.mana > bCard.mana) {
					return 1;
				}
			}
			return 0;
		}
	}

}