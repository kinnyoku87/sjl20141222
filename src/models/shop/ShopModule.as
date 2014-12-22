package models.shop 
{
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.item.ItemCfg;
	import configs.item.ItemConfiguration;
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopInfoCfg;
	import configs.shop.ShopInfoVO;
	import configs.shop.ShopConfig;
	import models.player.PlayerModel;
	import models.PromptManager;
	import models.unlock.UnlockModule;
	import org.agony2d.events.Notifier;
	import org.agony2d.flashApi.UUFacade;
	import proto.com.CardHoldUnit;
	import proto.com.MysticalBoxItem;
	import proto.cs.ConfirmBoxRes;
	import proto.cs.GetBattleParamRes;
	import proto.cs.ItemShopBuyRes;
	import proto.cs.MysticalBoxOpenRes;
	import views.UU.shop.Shop_Buy_StateUU;
	import views.UU.shop.Shop_Refine_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopModule 
	{
		private static var _notifier:Notifier = new Notifier();
		
		public static var baoheCardList:Array;   //宝盒卡牌列表
		public static var baoheResultList:Array;   //清算宝盒列表
		//private static var _storetable:Object ;
		//private static var _shopCards:Array;
		public function ShopModule() 
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
			_notifier.dispatchEvent(new ShopEvent(str, data));
		}
		
		//玄机宝盒打开了
		public static function getBoxOpenList(v:MysticalBoxOpenRes):void {
			baoheCardList = [];
			var i:int;
			for (i = 0 ; i < v.cards.length; i++ ) {
				v.cards
				baoheCardList.push(v.cards[i]);
			}
			ShopConfig.baoheStep = 2;
			dispatchEvent(ShopEvent.Update_Box_Open_Status);
		}
		
		//上线获取玄机宝盒状态
		public static function getBuyBoxState(v:GetBattleParamRes):void {
			baoheCardList = [];
			var i:int;
			var j:int;
			for (i = 0; i < v.mysticalBoxsCards.length;i++ ) {
				if (MysticalBoxItem(v.mysticalBoxsCards[i]).boxId == ShopConfiguration.getShopInfo(ShopConfig.BAOHE_SHOPID).goodId) {
					for (j = 0 ; j <  MysticalBoxItem(v.mysticalBoxsCards[i]).unit.length;j++ ) {
						baoheCardList.push(CardHoldUnit(MysticalBoxItem(v.mysticalBoxsCards[i]).unit[j]).cardId);
					}
				}
			}
			if (baoheCardList.length > 0 ) {
				ShopConfig.baoheStep = 2;
			}
		}
		
		//玄机宝盒确认
		public static function confirmBoxList(v:ConfirmBoxRes):void {
			baoheResultList = [];
			var i:int;
			for (i = 0 ; i < v.cardIds.length;i++ ) {
				baoheResultList.push(v.cardIds[i]);
			}
			ShopConfig.baoheStep = 3;
			dispatchEvent(ShopEvent.Update_Box_Open_Status);
		}
		
		//购买商品返回
		public static function shopBuyBack(v:ItemShopBuyRes):void {
			var shopId:int = v.shopId;
			var shopcfg:ShopInfoCfg = ShopConfiguration.getShopInfo(shopId);
			if (shopcfg.classStr == "卡牌") {
				UUFacade.getWindow(Shop_Refine_StateUU).activate([shopId]);
			}else if (shopcfg.classStr == "玄玉") {
				PromptManager.instanse.showPropmt("购买成功");
				UUFacade.getWindow(Shop_Buy_StateUU).close();
			}
			//TODO  更新商品数据
			//dispatchEvent(ShopEvent.Update_Box_Open_Status);
		}
		
		
		public static function getStoreTable(campId:int, search:String = ""):Array {
			var storeTable:Array = [];
			// 取得所拥有的和解锁的卡牌
            var ownCard:Array = UnlockModule.getOwnCards(campId);
			
			for each(var shop:ShopInfoCfg in ShopConfiguration.shopList) {
				var itemInfo:ItemCfg = ItemConfiguration.getItem(shop.goodId);
				var cardCfg:CardCfg = CardConfigurator.getCardById(itemInfo.value);
				var b:Boolean = false;
				if (search != "") {
					b = shop.classStr == "卡牌" && cardCfg.camp == campId && search == itemInfo.name;
				}else {
					b = shop.classStr == "卡牌" && cardCfg.camp == campId;
				}
				if (b) {
					var shopInfoVo:ShopInfoVO = new ShopInfoVO();
					shopInfoVo.shopId = shop.shopId;
					shopInfoVo.itemId = itemInfo.id;
					shopInfoVo.cardId = cardCfg.id;
					shopInfoVo.name = itemInfo.name;
					shopInfoVo.type = shop.sellType;
					shopInfoVo.price = shop.price;
					shopInfoVo.bHad = false;
					for (var i:int = 0; i < ownCard.length;i++ ) {
						if (ownCard[i] == cardCfg.id) {
							var carryMax:int = cardCfg.carryMax;
							if (UnlockModule.allUnlockCards[cardCfg.id] && UnlockModule.allUnlockCards[cardCfg.id] >= carryMax) {
								shopInfoVo.bHad = true;
								break;
							}
						}
					}
					storeTable.push(shopInfoVo);
				}
			}
			return storeTable;
		}
	}

}