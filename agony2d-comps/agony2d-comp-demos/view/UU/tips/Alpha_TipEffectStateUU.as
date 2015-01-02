package view.UU.tips
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Strong;
	
	import org.agony2d.flashApi.tips.TipEffectStateUU;
	
	public class Alpha_TipEffectStateUU extends TipEffectStateUU
	{
		
		
		override public function onEnter():void {
			TweenLite.from(this.fusion, 0.3, {alpha:0.03, ease:Strong.easeOut});
		}
		
		override public function onExit():void {
			TweenLite.to(this.fusion, 0.3, {alpha:0.03, ease:Strong.easeOut, onComplete:function():void{finish()}});
		}
		
		override public function onEnterInterrupted():void{
			TweenLite.killTweensOf(this.fusion);
		}
		
		override public function onExitInterrupted():void{
			TweenLite.killTweensOf(this.fusion);
		}
	}
}