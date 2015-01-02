package view.UU.tips
{
	import flash.filters.GlowFilter;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.tips.TipViewStateUU;
	
	public class Label_TipViewStateUU extends TipViewStateUU
	{
		public function Label_TipViewStateUU()
		{
			super();
		}
		
		override public function onEnter():void {
			var label:LabelUU;
			
			
			label = new LabelUU;
			label.text = "這是一個ToolTip狀態.";
			label.border = true;
			label.size = 22;
			label.borderColor = 0x0;
			label.color = 0xFFFFFF;
			this.fusion.addNode(label);
			label.filters = [ new GlowFilter(0x0)];
			
			
			
			this.fusion.x = this.target.x + this.target.width / 2 + 3;
			this.fusion.y = this.target.y - this.target.height / 2 - this.fusion.height - 3;
			
			
//			this.touch.addEventListener(AEvent.CHANGE, ____onChanged);
			
//			this.____onChanged(null);
		}
		
		private function ____onChanged(e:AEvent):void{
//			this.fusion.x = this.touch.rootX;
//			this.fusion.y = this.touch.rootY;
		}
	}
}