package views.UU.battle.buffStates 
{
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;

public class Qianxing_Buff_StateUU extends Abstract_Buff_StateUU
{
	
	override public function onEnter():void {
		super.onEnter();
		
		_animator = new AnimatorUU;
		_animator.play("common.sneaking", "atlas/skill/qianxing2", 0);
		_animator.pivotX = _animator.sourceWidth / 2;
		_animator.pivotY = _animator.sourceHeight / 2 + 35;
		_animator.touchable = false;
		this.fusion.addNode(_animator);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/qianxing.mp3");
	}
	
	override public function onExit():void {
		super.onExit();
		
		this.toView.breakSneaking();
	}
	
	
	private var _animator:AnimatorUU;
	
}
}