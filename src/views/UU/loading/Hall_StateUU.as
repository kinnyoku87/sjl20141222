package views.UU.loading
{
	import models.GameModel;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.project.ViewFacade;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	
	import proto.com.RoomMod;
	
	import views.Room_StateVV;
	
	public class Hall_StateUU extends StateUU
	{
		
		override public function onEnter():void {
			var btn:ButtonUU;
			var img:BitmapLoaderUU;
			var radio:RadioUU;
			var i:int;
			var l:int;
			
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;
			
			// 練習模式.
			btn = new ButtonUU;
			btn.skinName = "";
			this.fusion.addNode(btn);
			btn.x = 50;
			btn.y = 50;
			btn.userData = RoomMod.ROOM_MOD_PRACTICE;
			btn.addEventListener(ATouchEvent.CLICK, onSelectMode);
			
			// 1v1模式.
			btn = new ButtonUU;
			btn.skinName = "hall_pvp";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.y = 15;
			btn.userData = RoomMod.ROOM_MOD_1V1;
			btn.addEventListener(ATouchEvent.CLICK, onSelectMode);
			
			// 身份模式.
			btn = new ButtonUU;
			btn.skinName = "hall_identity";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingY = 15;
			btn.userData = RoomMod.ROOM_MOD_IDENTITY;
			btn.addEventListener(ATouchEvent.CLICK, onSelectMode);
			
			// 競技場模式.
			btn = new ButtonUU;
			btn.skinName = "hall_arena";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			
//			btn.locatingY = 10;
			btn.userData = RoomMod.ROOM_MOD_ARENA;
			btn.addEventListener(ATouchEvent.CLICK, onSelectMode);
			
			// 底部背景.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("hall/img/bottom_A.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F____A_F;
			
			// 底部圖標.
			l = 6;
			while(i<l){
				btn = new ButtonUU;
				btn.skinName = "hall_icon";
				this.fusion.addNode(btn);
				if(++i==1){
					btn.locatingTypeForHoriz = LocatingType.F___A___F;
					btn.locatingOffsetX = -400
				}
				else{
					btn.locatingTypeForHoriz = LocatingType.L_A____L;
					btn.locatingOffsetX = 160;
				}
				btn.locatingTypeForVerti = LocatingType.F____A_F;
				
			}
			
			// 返回.
			btn = new ButtonUU;
			btn.skinName = "hall_back";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F____A_F;
			btn.y = 30;
			btn.locatingOffsetX = -30;
			
			// 設定.
			btn = new ButtonUU;
			btn.skinName = "hall_setting";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L_A____L
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 10;
			
			// 音樂.
			btn = new ButtonUU;
			btn.skinName = "hall_music";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L_A____L;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 10;
			
			// 我的卡牌.
			btn = new ButtonUU;
			btn.skinName = "hall_mycard";
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F____A_F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetX = -20;
			btn.locatingOffsetY = -140;
		}
		
		
		private function onSelectMode(e:ATouchEvent):void{
			var mode:int;
			
			GameModel.gameMode = e.target.userData;
			
			ViewFacade.setStateView(Room_StateVV);
			
			GameModel.getLog().simplify("遊戲模式: [ {0} ].", GameModel.gameMode);
		}
	}
}