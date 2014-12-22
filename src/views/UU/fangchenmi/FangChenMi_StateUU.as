package views.UU.fangchenmi 
{
	import configs.skinname.SkinNameConfig;
	import flash.text.TextFieldAutoSize;
	import net.NetManager;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.TextInputUU2;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeRole;
	import proto.cs.CmdType;
	import proto.cs.RoleVerificateReq;
	import ui.ShildStateUU;
	import utils.TextUtil;
	/**
	 * ...
	 * @author dcl
	 */
	public class FangChenMi_StateUU extends ShildStateUU
	{
		private static const DSC_TITLE:String = "亲爱的玩家 ，根据版署《网络游戏未成年防沉迷系统》的要求，为了避免未成年玩家沉迷游戏，应国家新闻出版社总署要求，所有玩家必须填写实名信息。<br>凡未通过防沉迷系统的玩家累计在线3小时后，将会被纳入防沉迷系统，收益将会减半，5小时后收益为零。<br>隐私说明：用户填写身份信息属于用户隐私，《神将录》游戏绝对尊重用户个人隐私权。";
		
		private var name_input:TextInputUU;
		private var info_input:TextInputUU;
		public function FangChenMi_StateUU() 
		{
			NAME = "提示";
			//notDefaultClose = true;
		}
		
		override public function onEnter():void {
			super.onEnter();			
			var bgImg:Scale9BitmapUU;
			var txt:LabelUU;
			var img:Scale9BitmapUU;
			var btn:ButtonUU;
			
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 800;
			bgImg.height = 400;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;
			
			this.fusion.addNode(title);
			this.fusion.addNode(closeBtn);
			
			txt = TextUtil.createLabel6("", 16, ColorUtil.WHITE, false, 0x241000, 2, TextFieldAutoSize.NONE);
			this.fusion.addNode(txt);
			txt.y = 60;
			txt.x = 50;
			txt.width = 700;
			txt.height = 300;
			txt.wordWrap = true;
			txt.multiline = true;
			txt.text = DSC_TITLE;
			//txt.htmlText = "<font size='16' color='#ffffff'>"+DSC_TITLE+"</font>";
			
			txt = TextUtil.createLabel6("请填写实名信息：", 18, ColorUtil.WHITE, false, 0x241000, 2, TextFieldAutoSize.LEFT);
			this.fusion.addNode(txt);
			txt.y = 220;
			txt.x = 50;
			
			txt = TextUtil.createLabel6("姓名：", 18, ColorUtil.WHITE, false, 0x241000, 2, TextFieldAutoSize.LEFT);
			this.fusion.addNode(txt);
			txt.y = 260;
			txt.x = 50;
			
			img = new Scale9BitmapUU
			img.source = TResourceManager.getAsset("common/img/background_scale9.png");
			this.fusion.addNode(img);
			img.width = 150;
			img.height = 40;
			img.locatingOffsetX = 5;
			img.locatingTypeForHoriz = LocatingType.L____L_A;
			img.locatingTypeForVerti = LocatingType.L___A___L;
			
			name_input = new TextInputUU(false);
			this.fusion.addNode(name_input);
			//name_input.locatingOffsetX = 40 + 6 ;
			//name_input.locatingOffsetY = -15 + 6;
			name_input.locatingTypeForHoriz = LocatingType.L_A____L;
			name_input.locatingTypeForVerti = LocatingType.L_A____L;
			name_input.locatingOffsetX = 5;
			name_input.locatingOffsetY = 4;
			name_input.width = 145;
			name_input.height = 42;
			//name_input.color = 0xFFFFFF
			name_input.size = 20
			name_input.maxChars = 22;
			name_input.font = TextUtil.FONT_A;
			name_input.text = "请输入姓名";
			name_input.color = ColorUtil.GRAY;
			name_input.addEventListener(NodeEvent.FOCUS_IN, onFocus)
			name_input.addEventListener(NodeEvent.FOCUS_OUT, onFocus)
			
			
			txt = TextUtil.createLabel6("身份信息：", 18, ColorUtil.WHITE, false, 0x241000, 1, TextFieldAutoSize.LEFT);
			this.fusion.addNode(txt);
			txt.y = 260;
			txt.x = 300;
			
			img = new Scale9BitmapUU
			img.source = TResourceManager.getAsset("common/img/background_scale9.png");
			this.fusion.addNode(img);
			img.width = 280;
			img.height = 40;
			img.locatingOffsetX = 5;
			img.locatingTypeForHoriz = LocatingType.L____L_A;
			img.locatingTypeForVerti = LocatingType.L___A___L;
			
			info_input = new TextInputUU(false);
			this.fusion.addNode(info_input);
			//name_input.locatingOffsetX = 40 + 6 ;
			//name_input.locatingOffsetY = -15 + 6;
			info_input.locatingTypeForHoriz = LocatingType.L_A____L;
			info_input.locatingTypeForVerti = LocatingType.L_A____L;
			info_input.locatingOffsetX = 5;
			info_input.locatingOffsetY = 4;
			info_input.width = 275;
			info_input.height = 42;
			//info_input.color = ColorUtil.WHITE;
			info_input.size = 20
			info_input.restrict = "0-9";
			info_input.font = TextUtil.FONT_A;
			info_input.text = "请输入身份证号码";
			info_input.color = ColorUtil.GRAY;
			info_input.addEventListener(NodeEvent.FOCUS_IN, onFocus)
			info_input.addEventListener(NodeEvent.FOCUS_OUT, onFocus)
			
			btn = new ButtonUU();
			btn.skinName = SkinNameConfig.common_E;
			TextUtil.decorateLabel6(btn.getLabel(),"确定",18,0xffb244,false,0xb50a00,1);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetX = -100;
			btn.locatingOffsetY = -30;
			btn.addEventListener(ATouchEvent.CLICK,onOkClick);
			
			
			btn = new ButtonUU();
			btn.skinName = SkinNameConfig.common_E;
			TextUtil.decorateLabel6(btn.getLabel(),"取消",18,0xffb244,false,0xb50a00,1);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetX = 100;
			btn.locatingOffsetY = -30;
			btn.addEventListener(ATouchEvent.CLICK, onCancelClick);
			addRootEvent();
			
		}
		
		public function onFocus(e:NodeEvent):void 
		{
			if (e.target == name_input) {
				if (e.type == NodeEvent.FOCUS_IN) {
					if (name_input.text == "请输入姓名") {
						name_input.text = "";
					}
					name_input.color = ColorUtil.WHITE;
				}else if(e.type == NodeEvent.FOCUS_OUT){
					if (name_input.text == "") {
						name_input.text = "请输入姓名";
						name_input.color = ColorUtil.GRAY;
					}
				}
			}else if (e.target == info_input) {
				if (e.type == NodeEvent.FOCUS_IN) {
					if (info_input.text == "请输入身份证号码") {
						info_input.text = "";
					}
					info_input.color = ColorUtil.WHITE;
				}else if(e.type == NodeEvent.FOCUS_OUT){
					if (info_input.text == "") {
						info_input.text = "请输入身份证号码";
						info_input.color = ColorUtil.GRAY;
					}
				}
			}
			
		}
		
		private function onOkClick(evt:ATouchEvent):void {
			var verificate:RoleVerificateReq = new RoleVerificateReq();
			verificate.name = name_input.text;
			verificate.identityId = info_input.text;
			NetManager.sendRequest(CmdType.CT_ROLE,CmdCodeRole.CC_ROLE_VERIFICATE_REQ,verificate);
		}
		
		private function onCancelClick(evt:ATouchEvent):void {
			closeClick(evt);
		}
		
		override protected function closeClick(evt:ATouchEvent):void {
			UUFacade.getWindow(FangChenMi_StateUU).close();
		}
	}

}