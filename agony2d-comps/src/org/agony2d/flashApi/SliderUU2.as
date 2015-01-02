package org.agony2d.flashApi 
{
	import flash.geom.Point;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.events.ATouchEvent;
	/**
	 * ... 
	 * @author ...
	 */
	public class SliderUU2 extends ScrollProgressBarUU
	{
		private var mask:RawSpriteUU;  //可变区域 遮罩
		//private var thumb:DragFusionUU;  //滑动块，后期如需要则加入
		private var _offestWidth:Number;  //可变区域相对于原点坐标
		private var _barWidth:Number;   //可变区域的宽度
		
		public function SliderUU2() 
		{
			super();
			mask = new RawSpriteUU;
			this.addEventListener(ATouchEvent.PRESS, onSliderClick);
		}
		
		//override public function set skinId( v:String ) : void {
			//super.skinId = v;
			//barScale9Img.addEventListener(ATouchEvent.CLICK, onSliderClick);
//
		//}
		
		//值 0 - 1
		public function get sliderValue():Number{
			return (barScale9Img.displayObject.mask.width - offestWidth) / barWidth / Agony.getAdapter().pixelRatio;
		}

		public function set sliderValue(v:Number):void {
			if (v > 1) v = 1;
			if (v < 0) v = 0;
			barScale9Img.displayObject.mask.width = v * barWidth * Agony.getAdapter().pixelRatio +offestWidth;
		}
		
		public function get barWidth():Number 
		{
			return _barWidth;
		}
		
		public function set barWidth(value:Number):void 
		{
			_barWidth = value;
			barScale9Img.width = _barWidth;
			barScale9Img.x = offestWidth;
			mask.graphics.beginFill(0x0, 1);
			mask.graphics.drawRect(0, 0, _barWidth, height);
			setMask(mask);
			this.addNode(mask);
		}
		
		public function get offestWidth():Number 
		{
			return _offestWidth;
		}
		
		public function set offestWidth(value:Number):void 
		{
			_offestWidth = value;
		}
		
		private function onSliderClick(evt:ATouchEvent):void {
			var point:Point = this.globalToLocal(evt.touch.rootX, evt.touch.rootY);
			//var point1:Point = this.globalToLocal(evt.touch.prevRootX, evt.touch.prevRootY);
			//var point2:Point = this.localToGlobal(evt.touch.rootX, evt.touch.rootY);
			//var point3:Point = this.localToGlobal(evt.touch.prevRootX, evt.touch.prevRootY);
			sliderValue = (point.x - offestWidth ) / barWidth;
			dispatchDirectEvent(AEvent.CHANGE);
		} 
	}

}