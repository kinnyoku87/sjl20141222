package  views.UU.tips
{
	import flash.geom.Point;
	
	import org.agony2d.flashApi.tips.TipViewStateUU;
	
	import views.UU.comps.CardUU;
	
	public class Card_TipViewStateUU extends TipViewStateUU
	{
		
		override public function onEnter():void {
			var cardView:CardUU;
			var coord:Point;
			
			cardView = new CardUU;
			cardView.setCardId(this.tipData.userData as int);
			this.fusion.addNode(cardView);
			
			
			coord = this.target.parent.localToGlobal(this.target.x, this.target.y);
			
			// 左
			if(coord.x + this.target.width / 2 + cardView.spaceWidth + 11 > this.fusion.root.spaceWidth){
				coord.x = coord.x - this.target.width / 2 - cardView.spaceWidth - 44;
			}
			// 右
			else {	
				coord.x = coord.x + this.target.width / 2 + 44;
			}
			// 上
			coord.y = coord.y - this.target.height / 2 - cardView.spaceHeight - 44;
			
			this.fusion.x = coord.x;
			this.fusion.y = coord.y;
			
		
		}
	}
}