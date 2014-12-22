package utils.path
{
	import models.battle.BattleModel;

	
	
	public class Node
	{
		public var x:int;
		public var y:int;
		public var f:Number;
		public var g:Number;
		public var h:Number;
		public var walkable:Boolean = true;
		public var parent:Node;
		public var costMultiplier:Number = 1.0;
		
		public function Node(x:int, y:int)
		{
			this.x = x;
			this.y = y;
		}
		
		
		public function get posX() : int {
			return this.x;
		}
		
		public function get posY() : int {
			return BattleModel.numGrids - 1 - this.y;
		}
		
		public function get gridId() : int {
			return this.x + 1 + (BattleModel.numGrids - 1 - this.y) * BattleModel.numGrids; 
			//return this.x + 1 + this.y * BattleModel.numGrids; 
		}
		
		public function toString():String {
			return "(" + posX + "," + posY + ")";
		}
	}
}