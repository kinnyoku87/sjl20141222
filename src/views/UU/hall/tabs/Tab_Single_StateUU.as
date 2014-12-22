package views.UU.hall.tabs 
{
	import configs.HallConfig;
	import models.GameModel;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.utils.ColorUtil;
	import proto.com.RoomMod;
	import utils.TextUtil;
	import views.Hall_StateVV;
	import views.Room_StateVV;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	
	//自由模式
	public class Tab_Single_StateUU extends StateUU
	{
		
		override public function onEnter():void 
		{
			var btn:ButtonUU;
			var img:BitmapLoaderUU;
			var radio:RadioUU;
			var i:int;
			var l:int;
			var label:LabelUU;
			var dscLabel:LabelUU;
			var scale9Img:Scale9BitmapUU;
			
			// 背景.
			scale9Img = new Scale9BitmapUU;
			scale9Img.source =  TResourceManager.getAsset("hall/img/hall_scale9.png");
			this.fusion.addNode(scale9Img);
			scale9Img.width = HallConfig.TAB_VIEW_SCALE9_WIDTH;
			scale9Img.height = HallConfig.TAB_VIEW_SCALE9_HEIGHT;
			scale9Img.x = HallConfig.TAB_VIEW_SCALE9_X;
			scale9Img.y = HallConfig.TAB_VIEW_SCALE9_Y;
			
			// 双人模式
			btn = new ButtonUU;
			btn.skinName = "hall_A";
			btn.locatingTypeForHoriz = LocatingType.L_A____L;
			btn.locatingOffsetX = 50;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetY = 40;
			this.fusion.addNode(btn);
			btn.addEventListener(ATouchEvent.CLICK, onTwoClick);
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("hall/img/two_B.png");
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			//label = TextUtil.createLabel("进入模式", 33, 0xdddd33, true, 6);
			
			btn.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			// 四人模式.
			btn = new ButtonUU;
			btn.skinName = "hall_A";
			btn.locatingTypeForHoriz = LocatingType.L___A___L;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 3;
			this.fusion.addNode(btn);
			btn.addEventListener(ATouchEvent.CLICK, onFourClick);
			
			btn.touchable = false;
			
			img = new BitmapLoaderUU;
			img.source =  btn.touchable ? TResourceManager.getAsset("hall/img/four_B.png") : TResourceManager.getAsset("hall/img/four_A.png");
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			//label = TextUtil.createLabel("进入模式", 33, 0xdddd33, true, 6);
			btn.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			
			// 五人模式.
			btn = new ButtonUU;
			btn.skinName = "hall_A";
			btn.locatingTypeForHoriz = LocatingType.L___A___L;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 3;
			this.fusion.addNode(btn);
			btn.addEventListener(ATouchEvent.CLICK, onFiveClick);
			btn.touchable = false;
			
			img = new BitmapLoaderUU;
			img.source =  btn.touchable ? TResourceManager.getAsset("hall/img/five_B.png") : TResourceManager.getAsset("hall/img/five_A.png");
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			//label = TextUtil.createLabel("进入模式", 33, 0xdddd33, true, 6);
			btn.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			
			// Role.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("hall/img/single_role.png");
			this.fusion.addNode(img);
			//img.x = 1100;
			img.locatingTypeForHoriz = LocatingType.F____A_F;
			img.locatingOffsetX = 80;
			img.y = 30;
			img.touchable = false;
			
			//模式描述
			dscLabel = TextUtil.createLabel5(HallConfig.SINGLE_DSC_TEXT, 24, ColorUtil.WHITE, false,2,3.5,22,"黑体");
			dscLabel.width = 500;
			dscLabel.height = 200;
			dscLabel.wordWrap = true;
			this.fusion.addNode(dscLabel);
			dscLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			dscLabel.locatingTypeForVerti = LocatingType.F___A___F;
			dscLabel.locatingOffsetX = 100;
			dscLabel.locatingOffsetY = 250;
			
		}
		
		private function onTwoClick(e:ATouchEvent):void {
			GameModel.gameMode = RoomMod.ROOM_MOD_FREE_1V1;
			onSelectMode(e);
		}
		private function onFourClick(e:ATouchEvent):void {
			GameModel.gameMode = RoomMod.ROOM_MOD_FREE_2V2;
			onSelectMode(e);
		}
		private function onFiveClick(e:ATouchEvent):void {
			GameModel.gameMode = RoomMod.ROOM_MOD_FREE_2V3;
			onSelectMode(e);
		}
		private function onSixClick(e:ATouchEvent):void {
			GameModel.gameMode = RoomMod.ROOM_MOD_FREE_3V3;
			onSelectMode(e);
		}
		private function onEightClick(e:ATouchEvent):void {
			GameModel.gameMode = RoomMod.ROOM_MOD_FREE_4V4;
			onSelectMode(e);
		}
		

		
		private function onSelectMode(e:ATouchEvent):void{
			
			
			ViewFacade.setStateView(Room_StateVV);
			
			GameModel.getLog().simplify("遊戲模式: [ {0} ].", GameModel.gameMode);
		}
	}

}