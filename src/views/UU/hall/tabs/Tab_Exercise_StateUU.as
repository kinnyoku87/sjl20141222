package views.UU.hall.tabs 
{
	import configs.HallConfig;
	import flash.filters.GlowFilter;
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
	
	public class Tab_Exercise_StateUU extends StateUU
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
			
			// 進入按鈕.
			btn = new ButtonUU;
			btn.skinName = "hall_A";
			btn.locatingTypeForHoriz = LocatingType.L_A____L;
			btn.locatingOffsetX = 50;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetY = 40;
			this.fusion.addNode(btn);
			btn.addEventListener(ATouchEvent.CLICK, onSelectMode);
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("hall/img/into_game.png");
			btn.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			// Role.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("hall/img/exercise_role.png");
			this.fusion.addNode(img);
			//img.x = 1100;
			img.locatingTypeForHoriz = LocatingType.F____A_F
			img.locatingOffsetX = 30;
			img.y = 30;
			img.touchable = false;
			
			//模式描述
			dscLabel = TextUtil.createLabel5(HallConfig.EXERCISE_DSC_TEXT, 24, ColorUtil.WHITE, false,2,3.5,22,"黑体");
			dscLabel.width = 500;
			dscLabel.height = 200;
			dscLabel.wordWrap = true;
			this.fusion.addNode(dscLabel);
			dscLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			dscLabel.locatingTypeForVerti = LocatingType.F___A___F;
			dscLabel.locatingOffsetX = 100;
			dscLabel.locatingOffsetY = 180;
		}
		
		
		private function onSelectMode(e:ATouchEvent):void{
			var mode:int;
			
			GameModel.gameMode = RoomMod.ROOM_MOD_PRACTICE;
			
			ViewFacade.setStateView(Room_StateVV);
			
			GameModel.getLog().simplify("遊戲模式: [ {0} ].", GameModel.gameMode);
		}
	}

}