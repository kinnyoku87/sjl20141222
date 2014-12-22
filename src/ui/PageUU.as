package ui 
{
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	/**
	 * ...翻页组件
	 * @author ... dcl
	 */
	
	public class PageUU extends FusionUU
	{
		public var pageInfo:LabelUU;
		private var rPageBtn:ButtonUU;
		private var lPageBtn:ButtonUU;
		private var toRPageBtn:ButtonUU;
		private var toLPageBtn:ButtonUU;
		
		public var textStyle:String = "normal";
		private var _style:Array;
		public var currentPage:int = 1;
		public var totalPage:int = 0;
		public var separate:String = "/";
		public var searchParamter:Object = {};
		
		public function PageUU(label:LabelUU,lBtnSkin:String, rBtnSkin:String, toLBtnSkin:String = "", toRBtnSin:String = "") 
		{
			//this.parent.addNode(this);
			lPageBtn = new ButtonUU(lBtnSkin);
			rPageBtn = new ButtonUU(rBtnSkin);
			
			
			pageInfo = label;
			
			addNode(pageInfo);
			lPageBtn.locatingTypeForHoriz = LocatingType.A_L____L;
			lPageBtn.locatingTypeForVerti = LocatingType.L___A___L;
			addNode(lPageBtn);
			rPageBtn.locatingNode = pageInfo;
			rPageBtn.locatingTypeForHoriz = LocatingType.L____L_A;
			rPageBtn.locatingTypeForVerti = LocatingType.L___A___L;
			addNode(rPageBtn);
			if (toLBtnSkin != "") {
				toLPageBtn = new ButtonUU(toLBtnSkin);
				toLPageBtn.locatingNode = lPageBtn;
				toLPageBtn.locatingTypeForHoriz = LocatingType.A_L____L;
				addNode(toLPageBtn);
			}
			
			if (toRBtnSin) {
				toRPageBtn = new ButtonUU(toRBtnSin);
				toRPageBtn.locatingNode = rPageBtn;
				toRPageBtn.locatingTypeForHoriz = LocatingType.L____L_A;
				addNode(toRPageBtn);
			}
			
			rPageBtn.addEventListener(ATouchEvent.CLICK, rPageBtnClick);
			lPageBtn.addEventListener(ATouchEvent.CLICK, lPageBtnClick);
			
			if (toRPageBtn != null) toRPageBtn.addEventListener(ATouchEvent.CLICK, toRPageBtnClick);
			if (toLPageBtn != null) toLPageBtn.addEventListener(ATouchEvent.CLICK, toLPageBtnClick);
			
			updateView();
		}
		
		private function rPageBtnClick(evt:ATouchEvent):void
		{
			if (currentPage < totalPage)
			{
				rPageBtn.touchable = true;
				currentPage++;
				updateView();
				dispatchChangeEvent();
			}
		}
		
		private function lPageBtnClick(evt:ATouchEvent):void
		{			
			if (currentPage > 1)
			{
				lPageBtn.touchable = true;
				currentPage--;
				updateView();
				dispatchChangeEvent();
			}
		}
		private function toRPageBtnClick(evt:ATouchEvent):void
		{	
			if (totalPage!=0) 
			{
				if (currentPage != totalPage)
				{
					toRPageBtn.touchable = true;
					currentPage = totalPage;
					updateView();
					dispatchChangeEvent();
				}
			}
			
		}
		private function toLPageBtnClick(evt:ATouchEvent):void
		{			
			if (currentPage != 1)
			{
				toLPageBtn.touchable = true;
				currentPage = 1;
				updateView();
				dispatchChangeEvent();
			}
		}
		
		public function updateView():void
		{	
			if (textStyle =="normal") {
				pageInfo.text = currentPage + separate + totalPage;
			}else {
				pageInfo.text = "第" + currentPage +"页";
			}
			
			rPageBtn.touchable = true;
			lPageBtn.touchable = true;
			
			if (toRPageBtn != null) toRPageBtn.touchable = true;
			if (toLPageBtn != null) toLPageBtn.touchable = true;
			
			if (currentPage <= 1)
			{
				lPageBtn.touchable = false;
				if (toLPageBtn != null) toLPageBtn.touchable = false;
			}
			if (currentPage >= totalPage) 
			{
				rPageBtn.touchable = false;
				if (toRPageBtn != null) toRPageBtn.touchable = false;
			}
		}
		
		private function dispatchChangeEvent():void
		{
			dispatchEvent(new AEvent(AEvent.CHANGE));
		}

		public function set style(value:Array):void 
		{
			_style = value;
			lPageBtn.locatingOffsetX = _style[0];
			lPageBtn.locatingOffsetY = _style[1];
			rPageBtn.locatingOffsetX = _style[2];
			rPageBtn.locatingOffsetY = _style[3];
		}
	}
}