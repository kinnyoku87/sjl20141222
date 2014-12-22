package views.UU.room
{
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.UUFacade;
	import views.Hall_StateVV;
	import org.agony2d.project.ViewFacade;
	import views.UU.comps.CampUU;
	import views.UU.Set.Set_StateUU;
	
	import models.GameModel;
	
	import net.NetManager;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.MatchJoinReq;
	
	import utils.TextUtil;
	
	public class Room_StateUU extends StateUU
	{
		
		private var scale9Multi:Scale9MultiBitmapsUU;
		private var right_frame:BitmapLoaderUU;
		private var _rightFusion:FusionUU;
		private var _bottomFusion:FusionUU;
		
		private var _setFusion:FusionUU;
		override public function onEnter():void {
			var btn:ButtonUU;
			var btn_A:ButtonUU;
			var img:BitmapLoaderUU;
			var i:int;
			var l:int;
			
			var campView:CampUU;
			
			// 邊框(左).
			scale9Multi = new Scale9MultiBitmapsUU;
			scale9Multi.skinName = "room_scale9";
			this.fusion.addNode(scale9Multi);
			scale9Multi.touchable = false;
			
			
			// category.
			while(i<4){
				campView = new CampUU;
				campView.init(i + 1, 33);
				this.fusion.addNode(campView);
				
				if(i==0){
					//campView.x = 100;
					_currCamp = campView;
					_currCamp.setSelected(true);
				}
				//else{
					//campView.locatingTypeForHoriz = LocatingType.L____L_A;
					//campView.locatingOffsetX = 66;
				//}
				
				campView.x = 120 + 256 * i;
				
				campView.y = 45;
				campView.addEventListener(ATouchEvent.CLICK, ____onCamp);
				
				// camp
				campView.userData = ++i;
			}
			
			//i = 0;
			//while(i<4){
				//btn = this.____toCategoryView();
				//this.fusion.addNode(btn);
				//if(i++==0){
					//btn.x = 42;
					//btn.y = 260;
				//}
				//else{
					//btn.locatingTypeForHoriz = LocatingType.L____L_A;
					//btn.locatingOffsetX = 17.5;
					//btn.locatingTypeForVerti = LocatingType.L_A____L;	
				//}
			//}
			
			// 初期種族.
			//GameModel.campIndex = 1;
						
			
			

			
			// 邊框(下)
			_bottomFusion = new FusionUU;
			this.fusion.addNode(_bottomFusion);
			_bottomFusion.locatingOffsetY = 8;
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("room/img/bottom_frame.png");
			this._bottomFusion.addNode(img);
			img.x = 6;
			
			// 開始遊戲.
			btn = new ButtonUU("room_start");
			this._bottomFusion.addNode(btn);
			btn.x = 363;
			btn.y = 33
			TextUtil.decorateLabel(btn.getLabel(), 33, ColorUtil.COFFEE, true).text = "寻找对手";
			btn.addEventListener(ATouchEvent.CLICK, onStartGame);
			
			
			
			// 邊框(右).
			_rightFusion = new FusionUU;
			this.fusion.addNode(_rightFusion);
			
			right_frame = new BitmapLoaderUU;
			right_frame.source = TResourceManager.getAsset("room/img/right_frame.png");
			_rightFusion.addNode(right_frame);
			
			_rightFusion.spaceWidth = right_frame.width;
			_rightFusion.spaceHeight = right_frame.height;

			// 返回.
			btn = new ButtonUU("room_common_A");
			this._rightFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F____A_F;
			btn.locatingOffsetX = -48;
			btn.y = 22
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text = "返回";
			btn.addEventListener(ATouchEvent.CLICK, ____onBack);
			
			// 设置.
			btn = new ButtonUU("room_common_A");
			this._rightFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text =  "设置";
			//btn.addEventListener(ATouchEvent.CLICK, ___onSetClick );
			
			
			// 帮助.
			btn = new ButtonUU("room_common_A");
			this._rightFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text = "帮助";
			
			// 声音.
			btn = new ButtonUU("room_common_A");
			this._rightFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(),18, ColorUtil.ORANGE, false).text =  "声音";
			
			
			// 形象.
			btn_A = new ButtonUU("room_common_B");
			this._rightFusion.addNode(btn_A);
			btn_A.x = 19;
			btn_A.y = 142;
			TextUtil.decorateLabel(btn_A.getLabel(), 18, ColorUtil.ORANGE, false).text = "形象";
			
			// 战绩.
			btn_A = new ButtonUU("room_common_B");
			this._rightFusion.addNode(btn_A);
			btn_A.locatingTypeForHoriz = LocatingType.L_A____L;
			btn_A.locatingTypeForVerti = LocatingType.L____L_A;
			btn_A.locatingOffsetY = 2
			TextUtil.decorateLabel(btn_A.getLabel(), 18, ColorUtil.ORANGE, false).text = "战绩";

			
			// 财富.
			btn_A = new ButtonUU("room_common_B");
			this._rightFusion.addNode(btn_A);
			btn_A.locatingTypeForHoriz = LocatingType.L_A____L;
			btn_A.locatingTypeForVerti = LocatingType.L____L_A;
			btn_A.locatingOffsetY = 2
			//btn_A.y = 273;
			TextUtil.decorateLabel(btn_A.getLabel(), 18, ColorUtil.ORANGE, false).text = "财富";
						
			
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			
			
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, ____onResize);
			
			this.____onResize(null);
		}
		
		
		override public function onExit():void {
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, ____onResize);
		}
		
		
		
		private var _bg:BitmapLoaderUU;
		
		private var _currCamp:CampUU;
		
		
		
		// 開始尋找遊戲.
		private function onStartGame(e:ATouchEvent):void{
			var msg:MatchJoinReq;
			
			msg = new MatchJoinReq;
			msg.mod = GameModel.gameMode;
			msg.campId = GameModel.campBag.campId;
			msg.bagIndex = GameModel.campBag.bagIndex;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_MATCH_JOIN_REQ, msg);
			GameModel.getLog().simplify("開始匹配比賽...\n");
			this.fusion.touchable = false;
		}
		
		// 返回大廳.
		private function ____onBack(e:ATouchEvent):void{
			ViewFacade.setStateView(Hall_StateVV);
		}
		
		// 打开设置面板.
		//private function ___onSetClick(e:ATouchEvent):void{
			//UUFacade.getWindow(Set_StateUU).activate();
			//ViewFacade.addStateView(Set_StateVV);
		//}
		
		// 選擇種族.
		private function ____onCamp(e:ATouchEvent):void{
			//GameModel.campIndex = e.target.userData;
			
			this.____setCamp(e.target as CampUU);
			
			//trace("選擇種族: ", e.target.userData);
			
			
		}
		
		private function ____setCamp( campView:CampUU ) : void {
			if (_currCamp == campView) {
				return;
			}
			_currCamp.setSelected(false);
			_currCamp = campView;
			_currCamp.setSelected(true);
		}
		
		
		
		
		private function ____onResize(e:NodeEvent):void {
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;

			scale9Multi.width = this.fusion.spaceWidth - right_frame.width;
			scale9Multi.height = this.fusion.spaceHeight;
			
			
			_bottomFusion.locatingTypeForVerti = LocatingType.F____A_F;
			
			
			_rightFusion.locatingTypeForHoriz = LocatingType.F____A_F;
			
		}
	}
}