package net.responses 
{
	import models.shop.ShopModule;
	import proto.cs.CmdCodeItem;
	import proto.cs.ConfirmBoxRes;
	import proto.cs.ItemBody;
	import proto.cs.MysticalBoxOpenRes;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopResponsor extends IResponsor
	{
		
		public function ShopResponsor() 
		{
			
		}
		
		//public function onHandle(cmd_B:int, subMsg:Object):void
		//{
			//var subMsg_A:ItemBody;
			//
			//subMsg_A = subMsg as ItemBody;
			//switch(cmd_B){
				//
				// 打开玄机宝盒
				//case CmdCodeItem.CC_ITEM_OPEN_MYSTICAL_BOX_RES:
					//this.openBoxRes(subMsg_A.mysticalBoxOpenRes as MysticalBoxOpenRes);
					//break;
				//case CmdCodeItem.CC_ITEM_CONFIRM_RESULT_RES:
					//this.confirmBoxRes(subMsg_A.confirmBoxRes as ConfirmBoxRes);
				//default:
					//
					//break;
			//}
		//}
		
		//private function openBoxRes(v:MysticalBoxOpenRes):void {
			 //ShopModule.getBoxOpenList(v);
		//}
		//
		//private function confirmBoxRes(v:ConfirmBoxRes):void {
			 //ShopModule.confirmBoxList(v);
		//}
	}

}