package ui 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.inputs.events.ATouchEvent;
	
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ItemView extends FusionUU
	{
		private var _data:Object;
		protected var _selected:Boolean;
		private var _itemHeight:Number;
		private var _row:int;
		public function ItemView() 
		{
			super();
			init();
		}
		
		protected function init():void {
						
			this.addEventListener(ATouchEvent.CLICK,onClick);
			this.addEventListener(ATouchEvent.HOVER,onHover);
			this.addEventListener(ATouchEvent.LEAVING,onLeave);
		}
		
		protected function updateView():void {
			
		}
		
		public function setSize(newWidth:Number, newHeight:Number):void {
			
		}
		
		protected function onClick(e:ATouchEvent):void {
			if (selected) return;
			selected = true;
		}
		
		protected function onHover(e:ATouchEvent):void {
			if (selected) return;
		}
		
		protected function onLeave(e:ATouchEvent):void {
			
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		public function set data(value:Object):void 
		{
			_data = value;
			updateView();
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
		}
		
		
		public function get itemHeight():Number 
		{
			return _itemHeight;
		}
		
		public function get row():int 
		{
			return _row;
		}
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
	}

}