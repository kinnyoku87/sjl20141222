package views.UU.login
{
	import configs.ConfigNet;
	
	import net.NetManager;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	
	import proto.cs.ArenaInfo;
	import proto.cs.CmdCodeLogin;
	import proto.cs.CmdType;
	import proto.cs.LoginSelectArenaReq;
	
	import utils.TextUtil;
	
	
	public class Login_Servers_StateUU extends StateUU
	{
		override public function onEnter():void
		{
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;
			
			var list:Array;
			var img:BitmapLoaderUU;
			var label:LabelUU;
			var btn:ButtonUU;
			var vo:ArenaInfo;
			var i:int;
			var l:int;
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("servers/img/server_bg.png");
			this.fusion.addNode(img);
			
			
			this.fusion.spaceWidth = img.width;
			this.fusion.spaceHeight = img.height;
			
			label = TextUtil.createLabel("最近登入服务器：", 23,  ColorUtil.GRAY);
			label.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.addNode(label);
			label.y = 88;
			
			btn = new ButtonUU;
			btn.skinName = "server_server";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 5;
			btn.touchable = false;
			
			label = TextUtil.createLabel("所有服务器：", 23,  ColorUtil.GRAY);
			label.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.addNode(label);
			label.y = 188;
			
			if(this.stateArgs[0]){
				list = this.stateArgs[0];
			}
			else{
				list = []
				while(i<3){
					vo = new ArenaInfo
	//				vo.state
					vo.arenaName = (i++).toFixed(3);
	//				vo.arenaId  
	//				vo.arenaIp 
					list.push(vo);
				}
			}
			
			// 初期化vo.
			ConfigNet.currArena = list[0];
			
			// 專區選擇按鈕光暈.
			_haloImg = new BitmapLoaderUU
			_haloImg.source = TResourceManager.getAsset("servers/img/halo.png");
			this.fusion.addNode(_haloImg);
			_haloImg.locatingTypeForHoriz = LocatingType.F___A___F;
			_haloImg.locatingTypeForVerti = LocatingType.L____L_A;
			_haloImg.locatingOffsetY = 3;
			
			
			// 專區選擇按鈕.
			i = 0;
			l = list.length
			while(i<l){
				btn = new ButtonUU;
				btn.skinName = "server_server";
				this.fusion.addNode(btn);
				if(i==0){
					btn.locatingNode = label;
				}
				
				btn.locatingTypeForHoriz = LocatingType.F___A___F;
				btn.locatingTypeForVerti = LocatingType.L____L_A;
				btn.locatingOffsetY = 5;
				TextUtil.decorateLabel(btn.getLabel(), 21, ColorUtil.ORANGE).text = list[i].arenaName;
				btn.userData = list[i];
				btn.addEventListener(ATouchEvent.CLICK, onSelectArena);
				i++;
			}
			
			// 開始遊戲.
			btn = new ButtonUU;
			btn.skinName = "login_login";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F
			btn.locatingTypeForVerti = LocatingType.F____F_A;
			btn.locatingOffsetY = 35;
			btn.addEventListener(ATouchEvent.CLICK, onStartGame);
			this.onResize(null);
			this.fusion.locatingOffsetY = -30;
			
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		}
		
		override public function onExit():void{
			this.fusion.root.stage.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		
		
		//===============================================
		
		private var _haloImg:BitmapLoaderUU;
		
		
		
		private function onSelectArena(e:ATouchEvent):void{
			var vo:ArenaInfo;
			var btn:ButtonUU;
			
			btn = e.target as ButtonUU;
			_haloImg.y = btn.y - 2;
			ConfigNet.currArena = btn.userData as ArenaInfo;
//			trace(_currVo.arenaIp);
		}
		
		private function onStartGame(e:ATouchEvent):void{
			var msg:LoginSelectArenaReq;
			
			msg = new LoginSelectArenaReq;
			msg.arenaId = ConfigNet.currArena.arenaId;
			NetManager.sendRequest(CmdType.CT_LOGIN, CmdCodeLogin.CC_LOGIN_SELECT_ARENA_REQ, msg);
			
			this.fusion.touchable = false;
		}
		
		private function onResize(e:AEvent):void{
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
	}
}