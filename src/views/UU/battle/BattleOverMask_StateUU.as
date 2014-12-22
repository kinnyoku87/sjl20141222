package views.UU.battle 
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Cubic;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.filters.GlowFilter;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.CharacterVo;
	import models.events.GuessCardEvent;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.GuessCardNameReq;
	import proto.cs.GuessCardNameResNtf;
	import utils.TextUtil;
	import views.Battle_StateVV;
	import views.UU.battle.core.IGuessCards;
	import views.UU.comps.CardUU;
	import views.UU.comps.CharacterUU;
	
public class BattleOverMask_StateUU extends StateUU
{
	
	
	override public function onEnter() : void
	{
		
		var img_A:BitmapLoaderUU;
		var i:int;
		var l:int;
		var cardGuid:int;
		var cardBackView:BitmapLoaderUU;
		var char_A:String;
		
		
		// 背景.
		rawSprite = new RawSpriteUU;
		rawSprite.graphics.beginFill(0x0, 0.3);
		rawSprite.graphics.drawRect(0,0,2000, 1200);
		this.fusion.addNode(rawSprite);
		rawSprite.locatingTypeForHoriz = LocatingType.F___A___F;
		rawSprite.locatingTypeForVerti = LocatingType.F___A___F;
		//rawSprite.displayObject.cacheAsBitmap = true;
		
		callback_A = this.stateArgs[0];
		TweenLite.from(rawSprite, 2.2, { alpha:0.01, onComplete:____onAlpha } );
		
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		this.onResize(null);
	}
	
	override public function onExit():void {
		this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		//rawSprite.displayObject.cacheAsBitmap = false;
	}
	
	
	private var callback_A:Function;
	
	
	private function ____onAlpha():void {
		callback_A();
		
		// 胜利音效.
		if (BattleModel.isWinner) {
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/victory.mp3");
		}
		// 失败音效.
		else {
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/failure.mp3");
		}
		
		//this.fusion.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void {
			//ViewFacade.setStateView(null);
		//});
	}
	
	private function onResize(e:AEvent):void {
		this.fusion.spaceWidth = this.fusion.root.spaceWidth;
		this.fusion.spaceHeight = this.fusion.root.spaceHeight;
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
	}
	
	
	private var rawSprite:RawSpriteUU;
}
}