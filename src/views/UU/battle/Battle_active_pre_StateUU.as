package views.UU.battle
{
	import configs.ConfigBattle;
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import models.events.SelectedUiAoeSkillEvent;
	import org.agony2d.Agony;
	import org.agony2d.utils.BitmapUtil;
	import proto.cs.ChessPos;
	import proto.cs.SkillUseReq;
	
	import configs.ConfigRes;
	import configs.battle.BattleConfigurator;
	import configs.battle.GridCfg;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import models.events.NullSelectedUiEvent;
	import models.events.SelectedUiHoverCardEvent;
	import models.events.SelectedUiChooseCharacterEvent;
	
	import net.NetManager;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.MoveChessReq;
	
	
	// 相當於外背景層 (地圖格子).
	public class Battle_active_pre_StateUU extends StateUU
	{	
		
		
		public static const CREATION:String   =  "creation";
		public static const MOVEMENT:String   =  "movement";
		public static const AOE:String        =  "aoe";
		public static const TARGET:String     =  "target";
		
		
		
		override public function onEnter():void {
			var img:ImageLoaderUU;
			var pos:Point;
			
			this.fusion.spaceWidth = BattleModel.gridWidth;
			this.fusion.spaceHeight = BattleModel.gridHeight;
			this.fusion.locatingOffsetY = ConfigBattle.GRID_LOCATING_OFFSET_Y;
			
			_activeLayer = new FusionUU;
			this.fusion.addNode(_activeLayer);
			
			// 天元黑洞.
			var coord:Point;
			
			//pos = BattleConfigurator.gridToPos(13);
			//img = new ImageLoaderUU;
			//img.source = TResourceManager.getAsset("battle/img/tianyuan_hole.png");
			//coord = BattleConfigurator.getCoordByPos(pos.x, pos.y);
			//img.pivotX = img.width * .5;
			//img.pivotY = img.height * .5;
			//img.x = coord.x;
			//img.y = coord.y;
			//img.touchable = false;
			//this.fusion.addNode(img);
			
			// [ 偵聽器 ] - 戰鬥選中Ui狀態變化.
			BattleModel.addEventListener(SelectedUiHoverCardEvent.HOVER_CARD, onSelectedUiHoverCard);
			BattleModel.addEventListener(SelectedUiChooseCharacterEvent.CHOOSE_CHARACTER,    onSelectedUiChooseCharacter);
			BattleModel.addEventListener(NullSelectedUiEvent.NULL_SELECTED,   onNullSelectedUi);
			BattleModel.addEventListener(SelectedUiAoeSkillEvent.AOE, ____onSelectedUiAoeSkill);
			
			// [ 偵聽器 ] - 窗口尺寸變化.
			this.fusion.root.addEventListener(NodeEvent.RESIZE, ____onResize);
			
			this.____onResize(null);
			
			// test
			//if (this.stateArgs[0]) {
				//var i:int;
				//var l:int;
				//i = 1;
				//l = 50;
				//l = 26;
				//while (i < l) {
					//____doAddGridImg(i++, "creation");
				//}
			//}
		}
		
		
		override public function onExit():void {
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, ____onResize);
		}
		
		
		
		private var _activeLayer:FusionUU;
		
		
		
		
		private function ____onResize(e:AEvent):void{
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			
		}
		
		private function onSelectedUiHoverCard(e:SelectedUiHoverCardEvent):void{
			this.____doUpdateSelectedState(e.girdIdList);
		}
		
		
		private function ____doUpdateSelectedState(  gridIdList:Array ) : void {
			var img:ImageLoaderUU;
			var i:int;
			var l:int;
			var coord:Point;
			var gridId:int;
			
			l = gridIdList.length;
			
			// No item.
			if(l == 0){
				return;
			}
			
			// Update.
			while(i<l){
				gridId = gridIdList[i++];
				
				this.____doAddGridImg(gridId, CREATION);
			}
			
		}
		
		
		private function onSelectedUiChooseCharacter(e:SelectedUiChooseCharacterEvent):void{
			var img:ImageLoaderUU;
			var i:int;
			var l:int;
			var gridId:int;
			var gridIdList:Vector.<int>;
			
			gridIdList = e.pathGirdIdList;
			l = gridIdList.length;
			
			// Movement pos.
			while(i<l){
				gridId = gridIdList[i++];
				img = this.____doAddGridImg(gridId, MOVEMENT);
				img.addEventListener(ATouchEvent.CLICK, ____onFindPath);
			}
			
		}
		
		private function onNullSelectedUi(e:NullSelectedUiEvent):void{
			// Clear.
			this._activeLayer.killNodesAt();
		}
		
		private function ____onSelectedUiAoeSkill( e:SelectedUiAoeSkillEvent ) : void {
			var img:ImageLoaderUU;
			var i:int;
			var l:int;
			var gridId:int;
			var aoeInfo:Array;
			
			_aoeGridIdList = e.aoeGridIdList;
			l = _aoeGridIdList.length;
			
			while(i<l){
				gridId = _aoeGridIdList[i++];
				img = this.____doAddGridImg(gridId, AOE);
				img.addEventListener(ATouchEvent.CLICK, ____onFireAoe);
				img.userData = gridId;
				//img.userData = e.aoeSkillId;
			}
		}
		
		private var _aoeGridIdList:Vector.<int>;
		
		private function ____onFireAoe( e:ATouchEvent ) : void {
			var aoeSkillCfg:SkillCfg;
			var pos:ChessPos;
			var gridId:int;
			
			// 清空Ui狀態.
			BattleModel.setNullSelectedUiState();
			
			aoeSkillCfg = SkillConfigurator.getSkillById(BattleModel.skillId);
			Agony.getLog().simplify("[ Aoe ]: {0}({1}) - {2}", aoeSkillCfg.name, aoeSkillCfg.id, _aoeGridIdList); 
			
			
			BattleModel.dispatchMyControlChanged(false);
			
			gridId = e.target.userData;
			pos = BattleConfigurator.gridToPos2(gridId);
			
			var msg1:SkillUseReq;
			
			msg1 = new SkillUseReq;
			msg1.fromGuid = BattleModel.skillCharacterVo.guid;
			msg1.skillId = BattleModel.skillId;
			msg1.skillSource = BattleModel.skill_source;
			msg1.endChessPos = pos;
			//msg1.endGuid = _vo.guid;
			//pos = new ChessPos;
			//pos.x = _vo.pos.x;
			//pos.y = _vo.pos.y;
			//msg1.endChessPos = pos;
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTTE_SKILL_USE_REQ, msg1);
		}
		
		/**
		 * 由格子id加入圖片.
		 * 
		 * @param gridId
		 * @param type
		 * @return 
		 * 
		 */		
		private function ____doAddGridImg( gridId:int, type:String ) : ImageLoaderUU {
			var img:ImageLoaderUU;
			var coord:Point;
			var assetId:int;
			
			img = new ImageLoaderUU;
			this._activeLayer.addNode(img);
			
			assetId =  ____toAssetFromGridId(gridId);
			//if (BattleModel.numGrids == 7) {
				img.source = TResourceManager.getAsset("battle/grid_7_7/" + type + "/" + assetId + ".png");
			//}
			//else {
				//img.source = TResourceManager.getAsset("temp/battle/grid_5_5/" + type + "/" + assetId + ".png");
			//}
			//trace("[ assetId: ]", assetId);
			img.pivotX = img.width  / 2;
			img.pivotY = img.height / 2;
			coord = BattleConfigurator.getCoordByGridId(gridId);
			img.x = coord.x;
			img.y = coord.y;
			
			// UserData - grid cfg.
			img.userData = BattleConfigurator.getCfgByGridId(gridId);
			
			//img.addEventListener(ATouchEvent.PRESS, onDrag);
			
			return img;
		}
		
		//private function onDrag(e:ATouchEvent):void {
			//var img:ImageLoaderUU;
			//
			//img = e.target as ImageLoaderUU;
			//
			//img.addEventListener(ATouchEvent.RELEASE, onRelease);
			//img.addEventListener(ATouchEvent.MOVE, onMove);
		//}
		//
		//private function onMove(e:ATouchEvent):void {
			//var img:ImageLoaderUU;
			//
			//img = e.target as ImageLoaderUU;
			//img.x += e.touch.rootX - e.touch.prevRootX
			//img.y += e.touch.rootY - e.touch.prevRootY
			//
			//trace(img.x, img.y);
		//}
		//
		//private function onRelease(e:ATouchEvent):void {
			//var img:ImageLoaderUU;
			//
			//img = e.target as ImageLoaderUU;
			//img.removeEventListener(ATouchEvent.RELEASE, onRelease);
			//img.removeEventListener(ATouchEvent.MOVE, onMove);
		//}
		
		private function ____doAddGridImgForTarget( gridId:int ) : ImageLoaderUU {
			var img:ImageLoaderUU;
			var coord:Point;
			
			img = new ImageLoaderUU;
			this._activeLayer.addNode(img);
			img.source = TResourceManager.getAsset("battle/img/select_red.png");
			img.pivotX = img.width  / 2;
			img.pivotY = img.height / 2;
			coord = BattleConfigurator.getCoordByGridId(gridId);
			img.x = coord.x;
			img.y = coord.y;
			
			// UserData - grid cfg.
			img.userData = BattleConfigurator.getCfgByGridId(gridId);
			
			return img;
		}
		
		//private function ____toAssetFromGridId( gridId:int ) : int {
			//var chairId:int;
			//var battleRole:BattleRoleVo;
			//
			//battleRole = BattleRoleModel.getMyBattleRoleVo();
			//chairId = battleRole ? battleRole.chairId : 0;
			//if (chairId == 0) {
				//return (4 - int((gridId - 1) / 5)) * 5 + (gridId - 1) % 5 + 1;
			//}
			//else if (chairId == 2) {
				//return 26 - ((4 - int((gridId - 1) / 5)) * 5 + (gridId - 1) % 5 + 1);
			//}
			//return -1;
		//}
		
		private function ____toAssetFromGridId( gridId:int ) : int {
			var chairId:int;
			var battleRole:BattleRoleVo;
			
			battleRole = BattleRoleModel.getMyBattleRoleVo();
			chairId = battleRole ? battleRole.chairId : 1;
			if (chairId == 0) {
				return (BattleModel.numGrids - 1 - int((gridId - 1) / BattleModel.numGrids)) * BattleModel.numGrids + (gridId - 1) % BattleModel.numGrids + 1;
			}
			else if (chairId == 1) {
				return BattleModel.numGrids * BattleModel.numGrids + 1 - ((BattleModel.numGrids - 1 - int((gridId - 1) / BattleModel.numGrids)) * BattleModel.numGrids + (gridId - 1) % BattleModel.numGrids + 1);
			}
			return -1;
		}
		
		private function ____onFindPath(e:ATouchEvent):void{
			var endGridId:int;
			var msg:MoveChessReq;
			var vo:CharacterVo;
			var movePath:Array;
			
			// 清空Ui狀態.
			BattleModel.setNullSelectedUiState();
			
			vo = BattleModel.getVoByGridId(MapModel.cachedStartGridId);
			
			endGridId = (e.target.userData as GridCfg).id;
			movePath = MapModel.findPath(MapModel.cachedStartGridId, endGridId, false, vo.allWalkable);
			
			
			msg = new MoveChessReq;
			msg.chessUid = vo.guid;
			msg.movePath = movePath;
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_MOVE_CHESS_REQ, msg);
			
			
			// 起始點重置.
			MapModel.cachedStartGridId = endGridId;
			
			GameModel.getLog().simplify("客戶端尋路: {0}", movePath);
			
			// 移動動作進行時，暫不可操控其他.
			BattleModel.dispatchMyControlChanged(false);
		}
		
	}
}