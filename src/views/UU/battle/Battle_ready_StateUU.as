package views.UU.battle
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.plugins.MotionBlurPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import models.GameModel;
	import models.battle.BattleModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.sounds.SfxManager;
	import utils.TextUtil;
	
	import net.NetManager;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.events.ATouchEvent;
	
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	
	import views.UU.comps.CardUU;
	import views.UU.tips.Card_TipViewStateUU;
	import views.UU.tips.Character_TipViewStateUU;

	public class Battle_ready_StateUU extends StateUU
	{
		override public function onEnter():void
		{
			var img:BitmapLoaderUU;
			
			this.fusion.spaceWidth = Agony.getAdapter().rootWidth;
			this.fusion.spaceHeight = Agony.getAdapter().rootHeight;
			
			
			_kaizhanFN = new FusionUU;
			this.fusion.addNode(_kaizhanFN);
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("battle/img/kai.png");
			_kaizhanFN.addNode(img);
			img.y = 11;
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("battle/img/zhan.png");
			_kaizhanFN.addNode(img);
			img.locatingTypeForHoriz = LocatingType.L____L_A;
			img.locatingOffsetX = 20;
			
			_kaizhanFN.locatingTypeForHoriz = LocatingType.F___A___F;
			_kaizhanFN.locatingTypeForVerti = LocatingType.F___A___F;
			_kaizhanFN.locatingOffsetY = -75;
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, ____onPreReadyToBattle);		
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			
			this.onResize(null);
		}
		
		override public function onExit():void {
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		
		// 開戰文字效果.
		private function ____onPreReadyToBattle(e:AEvent):void {
			Agony.getFrame().removeEventListener(AEvent.COMPLETE, ____onPreReadyToBattle);
			
			//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/kaizhan2.mp3", 1, 0.45);
			
			TweenLite.from(_kaizhanFN, 0.7, { x:this.fusion.root.spaceWidth + 10, 
												ease:Back.easeOut,
												onComplete:____doPostReadyToBattle } );
		}
		
		private function ____doPostReadyToBattle():void {
			TweenLite.to(_kaizhanFN, 0.5, {delay:0.5, x: -_kaizhanFN.width - 110, 
										ease:Back.easeIn,
										onComplete:____doReadyToBattle});
		}
		
		private function ____doReadyToBattle() : void {
			var initCardVoList:Array;
			var i:int;
			var l:int;
			var card:CardUU;
			
			var cardGuid:int;
			
			
			_kaizhanFN.kill();
			//return;
			
			
			_cardFN = new FusionUU;
			this.fusion.addNode(_cardFN);
			
			initCardVoList = BattleModel.initCards
			l = initCardVoList.length;
			while(i<l){
				card = new CardUU;
				cardGuid = initCardVoList[i];
				card.setCardId(cardGuid);
				_cardFN.addNode(card);
				card.x = i * 255;
//				card.y = 220;
				card.scaleX = card.scaleY = 0.88
				i++;
				
				
				
//				UUToolTip.registerTip(card, Character_TipEffectStateUU).userData = cardId;
			}
			
			
			btn = new ButtonUU("common_A");
			_cardFN.addNode(btn);
			btn.locatingOffsetY = 30
			btn.image.width = 260;
			btn.image.height = 90;
			
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____F_A;
			btn.addEventListener(ATouchEvent.CLICK, onStart);
			
			
			
			_label = TextUtil.decorateLabel3(btn.getLabel(), 24, 0xFFFFFF, 3, true);
			_label.text = "战斗开始";
			
			
			_cardFN.locatingTypeForHoriz = LocatingType.F___A___F;
			_cardFN.locatingTypeForVerti = LocatingType.F___A___F;
			//_cardFN.locatingOffsetY = -8;
			
//			this.fusion.locatingOffsetY =

		}
		
		private var _label:LabelUU;
		private var btn:ButtonUU;
		
		private var _kaizhanFN:FusionUU;
		private var _cardFN:FusionUU;
		
		
		
		private function onResize(e:AEvent):void {

			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
		
		
		
		
		
		private function onStart(e:ATouchEvent):void{
			GameModel.getLog().simplify("請求戰鬥.");
			
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_ARENA_GAME_START_REQ, null);
			
//			BattleModel.startBattle();
			
			_label.text = "等待战斗中...";
			_label.locatingTypeForHoriz = LocatingType.F___A___F;
			_label.locatingTypeForVerti = LocatingType.F___A___F;
			btn.touchable = false;
			this.fusion.touchable = false;
		}
	}
}