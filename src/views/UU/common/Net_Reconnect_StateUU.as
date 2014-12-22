package views.UU.common 
{
	import configs.ConfigNet;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import net.NetManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import ui.ShildStateUU;
	import utils.TextUtil;
	import views.UU.login.Login_Bg_StateUU;
	import views.UU.login.Login_UserInput_StateUU;
	/**
	 * ...
	 * @author ...
	 */
	public class Net_Reconnect_StateUU extends ShildStateUU
	{
		private var okCallBack:Function;
		public function Net_Reconnect_StateUU() 
		{
			NAME = "提示";
			notDefaultClose = true;
		}
		override public function onEnter():void {
			super.onEnter();
			
			var content:String = this.stateArgs[0] as String;
			okCallBack = this.stateArgs[1] as Function;
			var bgImg:Scale9BitmapUU;
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 600;
			bgImg.height = 400;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;

			this.fusion.addNode(title);
			
			//醉了  设置对齐格式就不能换行
			var msgLabel:LabelUU = TextUtil.createLabel6("", 25, ColorUtil.WHITE, false, ColorUtil.rgb(36, 16, 0), 1,"none");
			this.fusion.addNode(msgLabel);
			msgLabel.wordWrap = true;
			msgLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			msgLabel.locatingTypeForVerti = LocatingType.F___A___F;
			msgLabel.locatingOffsetY = -40;
			msgLabel.width = 500;
			msgLabel.height = 100;
			msgLabel.text = content;
			
			var btn:ButtonUU = new ButtonUU;
			btn.skinName = SkinNameConfig.common_A;
			TextUtil.decorateLabel6(btn.getLabel(),"确定",25,ColorUtil.rgb(231,196,134),true,ColorUtil.BLACK,1);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetY = -70;
			btn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			this.fusion.addNode(btn);
			addRootEvent();
		}
		
		private function onBtnClick(et:ATouchEvent):void {
			if(okCallBack != null) {
				okCallBack();
			}else {
				
				closeConnect();
			}
			
		}
		
		//断开连接
		private function closeConnect():void {
				//NetManager.connect("192.168.4.195", 8843);
				//NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected1);
				// 網路管.
			NetManager.connect(ConfigNet.ip, ConfigNet.port);
				// (連接完畢) -> 偵聽器...
			NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected2);
		}
			
		/**
		 * 登陸遊戲.
		 */
		public static function ____onNetConnected2(e:AEvent):void{
			NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected2);
			GameModel.getLog().simplify("客戶端再次登陸.");
			UUFacade.getWindow(Net_Reconnect_StateUU).close();
			UUFacade.closeAllWindows();
			UUFacade.getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Login_UserInput_StateUU).activate();
		}
	
		
	}

}