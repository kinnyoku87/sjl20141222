package views.UU.comps 
{
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import models.player.RoleVo;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.resources.TResourceManager;
	import utils.TextUtil;
	
	public class BattleRoleProfileUU extends FusionUU 
	{
		
		// type
		//   1: 己方
		//   2: 对方
		//   3: 
		public function BattleRoleProfileUU( type:int, name:String, chairId:int, battleRole:BattleRoleVo ) 
		{
			var txtName:LabelUU;
			var battleRoleVo:BattleRoleVo;
			var roleVo:RoleVo;
			var img:BitmapLoaderUU;
			var iconId:String;
			
			const spaceW:int = 168
			const spaceH:int = 300
			
			
			_type = type;
			_battleRole = battleRole;
			
			this.spaceWidth = spaceW;
			this.spaceHeight = spaceH;
			
			// dead
			_bgDead = new Scale9BitmapUU;
			_bgDead.source = TResourceManager.getAsset("battle/img2/card_dead.png");
			_bgDead.width = 70;
			this.addNode(_bgDead);
			
			_txtNumDead = TextUtil.createLabel(name, 19, 0xdddddd, true, 1.5, 3.5, 22);
			this.addNode(_txtNumDead);
			
			// remain
			_bgGreen = new BitmapLoaderUU;
			_bgGreen.source = TResourceManager.getAsset("battle/img2/card_remain.png");
			this.addNode(_bgGreen);
			_bgGreen.locatingOffsetY = 3;
			
			_txtNumRemain = TextUtil.createLabel(name, 19, 0xdddddd, true, 1.5, 3.5, 22);
			this.addNode(_txtNumRemain);
			
			// current
			_bgOrange = new BitmapLoaderUU;
			_bgOrange.source = TResourceManager.getAsset("battle/img2/card_current.png");
			this.addNode(_bgOrange);
			
			_txtNumCurrent = TextUtil.createLabel(name, 19, 0xdddddd, true, 1.5, 3.5, 22);
			this.addNode(_txtNumCurrent);
			
			////////////////////////////////////////////////////////////
			
			// 角色背景
			_bgProfile = new Scale9BitmapUU;
			_bgProfile.source = TResourceManager.getAsset("battle/img2/profile_bg.png");
			_bgProfile.width = spaceW;
			_bgProfile.height = spaceH;
			this.addNode(_bgProfile);
			
			// 角色名字
			_bgName = new Scale9BitmapUU;
			_bgName.source = TResourceManager.getAsset("battle/img2/name_bg.png");
			_bgName.width = spaceW - 16;
			_bgName.height = 33;
			_bgName.x = 7;
			_bgName.y = 5;
			this.addNode(_bgName);
			
			txtName = TextUtil.createLabelBlur(name, 20, 0xdddddd, true, 1.5, 0.5, 3);
			this.addNode(txtName);
			
			// 角色图片
			battleRoleVo = BattleRoleModel.getBattleRoleVoByChairId(chairId);
			roleVo = battleRoleVo ? battleRoleVo.roleVo : null;
			img = new BitmapLoaderUU;
			if (!roleVo) {
				iconId = "1003";
			}
			else {
				if (battleRoleVo.isRobot) {
					iconId = "10086"
				}
				else if (roleVo.icon == "" || roleVo.icon == null) {
					iconId = "1003";
				}
				else {
					iconId = roleVo.icon;
				}
			}
			img.source = "assets/temp/head/" + (int(iconId) < 1000 ? 1003 : iconId) + ".png";
			img.x = 5.5;
			img.y = 38;
			this.addNode(img);
			
			
			// 出牌顺序
			_bgOrder = new BitmapLoaderUU;
			_bgOrder.source = TResourceManager.getAsset("battle/img2/order_bg.png");
			this.addNode(_bgOrder);
			
			_imgOrder = new BitmapLoaderUU;
			_imgOrder.source = TResourceManager.getAsset("battle/img2/" + (chairId + 1) + ".png");
			this.addNode(_imgOrder);
			
			if (type == 1) {
				_bgOrder.locatingTypeForVerti = LocatingType.F____A_F;
				
				_bgDead.locatingTypeForHoriz = LocatingType.F____F_A;
				_bgDead.locatingOffsetX = -13;
				//_bgDead.y = -1;
				
				_bgOrange.locatingNode = _bgDead;
				_bgOrange.locatingTypeForHoriz = LocatingType.F____F_A;
				_bgOrange.locatingTypeForVerti = LocatingType.L____L_A;
				_bgOrange.locatingOffsetX = -1.5;
				_bgOrange.locatingOffsetY = -3.5;
				
				_bgGreen.locatingNode = _bgOrange;
				_bgGreen.locatingTypeForHoriz = LocatingType.F____F_A;
				_bgGreen.locatingTypeForVerti = LocatingType.L____L_A;
				_bgGreen.locatingOffsetX = -1.5;
				_bgGreen.locatingOffsetY = -3;
				
			}
			else if (type == 2) {
				_bgOrder.locatingTypeForHoriz = LocatingType.F____A_F;
				_bgOrder.locatingTypeForVerti = LocatingType.F____A_F;
				
				_bgDead.locatingTypeForHoriz = LocatingType.A_F____F;
				_bgDead.locatingTypeForVerti = LocatingType.F____A_F;
				_bgDead.locatingOffsetX = 13;
				//_bgDead.locatingOffsetY = 2;
				
				_bgOrange.locatingNode = _bgDead;
				_bgOrange.locatingTypeForHoriz = LocatingType.A_F____F;
				_bgOrange.locatingTypeForVerti = LocatingType.A_L____L;
				_bgOrange.locatingOffsetX = 1;
				_bgOrange.locatingOffsetY = 5;
				
				_bgGreen.locatingNode = _bgOrange;
				_bgGreen.locatingTypeForHoriz = LocatingType.A_F____F;
				_bgGreen.locatingTypeForVerti = LocatingType.A_L____L;
				_bgGreen.locatingOffsetX = 1;
				_bgGreen.locatingOffsetY = 2;
				
				//_bgDead.locatingNode = _bgOrange;
				//_bgDead.locatingTypeForHoriz = LocatingType.A_F____F;
				//_bgDead.locatingTypeForVerti = LocatingType.L____L_A;
				//_bgDead.locatingOffsetX = 5;
				//_bgDead.locatingOffsetY = -5;
			}
			
			
			txtName.locatingTypeForHoriz = LocatingType.L___A___L;
			txtName.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			_imgOrder.locatingTypeForHoriz = LocatingType.L___A___L;
			_imgOrder.locatingTypeForVerti = LocatingType.L___A___L;
			_imgOrder.locatingOffsetX = -3;
			
			_txtNumDead.locatingTypeForHoriz = LocatingType.L___A___L;
			_txtNumDead.locatingTypeForVerti = LocatingType.L___A___L;
			
			_txtNumCurrent.locatingTypeForHoriz = LocatingType.L___A___L;
			_txtNumCurrent.locatingTypeForVerti = LocatingType.L___A___L;
			
			_txtNumRemain.locatingTypeForHoriz = LocatingType.L___A___L;
			_txtNumRemain.locatingTypeForVerti = LocatingType.L___A___L;
			
			if (_battleRole) {
				_battleRole.addEventListener(AEvent.CHANGE, onCardChanged);
			}
			
			this.addEventListener(NodeEvent.DISPOSE, onDisposed);
		}
		
		private function onCardChanged(e:AEvent):void {
			if (_txtNumDead.text != String(_battleRole.numDead)) {
				_txtNumDead.text = String(_battleRole.numDead);
				_txtNumDead.locatingTypeForHoriz = LocatingType.L___A___L;
			}
			if (_txtNumCurrent.text != String(_battleRole.numCurrentCards)) {
				_txtNumCurrent.text = String(_battleRole.numCurrentCards);
				_txtNumCurrent.locatingTypeForHoriz = LocatingType.L___A___L;
			}
			if (_txtNumRemain.text != String(_battleRole.numRemainCards)) {
				_txtNumRemain.text = String(_battleRole.numRemainCards);
				_txtNumRemain.locatingTypeForHoriz = LocatingType.L___A___L;
			}
		}
		
		private function onDisposed(e:NodeEvent):void {
			_battleRole.removeEventListener(AEvent.CHANGE, onCardChanged);
		}
		
		//public function get numDead() : int {
			//return _numDead;
		//}
		//
		//public function set numDead( v:int ) : void {
			//_numDead = v;
			//_txtNumDead.text = String(v);
		//}
		//
		//public function get numRemain() : int {
			//return _numRemain;
		//}
		//
		//public function set numRemain( v:int ) : void {
			//_numRemain = v;
			//_txtNumRemain.text = String(v);
		//}
		//
		//public function get numCurrent() : int {
			//return _numCurrent;
		//}
		//
		//public function set numCurrent( v:int ) : void {
			//_numCurrent = v;
			//_txtNumCurrent.text = String(v);
		//}
		
		
		
		private var _type:int;
		private var _bgProfile:Scale9BitmapUU;
		private var _bgName:Scale9BitmapUU;
		private var _bgOrder:BitmapLoaderUU;
		private var _imgOrder:BitmapLoaderUU;
		private var _bgGreen:BitmapLoaderUU;
		private var _bgOrange:BitmapLoaderUU;
		private var _bgDead:Scale9BitmapUU;
		//private var _numDead:int;
		//private var _numRemain:int;
		//private var _numCurrent:int;
		private var _txtNumDead:LabelUU;
		private var _txtNumRemain:LabelUU;
		private var _txtNumCurrent:LabelUU;
		
		private var _battleRole:BattleRoleVo;
		
	}

}