package views.UU.tips 
{
	import configs.battle.BattleConfigurator;
	import flash.geom.Point;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.tips.TipViewStateUU;
	import views.UU.comps.SkillDescUU;
	/**
	 * ...
	 * @author ...
	 */
	public class BattleSkill_TipViewStateUU extends TipViewStateUU
	{
		
		public function BattleSkill_TipViewStateUU() 
		{
			
		}
		
		
		override public function onEnter():void {
			var comp:SkillDescUU;
			var coord:Point;
			var AY:Array;
			var targetView:NodeUU;
			var coordX:Number;
			var coordY:Number;
			
			AY = this.tipData.userData as Array;
			comp = new SkillDescUU;
			comp.init(AY[0] as int);
			this.fusion.addNode(comp);
			targetView = AY[1];
			
			//coord = this.target.parent.localToGlobal(this.target.x, this.target.y);
			//coord = BattleConfigurator.getCoordByGridId(gridId);
			coord = targetView.parent.localToGlobal(targetView.x, targetView.y);
			
			
			// 左
			if (coord.x + comp.width + 110 < this.fusion.root.spaceWidth) {
				coordX = coord.x + 110;
			}
			// 右
			else {	
				coordX = coord.x - comp.width - 80;
			}
			// 上
			coordY = coord.y - comp.height + 22;
			
			//trace(coord);
			
			this.fusion.x = coordX;
			this.fusion.y = coordY;
			
			
		}
	}

}