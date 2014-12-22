package views.UU.battle.buffStates
{
	import models.battle.actions.BuffAction;
	import org.agony2d.flashApi.UUFacade;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.comps.CharacterUU;
	
	import org.agony2d.flashApi.StateUU;
	
	import views.UU.battle.Battle_active_StateUU;
	
public class Abstract_Buff_StateUU extends StateUU {
	
	public var stateActive:Battle_active_StateUU;
	public var stateActivePost:Battle_active_post_StateUU;
	
	// Buff動作.
	public var buffAction:BuffAction;
	
	public var toView:CharacterUU;
	
	
	override public function onEnter():void {
		this.buffAction = this.stateArgs[0];
		
		stateActive = UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU;
		stateActivePost = UUFacade.getWindow(Battle_active_post_StateUU).state as Battle_active_post_StateUU;
		
		toView = this.stateActive.getView(this.buffAction.targetVo);
	}
}
}