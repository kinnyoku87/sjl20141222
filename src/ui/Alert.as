package ui 
{
	import com.greensock.TweenMax;
	import configs.skinname.SkinNameConfig;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Alert extends ShildStateUU
	{
		
		private var bg:Scale9BitmapUU;
		private var okBtn:ButtonUU;
		private var cancelBtn:ButtonUU;
		private var okCallBack:Function;
		private var cancelCallBack:Function;
		private var infoLabel:LabelUU;
		private var titleLabel:LabelUU;
		private var tween:TweenMax;
		private var info:AlertInfo;
		public function Alert() 
		{
			notDefaultClose = true;
			bgAlpha = 0.5;
		}
		
		override public function onEnter():void {
			info = this.stateArgs[0] as AlertInfo;
			if(info.type == AlertInfo.type_1) {
				isShild = false;
				bgAlpha = 0;
			}
			super.onEnter();
			

			bg = new Scale9BitmapUU;
			bg.source = TResourceManager.getAsset(skinSource);
			this.fusion.addNode(bg);
			bg.width = info.sizeWidth;
			bg.height = info.sizeHeight;
			this.fusion.spaceWidth = bg.width;
			this.fusion.spaceHeight = bg.height;
			
			okBtn = new ButtonUU;
			okBtn.skinName = buttonSkinSource;
			TextUtil.decorateLabel6(okBtn.getLabel(),"确认",20, 0xffb244, true,0xb50a00,1);
			
			this.fusion.addNode(okBtn);
			okBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			okBtn.locatingTypeForVerti = LocatingType.F____A_F;
			okBtn.locatingOffsetY = info.btnLocatingY;
			okBtn.locatingOffsetX = -70;
			okBtn.addEventListener(ATouchEvent.CLICK, okClick);
			
			cancelBtn = new ButtonUU;
			cancelBtn.skinName = buttonSkinSource
			TextUtil.decorateLabel6(cancelBtn.getLabel(),"取消",20, 0xffb244, true,0xb50a00,1);
			
			this.fusion.addNode(cancelBtn);
			cancelBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			cancelBtn.locatingTypeForVerti = LocatingType.F____A_F;
			cancelBtn.locatingOffsetY = info.btnLocatingY;
			cancelBtn.locatingOffsetX = 70;
			cancelBtn.addEventListener(ATouchEvent.CLICK, cancelClick);
			
			titleLabel = utils.TextUtil.createLabel6(info.title,25,ColorUtil.WHITE,false,ColorUtil.BLACK,2);
			this.fusion.addNode(titleLabel);
			titleLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			titleLabel.locatingTypeForVerti = LocatingType.F_A____F;
			titleLabel.locatingOffsetY = info.titleLocatingY;
			
			infoLabel = utils.TextUtil.createLabel6(info.msg,25,ColorUtil.WHITE,false,ColorUtil.BLACK,2);
			this.fusion.addNode(infoLabel);
			infoLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			infoLabel.locatingTypeForVerti = LocatingType.F___A___F;
			infoLabel.locatingOffsetY = info.msgLocatingY;
			//infoLabel.wordWrap = true;
			
			
			if (info.type == 1) {
				showMsg(info.msg);
			}else if ( info.type == 2) {
				showSelect1(info.msg,info.cancelLabel,info.cancelback );
			}else if ( info.type == 3) {
				showSelect2(info.msg,info.okCallback,info.okLabel,info.cancelLabel,info.cancelback);
			}
			
			
			addRootEvent();
			
		}
		
		private function get skinSource():String {
			if (info.skin == AlertInfo.skin_1) {
				return "common/img/tips_scale9.png";
			}else if (info.skin == AlertInfo.skin_2) {
				return "common/img/dialog_bg_B.png";
			}else if (info.skin == AlertInfo.skin_3) {
				return "common/img/dialog_bg.png";
			}else if (info.skin == AlertInfo.skin_4) {
				return "common/img/background_scale9.png";
			}
			return "common/img/tips_scale9.png";
		}
		
		private function get buttonSkinSource():String {
			//if (info.buttonSkin == 1) {
				//return "common/img/tips_scale9.png";
			//}else if (info.skin == 2) {
				//return "common/img/dialog_bg_B.png";
			//}else if (info.skin == 3) {
				//return "common/img/dialog_bg.png";
			//}else if (info.skin == 4) {
				//return "common/img/background_scale9.png";
			//}
			return SkinNameConfig["common_"+info.buttonSkin];
		}
		
		private function okClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Alert).close();
			okCallBack && okCallBack();
			
		}
		
		private function cancelClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Alert).close();
			cancelCallBack && cancelCallBack();
		
		}
		
		public function showMsg(msg:String):void {
			okBtn.visible = false;
			cancelBtn.visible = false;
			infoLabel.text = msg;
			bg.width = infoLabel.textWidth + 100 < info.sizeWidth ? info.sizeWidth : infoLabel.textWidth + 100;
			bg.height = infoLabel.textHeight + 50 < info.sizeHeight ? info.sizeHeight : infoLabel.textHeight + 50;
			this.fusion.spaceWidth = bg.width;
			this.fusion.spaceHeight = bg.height;
			infoLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			infoLabel.locatingTypeForVerti = LocatingType.F___A___F;
			infoLabel.locatingOffsetY = info.msgLocatingY;
			this.fusion.locatingOffsetY = -300;
			tween = TweenMax.to(this, 1.5, { onComplete:function():void {
				UUFacade.getWindow(Alert).close();
			}});
		}
		
		//只有一个确认按钮
		public function showSelect1(msg:String, btnLabel:String = "", _cancelCallBack:Function = null ):void
		{
			//cancelBtn.label = "取消";
			if (btnLabel != "")
			{
				cancelBtn.getLabel().text = btnLabel;
			}
			cancelCallBack = _cancelCallBack;
			okBtn.visible = false;
			cancelBtn.visible = true;
			cancelBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			cancelBtn.locatingOffsetX = 0;
			infoLabel.text = msg;
			
		}
		
		//有确认取消按钮
		public function showSelect2(msg:String, _okCallBack:Function = null, okLabel:String = "", cancelLabel:String = "", _cancelCallBack:Function = null):void
		{
			//cancelBtn.getLabel() = "取消";
			if (okLabel != "")
			{
				okBtn.getLabel().text = okLabel;
			}
			
			if (cancelLabel != "")
			{
				cancelBtn.getLabel().text = cancelLabel;
			}
			okCallBack = _okCallBack;
			cancelCallBack = _cancelCallBack;
			okBtn.visible = true;
			cancelBtn.visible = true;
			infoLabel.text = msg;
		
		}		

		
		override public function onExit():void {
			tween && tween.kill();
		}
		
	}

}