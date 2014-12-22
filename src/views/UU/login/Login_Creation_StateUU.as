package views.UU.login
{
	import com.greensock.easing.Elastic;
	import com.greensock.TweenMax;
	import configs.ConfigNet;
	import configs.create.RoleCreateConfigurator;
	import configs.create.RoleHeadCfg;
	import configs.LoginConfig;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import models.player.PlayerModel;
	import net.NetManager;
	import net.responses.LoginResponsor;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import proto.cs.AccountLoginReq;
	import proto.cs.CmdCodeLogin;
	import proto.cs.LogoutReq;
	import views.UU.comps.RoleHeadUU;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	
	import proto.cs.CmdCodeRole;
	import proto.cs.CmdType;
	import proto.cs.CreateRoleReq;
	import proto.cs.RoleGender;
	
	import utils.TextUtil;

	public class Login_Creation_StateUU extends StateUU
	{
	
		public function Login_Creation_StateUU()
		{
		}
		
		override public function onEnter() : void {
			var btn:ButtonUU;
			var img:BitmapLoaderUU;
			var radio:RadioUU;
			var label:LabelUU;
			var i:int;
			var l:int;
			var roleHead:RoleHeadUU;
			var middleBg1:BitmapLoaderUU;
			var middleBg2:BitmapLoaderUU;
			
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;
			
			// 上部背景.
			//_bg_A = new BitmapLoaderUU;
			//_bg_A.source = TResourceManager.getAsset("creation/img/bg_up.png");
			//this.fusion.addNode(_bg_A);
			//_bg_A.height = 100;
			
			// 下部背景.
			//_bg_B = new BitmapLoaderUU;
			//_bg_B.source = TResourceManager.getAsset("creation/img/bg_down.png");
			//this.fusion.addNode(_bg_B);
			//_bg_B.height = 100;
			
			// 请选择英雄
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("creation/img/title.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingOffsetY = 100;
			
			// 專區選擇按鈕.
			i = 0;
			l = RoleCreateConfigurator._roleHeadArr.length;
			
			//分割线 上
			middleBg1 = new BitmapLoaderUU;
			middleBg1.source = TResourceManager.getAsset("creation/img/middle_line.png");
			this.fusion.addNode(middleBg1);
			middleBg1.locatingTypeForHoriz = LocatingType.F___A___F;
			middleBg1.locatingTypeForVerti = LocatingType.F___A___F;
			middleBg1.locatingOffsetY = -100;
			middleBg1.locatingOffsetX = -100;
			
			//分割线  下
			middleBg2 = new BitmapLoaderUU;
			middleBg2.source = TResourceManager.getAsset("creation/img/middle_line.png");
			this.fusion.addNode(middleBg2);
			middleBg2.locatingTypeForHoriz = LocatingType.F___A___F;
			middleBg2.locatingTypeForVerti = LocatingType.F___A___F;
			middleBg2.locatingOffsetY = 230;
			middleBg2.locatingOffsetX = 100;
			
			//设置位置分割值
			var fenge:int;
			for (i = 0; i < l ; i++ ) {
				var head:RoleHeadCfg = RoleCreateConfigurator._roleHeadArr[i];
				roleHead = new RoleHeadUU(head.sprite);
				this.fusion.addNode(roleHead);
				if (i < int(Math.round(l/2))) {
					roleHead.locatingNode = middleBg1;
					fenge = 1;
				}else {
					fenge = 4;
					roleHead.locatingNode = middleBg2;
				}
				roleHead.locatingTypeForHoriz = LocatingType.L___A___L;
				roleHead.locatingTypeForVerti = LocatingType.A_L____L;
				roleHead.locatingOffsetX = (i - fenge) * 200;
				roleHead.locatingOffsetY = 30;
				roleHead.addEventListener(ATouchEvent.CLICK, onRoleHeadSelect);
				roleArr.push(roleHead);
			}
			selectedRole = roleArr[1];
			
			// 角色男
			//radio = new RadioUU
			//radio.skinName = "creation_sex";
			//radio.group = _radioGroup;
			//this.fusion.addNode(radio);
			//radio.locatingTypeForHoriz = LocatingType.L_A____L;
			//radio.locatingOffsetX = 47
			//radio.y = 155;
			//radio.userData = RoleGender.RG_MALE;
			//
			//label = TextUtil.createLabel("男", 30,  ColorUtil.COFFEE);
			//radio.addNode(label);
			//label.locatingOffsetX = -3;
			//label.locatingOffsetY = -3;
			//label.locatingTypeForHoriz = LocatingType.F___A___F;
			//label.locatingTypeForVerti = LocatingType.F___A___F;
			
			
			// 角色女.
			//radio = new RadioUU
			//radio.skinName = "creation_sex";
			//radio.group = _radioGroup;
			//this.fusion.addNode(radio);
			//radio.locatingNode = img;
			//radio.image.scaleX = -1;
			//radio.image.x = radio.image.width;
			//radio.locatingTypeForHoriz = LocatingType.L____A_L;
			//radio.locatingOffsetX = -52;
			//radio.y = 155;
			//radio.userData = RoleGender.RG_FEMALE;
			//
			//label = TextUtil.createLabel("女", 30,  ColorUtil.COFFEE);
			//radio.addNode(label);
			//label.locatingOffsetX = 6;
			//label.locatingOffsetY = -3;
			//label.locatingTypeForHoriz = LocatingType.F___A___F;
			//label.locatingTypeForVerti = LocatingType.F___A___F;
			
			//_radioGroup.selectedIndex = 0;
			
			// 暱稱bg.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("creation/img/name_input.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F____A_F;
			img.locatingOffsetX = 30
			img.locatingOffsetY = -160;
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("creation/img/role_name.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.A_L____L
			img.locatingTypeForVerti = LocatingType.L___A___L;
			img.locatingOffsetX = -5;
			
			//输入框
			_input_B = new TextInputUU(true);
			this.fusion.addNode(_input_B);
			//_input_B.locatingNode = img;
			_input_B.locatingTypeForHoriz = LocatingType.L____L_A
			_input_B.locatingTypeForVerti = LocatingType.L___A___L;
			_input_B.locatingOffsetX = 10;
			_input_B.locatingOffsetY = 5;
			_input_B.width = 280;
			_input_B.height = 42;
			_input_B.color = 0xFFFFFF
			_input_B.size = 22
			_input_B.maxChars = 15;
			_input_B.font = "Courier New";
			_input_B.text = RoleCreateConfigurator.getRandomName();
			nameArr.push(_input_B.text);
			
			// 隨機名骰子.
			btn = new ButtonUU("creation_dice");
			this.fusion.addNode(btn);
			//btn.locatingNode = _input_B;
			btn.locatingTypeForHoriz = LocatingType.L____A_L;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = -35;
			btn.locatingOffsetY = -3;
			btn.addEventListener(ATouchEvent.CLICK,onRandom);		

			// 開始遊戲.
			btn = new ButtonUU("common_B");
			this.fusion.addNode(btn);
			btn.locatingOffsetY = -90;
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.addEventListener(ATouchEvent.CLICK, onStartGame);
			
			label = TextUtil.createLabel("开始游戏", 24,  ColorUtil.YELLOW,false);
			btn.addNode(label);
			label.locatingTypeForHoriz = LocatingType.F___A___F;
			label.locatingTypeForVerti = LocatingType.F___A___F;
			
			//返回按钮
			btn = new ButtonUU(SkinNameConfig.back_btn);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F____A_F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetX = -100;
			btn.locatingOffsetY = -100;
			btn.addEventListener(ATouchEvent.CLICK, onBack);
			
			//TweenMax.allFrom(roleArr, 1,{x:this.fusion.root.spaceWidth,ease:Elastic.easeIn},0.2 );
			this.onResize(null);
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		}
		
		override public function onExit():void{
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		private var _bg_A:BitmapLoaderUU;
		private var _bg_B:BitmapLoaderUU;
		private var _input_B:TextInputUU;
		private var nameArr:Array = [];      // 缓存已随机过的昵称
		private var roleArr:Array = [];      // 角色组
		private var _selectedRole:RoleHeadUU; //当前选中角色
		private var selectEffect:AnimatorUU;
		
		private function onResize(e:AEvent):void {
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
		}
		
		//开始游戏
		private function onStartGame(e:ATouchEvent):void{
			if(_input_B.text == ""){
				return;
			}
			var msg:CreateRoleReq;
			msg = new CreateRoleReq;
			msg.name = _input_B.text;
			msg.gender = selectedRole.roleHeadCfg.gender;
			msg.icon = selectedRole.roleHeadCfg.sprite;
			NetManager.sendRequest(CmdType.CT_ROLE, CmdCodeRole.CC_ROLE_CREATE_REQ, msg);
			this.fusion.touchable = false;
		}
		
		//返回
		private function onBack(e:ATouchEvent):void {
			closeConnect();
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
			UUFacade.getWindow(Login_Creation_StateUU).close();
			UUFacade.getWindow(Login_UserInput_StateUU).activate();
		}
		
		//随机昵称
		private function onRandom(e:ATouchEvent):void {
			var name:String = RoleCreateConfigurator.getRandomName();
			if (nameArr.indexOf(name) != -1) {
				onRandom(null);
				return;
			}
			nameArr.push(name);
			_input_B.text = name;
		}		
		
		//选中角色
		private function onRoleHeadSelect(e:ATouchEvent):void {
			if (selectedRole == e.target as RoleHeadUU) return;
			var index:int = roleArr.indexOf(e.target);
			if (index == -1) return;
			for (var i:int = 0; i < roleArr.length;i++ ) {
				roleArr[i].selected = false;
				
			}
			setStatus(false);
			selectedRole = roleArr[index];
		}
		
		//设置选中位置
		private function setStatus(status:Boolean):void {
			if (status) {
				if (!selectEffect) {
					selectEffect = new AnimatorUU();
					selectEffect.touchable = false;
					selectEffect.locatingNode = selectedRole;
					this.fusion.addNode(selectEffect);
					selectEffect.locatingTypeForHoriz = LocatingType.L_A____L;
					selectEffect.locatingTypeForVerti = LocatingType.L_A____L;
					selectEffect.locatingOffsetX = -25;
					selectEffect.locatingOffsetY = -55;
				}
				selectEffect.play("common.eight", "atlas/login/rolehead", 0);
			}else {
				if (selectEffect) {
					selectEffect.kill();
					selectEffect = null;
				}
			}
		}
		public function get selectedRole():RoleHeadUU 
		{
			return _selectedRole;
		}
		
		public function set selectedRole(value:RoleHeadUU):void 
		{
			_selectedRole = value;
			selectedRole.selected = true;
			setStatus(true);
		}
		
	}
}