package views.UU.battle
{
	import configs.ConfigBattle;
	import models.battle.actions.SkillAction;
	import models.gameOver.GameOverModule;
	
	import models.battle.BattleModel;
	import models.battle.actions.NextRoundAction;
	import models.battle.actions.PlayCardAction;
	import models.events.ActionEvent;
	import models.player.PlayerModel;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.resources.TResourceManager;
	
	import views.UU.comps.ManaBarUU;
	
	
	
	// 最外層Ui。
	//   隨stage尺寸改變自動調整四周佈局.
	public class Battle_ui_StateUU extends StateUU
	{
		override public function onEnter():void
		{
			var btn:ButtonUU;
			
			
			// 我的頭像
			img_AA = new BitmapLoaderUU;
			img_AA.source = TResourceManager.getAsset("battle/img/profile_male.png");
			this.fusion.addNode(img_AA);
			img_AA.x = 11;
			img_AA.locatingOffsetY = -25;
			
			// 我的頭像外框.
			img_A = new BitmapLoaderUU;
			img_A.source = TResourceManager.getAsset("battle/img/myProfileFrame.png");
			this.fusion.addNode(img_A);
			img_A.touchable = false;

			// 對方頭像
			img_BB = new BitmapLoaderUU;
			img_BB.source = TResourceManager.getAsset("battle/img/profile_female.png");
			this.fusion.addNode(img_BB);
//			img_BB.locatingOffsetX = 1;
//			img_BB.y = 3;
			
			// 對方頭像外框.
			img_B = new BitmapLoaderUU;
			img_B.source = TResourceManager.getAsset("battle/img/rivalProfileFrame.png");
			this.fusion.addNode(img_B);	
			img_B.touchable = false;
			
			
			// 自己的魔法條.
			_manaBar_A = new ManaBarUU(ConfigBattle.INIT_MANA_FOR_ROUND);
			this.fusion.addNode(_manaBar_A);
			
			// 對方魔法條.
			_manaBar_R = new ManaBarUU(ConfigBattle.INIT_MANA_FOR_ROUND);
			this.fusion.addNode(_manaBar_R);
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			this.onResize(null);
			
			BattleModel.addEventListener(ActionEvent.NEXT_ACTION, onNextAction);
			
		}
		
		override public function onExit():void{
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		
		
		private var img_A:BitmapLoaderUU;
		private var img_AA:BitmapLoaderUU;
		private var img_B:BitmapLoaderUU;
		private var img_BB:BitmapLoaderUU;
		private var _manaBar_R:ManaBarUU;
		private var _manaBar_A:ManaBarUU;
		
		
		
		private function onResize(e:AEvent):void{
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;
			img_A.locatingTypeForVerti = LocatingType.F____A_F;
			img_AA.locatingTypeForVerti = LocatingType.F____A_F;
			
			img_B.locatingTypeForHoriz = LocatingType.F____A_F;
			img_BB.locatingTypeForHoriz = LocatingType.F____A_F;
			
			_manaBar_A.locatingTypeForHoriz = LocatingType.F____A_F;
			_manaBar_A.locatingTypeForVerti = LocatingType.F____A_F;
		}
		
		private function onNextAction(e:ActionEvent):void {
			var playCardAction:PlayCardAction;
			var nextRoundAction:NextRoundAction;
			var skillAction:SkillAction;
			
			// 发牌.
			if(e.action is PlayCardAction){
				playCardAction = e.action as PlayCardAction;
				
				// 法力变化.
				
				// 自己
				if(PlayerModel.isMyRole(playCardAction.roleId)){
					_manaBar_A.setValue(playCardAction.remainMp);
				}
				else {
					_manaBar_R.setValue(playCardAction.remainMp);
				}
			}
			
			else if (e.action is SkillAction) {
				skillAction = e.action as SkillAction;
				// 法力变化.
				
				// 自己
				if(PlayerModel.isMyRole(skillAction.roleId)){
					_manaBar_A.value -= skillAction.costMp;
				}
				else {
					_manaBar_R.value -= skillAction.costMp;
				}
			}
			
			// 下一回合.
			else if(e.action is NextRoundAction){
				nextRoundAction = e.action as NextRoundAction;
				
				if(PlayerModel.isMyRole(nextRoundAction.roleId)){
					_manaBar_A.setValue(ConfigBattle.INIT_MANA_FOR_ROUND);
				}
				else{
					_manaBar_R.setValue(ConfigBattle.INIT_MANA_FOR_ROUND);
				}
			}
			
			
		}
	}
}


