package net.responses
{
	import models.shop.ShopModule;
	import models.unlock.UnlockModule;
	import proto.cs.CmdCodeItem;
	import proto.cs.CmdCodeLogin;
	import proto.cs.ConfirmBoxRes;
	import proto.cs.GetOtherCardNtf;
	import proto.cs.ItemBody;
	import proto.cs.ItemShopBuyRes;
	import proto.cs.LoginBody;
	import proto.cs.MysticalBoxOpenRes;

	public class ItemResponsor implements IResponsor
	{
		public function onHandle(cmd_B:int, subMsg:Object,ret:int):void
		{
			var subMsg_A:ItemBody;
			
			subMsg_A = subMsg as ItemBody;
			switch(cmd_B){
				
				// 打开玄机宝盒
				case CmdCodeItem.CC_ITEM_OPEN_MYSTICAL_BOX_RES:
					this.openBoxRes(subMsg_A.mysticalBoxOpenRes as MysticalBoxOpenRes);
					break;
				// 确认玄机宝盒
				case CmdCodeItem.CC_ITEM_CONFIRM_RESULT_RES:
					this.confirmBoxRes(subMsg_A.confirmBoxRes as ConfirmBoxRes);
					break;
				case CmdCodeItem.CC_ITEM_SHOP_BUY_RES:
					this.buyShopRes(subMsg_A.itemShopBuyRes as ItemShopBuyRes);	
					break;
				case CmdCodeItem.CC_ITEM_GET_OTHER_CARD_NTF:
					this.getOtherCardNtf(subMsg_A.getOtherCardNtf as GetOtherCardNtf);
					break;
				default:break;
			}
		}
		
		private function openBoxRes(v:MysticalBoxOpenRes):void {
			 ShopModule.getBoxOpenList(v);
		}
		
		private function confirmBoxRes(v:ConfirmBoxRes):void {
			 ShopModule.confirmBoxList(v);
		}
		
		private function buyShopRes(v:ItemShopBuyRes):void {
			ShopModule.shopBuyBack(v);
		}
		
		private function getOtherCardNtf(v:GetOtherCardNtf):void {
			UnlockModule.saveOtherCard(v);
		}
	}
}