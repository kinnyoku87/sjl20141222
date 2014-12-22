package ui 
{
	import com.greensock.TweenMax;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	/**
	 * ...文本提示
	 * @author ... dcl
	 */
	public class Prompt extends StateUU
	{
		public function Prompt() 
		{
			
		}
		
		private var tween:TweenMax;
		override public function onEnter():void {
			var label:LabelUU = TextUtil.createLabel6("", 60, ColorUtil.WHITE, false, ColorUtil.BLACK, 1);
			this.fusion.addNode(label);
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			label.text = this.stateArgs[0] as String;
			this.fusion.locatingOffsetY = -350;
			this.fusion.spaceWidth = label.width;
			this.fusion.spaceHeight = label.height;
			tween = TweenMax.to(label, 2, { alpha:0, onComplete:function():void {
				UUFacade.getWindow(Prompt).close();
			}});
		}
		
		
		override public function onExit():void {
			tween.kill();
		}
		
	}

}