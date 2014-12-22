package views.UU.Set 
{
	import cn.flashk.controls.events.AlertCloseEvent;
	import configs.skinname.SkinNameConfig;
	import models.set.SetModule;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.core.AbstractSliderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.SliderUU;
	import org.agony2d.flashApi.SliderUU2;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ACookie;
	import org.agony2d.utils.ColorUtil;
	import ui.ShildStateUU;
	import utils.CommonUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ...dcl
	 */
	public class Set_StateUU extends ShildStateUU
	{
		private var mainCheck:CheckBoxUU;
		private var backgroundCheck:CheckBoxUU;
		private var uiCheck:CheckBoxUU;
		private var roleCheck:CheckBoxUU;
		
		private var mainSlider:SliderUU2;
		private var backgroundSlider:SliderUU2;
		private var uiSlider:SliderUU2;
		private var roleSlider:SliderUU2;
		
		private var mainLabel:LabelUU;
		private var backgroundLabel:LabelUU;
		private var uiLabel:LabelUU;
		private var roleLabel:LabelUU;
		
		private var _mainNum:Number;
		private var _backgroundNum:Number;
		private var _uiNum:Number;
		private var _roleNum:Number;
		
		private var lastMainNum:Number;
		private var lastBackgroundNum:Number;
		private var lastUiNum:Number;
		private var lastRoleNum:Number;
		
		public function Set_StateUU() 
		{
			notDefaultClose = true;
		}
		
		
		override public function onEnter():void {
			super.onEnter();
		
			var btn:ButtonUU;
			var img:Scale9BitmapUU;
			var txt:LabelUU;

			// 背景
			img = new Scale9BitmapUU;
			img.source = TResourceManager.getAsset("common/img/dialog_bg.png");
			img.width = 700;
			img.height = 700;
			this.fusion.addNode(img);
			this.fusion.spaceWidth = img.width;
			this.fusion.spaceHeight = img.height;
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			//bgImg.skinName = SkinNameConfig.dialog_bg;
			//bgImg.width = 550;
			//bgImg.height = 530;
			//this.fusion.addNode(bgImg);
			//this.fusion.spaceWidth = bgImg.width;
			//this.fusion.spaceHeight = bgImg.height;
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			//关闭按钮
			//btn = new ButtonUU(SkinNameConfig.common_close);
			//this.fusion.addNode(btn);
			//btn.locatingTypeForHoriz = LocatingType.F____A_F;
			//btn.locatingTypeForVerti = LocatingType.F_A____F;
			//btn.locatingOffsetX = -5;
			//btn.locatingOffsetY = 5;
			//btn.addEventListener(ATouchEvent.CLICK, closeClick);
			
			//slider1 = new SliderUU();
			//slider1.skinId = "slider_A";
			//slider1.width = 200;
			//slider1.height = 50;
			//slider1.value = 0;
			//this.fusion.addNode(slider1);
			
			
			txt = TextUtil.createLabel6("声音设置：", 24, 0x6e4a28, false, -1);
			this.fusion.addNode(txt);
			txt.x = 50;
			txt.y = 100;
			
			img = new Scale9BitmapUU();
			img.source = TResourceManager.getAsset("set/img/line_scale9.png");
			this.fusion.addNode(img);
			img.width = 600;
			img.x = 50;
			img.y = 220;
			
			txt = TextUtil.createLabel6("基础设置：", 24, 0x6e4a28, false, -1);
			this.fusion.addNode(txt);
			txt.x = 50;
			txt.y = 250;
			
			img = new Scale9BitmapUU();
			img.source = TResourceManager.getAsset("set/img/line_scale9.png");
			this.fusion.addNode(img);
			img.width = 600;
			img.locatingOffsetX = 50;
			img.locatingOffsetY = 550;
			img.locatingTypeForHoriz = LocatingType.F_A____F
			img.locatingTypeForVerti = LocatingType.F_A____F;
			
			txt = TextUtil.createLabel6("主音量设置：", 20, 0x966f48, false, -1);
			this.fusion.addNode(txt);
			
			txt.locatingOffsetX = 200;
			txt.locatingOffsetY = 130;
			txt.locatingTypeForHoriz = LocatingType.F_A____F
			txt.locatingTypeForVerti = LocatingType.F_A____F;
			
			//主音量
			mainCheck = new CheckBoxUU(SkinNameConfig.set_checkbox_btn, false);
			this.fusion.addNode(mainCheck);
			
			txt = TextUtil.createLabel6("主音量  ", 20,0xdba46c,false,-1);
			mainCheck.addNode(txt);
			mainCheck.locatingOffsetX = -105;
			mainCheck.locatingOffsetY = 10;
			mainCheck.locatingTypeForHoriz = LocatingType.F___A___F
			mainCheck.locatingTypeForVerti = LocatingType.L____L_A;
			mainCheck.addEventListener(AEvent.CHANGE,onCheckChange);
			
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			mainSlider = new SliderUU2();
			mainSlider.skinId = "slider_A";
			this.fusion.addNode(mainSlider);
			mainSlider.locatingTypeForHoriz = LocatingType.L____L_A;
			mainSlider.locatingTypeForVerti = LocatingType.L___A___L;
			mainSlider.locatingOffsetX = 65;
			mainSlider.width = 200;
			mainSlider.offestWidth = 5;
			mainSlider.barWidth = 190;
			//mainSlider.sliderValue = Default_Music_Value;
			mainSlider.addEventListener(AEvent.CHANGE,onSliderChange);
			
			
			
			mainLabel = TextUtil.createLabel6("", 20, 0xffedb0, false, -1);
			this.fusion.addNode(mainLabel);
			mainLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			mainLabel.locatingTypeForVerti = LocatingType.A_L____L;
			mainLabel.locatingOffsetX = -5;
			
			
			txt = TextUtil.createLabel6("音乐音量设置：", 20, 0x966f48, false, -1);
			this.fusion.addNode(txt);
			txt.locatingOffsetX = 200;
			txt.locatingOffsetY = 280;
			txt.locatingTypeForHoriz = LocatingType.F_A____F
			txt.locatingTypeForVerti = LocatingType.F_A____F;
			
			//背景音量
			backgroundCheck = new CheckBoxUU(SkinNameConfig.set_checkbox_btn, false);
			this.fusion.addNode(backgroundCheck);
			
			txt = TextUtil.createLabel6("背景音量", 20,0xdba46c,false,-1);
			backgroundCheck.addNode(txt);
			backgroundCheck.locatingTypeForHoriz = LocatingType.F___A___F
			backgroundCheck.locatingTypeForVerti = LocatingType.L____L_A;
			backgroundCheck.locatingOffsetY = 10;
			backgroundCheck.locatingOffsetX = -100;
			
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.L___A___L;
			backgroundCheck.addEventListener(AEvent.CHANGE,onCheckChange);
			
			
			backgroundSlider = new SliderUU2();
			backgroundSlider.skinId = "slider_A";
			this.fusion.addNode(backgroundSlider);
			backgroundSlider.locatingTypeForHoriz = LocatingType.L____L_A;
			backgroundSlider.locatingTypeForVerti = LocatingType.L___A___L;
			backgroundSlider.locatingOffsetX = 50;
			backgroundSlider.width = 200;
			backgroundSlider.offestWidth = 5;
			backgroundSlider.barWidth = 190;
			//backgroundSlider.sliderValue = Default_Music_Value;
			backgroundSlider.addEventListener(AEvent.CHANGE,onSliderChange);
			
			backgroundLabel = TextUtil.createLabel6("", 20, 0xffedb0, false, -1);
			this.fusion.addNode(backgroundLabel);
			backgroundLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			backgroundLabel.locatingTypeForVerti = LocatingType.A_L____L;
			backgroundLabel.locatingOffsetX = -5;
			
			
			//界面音效
			uiCheck = new CheckBoxUU(SkinNameConfig.set_checkbox_btn, false);
			this.fusion.addNode(uiCheck);
			
			txt = TextUtil.createLabel6("界面音效", 20,0xdba46c,false,-1);
			uiCheck.addNode(txt);
			uiCheck.locatingNode = backgroundCheck;
			uiCheck.locatingOffsetY = 50;
			uiCheck.locatingOffsetX = -100;
			uiCheck.locatingTypeForHoriz = LocatingType.F___A___F
			uiCheck.locatingTypeForVerti = LocatingType.L____L_A;
			uiCheck.addEventListener(AEvent.CHANGE,onCheckChange);
			
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.L___A___L;
			
			uiSlider = new SliderUU2();
			uiSlider.skinId = "slider_A";
			this.fusion.addNode(uiSlider);
			uiSlider.locatingTypeForHoriz = LocatingType.L____L_A;
			uiSlider.locatingTypeForVerti = LocatingType.L___A___L;
			uiSlider.locatingOffsetX = 50;
			uiSlider.width = 200;
			uiSlider.offestWidth = 5;
			uiSlider.barWidth = 190;
			//uiSlider.sliderValue = Default_Music_Value;
			uiSlider.addEventListener(AEvent.CHANGE,onSliderChange);
			
			uiLabel = TextUtil.createLabel6("", 20, 0xffedb0, false, -1);
			this.fusion.addNode(uiLabel);
			uiLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			uiLabel.locatingTypeForVerti = LocatingType.A_L____L;
			uiLabel.locatingOffsetX = -5;
			
			//角色音效
			roleCheck = new CheckBoxUU(SkinNameConfig.set_checkbox_btn, false);
			this.fusion.addNode(roleCheck);
			
			txt = TextUtil.createLabel6("角色音效", 20,0xdba46c,false,-1);
			roleCheck.addNode(txt);
			roleCheck.locatingNode = uiCheck;
			roleCheck.locatingOffsetY = 50
			roleCheck.locatingOffsetX = -100;
			roleCheck.locatingTypeForHoriz = LocatingType.F___A___F;
			roleCheck.locatingTypeForVerti = LocatingType.L____L_A;
			roleCheck.addEventListener(AEvent.CHANGE,onCheckChange);
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			roleSlider = new SliderUU2();
			roleSlider.skinId = "slider_A";
			this.fusion.addNode(roleSlider);
			roleSlider.locatingTypeForHoriz = LocatingType.L____L_A;
			roleSlider.locatingTypeForVerti = LocatingType.L___A___L;
			roleSlider.locatingOffsetX = 50;
			roleSlider.width = 200;
			roleSlider.offestWidth = 5;
			roleSlider.barWidth = 190;
			//roleSlider.sliderValue = Default_Music_Value;
			roleSlider.addEventListener(AEvent.CHANGE,onSliderChange);
			
			roleLabel = TextUtil.createLabel6("", 20, 0xffedb0, false, -1);
			this.fusion.addNode(roleLabel);
			roleLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			roleLabel.locatingTypeForVerti = LocatingType.A_L____L;
			roleLabel.locatingOffsetX = -5;
	
			// 默认按钮
			btn = new ButtonUU(SkinNameConfig.common_D);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F_A____F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetX = 50;
			btn.locatingOffsetY = -50;
			btn.image.width = 50;
			//btn.scaleX = 0.5;
			//btn.scaleY = 0.5;
			btn.image.width = 150;
			btn.image.height = 50;
			//btn.image.width = 200;
			TextUtil.decorateLabel(btn.getLabel(), 25, 0xbd9e82, false).text = "默认设置";
			btn.addEventListener(ATouchEvent.CLICK,onDefaultClick);
			
			// 确定
			btn = new ButtonUU(SkinNameConfig.common_D);
			//btn.scaleX = 0.7;
			//btn.scaleY =  0.6;
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L____L_A;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = 100;
			//btn.scaleX = 0.5;
			//btn.scaleY = 0.5;
			//btn.image.width = 30;
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xbd9e82, false).text = "确定";
			btn.addEventListener(ATouchEvent.CLICK,onOkClick);
			
			// 取消
			btn = new ButtonUU(SkinNameConfig.common_D);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L____L_A;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = 50;
			//btn.scaleX = 0.5;
			//btn.scaleY = 0.5;
			//btn.image.width = 30;
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xbd9e82, false).text = "取消";
			btn.addEventListener(ATouchEvent.CLICK,onCancleClick);
			
			// 应用
			btn = new ButtonUU(SkinNameConfig.common_D);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L____L_A;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = 50;
			//btn.scaleX = 0.5;
			//btn.scaleY = 0.5;
			//btn.image.width = 30;
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xbd9e82, false).text = "应用";
			btn.addEventListener(ATouchEvent.CLICK,onApplyClick);
			
			addRootEvent();
			initValues();
		}
		
		//初始化
		private function initValues():void {
			mainNum = SetModule.mainSound;
			backgroundNum = SetModule.backgroundSound;
			uiNum = SetModule.uiSound;
			roleNum = SetModule.roleSound;
			
			setSliderValue(0,mainNum);
			setSliderValue(1,backgroundNum);
			setSliderValue(2,uiNum);
			setSliderValue(3,roleNum);
			setLastNums();
			dealCheckStatus();
			
			
		}
		
		private function setLastNums():void {
			lastMainNum = mainNum;
			lastBackgroundNum = backgroundNum;
			lastUiNum = uiNum;
			lastRoleNum = roleNum;
		}
		
		private function onCheckChange(evt:AEvent):void {
			var target:CheckBoxUU = evt.target as CheckBoxUU;
			if (target == mainCheck) {
				if (mainCheck.selected) {
					mainNum = lastMainNum;
					
				}else {
					mainNum = 0;
				}
				setSliderValue(0,mainNum);
			}else if (target == backgroundCheck) {
				if (backgroundCheck.selected) {
					backgroundNum = lastBackgroundNum;
				}else {
					backgroundNum = 0;
				}
				setSliderValue(1,backgroundNum);
			}else if (target == uiCheck) {
				if (uiCheck.selected) {
					uiNum = lastUiNum;
				}else {
					uiNum = 0;
				}
				setSliderValue(2,uiNum);
			}else if (target == roleCheck) {
				if (roleCheck.selected) {
					roleNum = lastRoleNum;
				}else {
					roleNum = 0;
				}
				setSliderValue(3,roleNum);
			}
		}
		
		private function onSliderChange(evt:AEvent):void {
			var target:SliderUU2 = evt.target as SliderUU2;
			if (target == mainSlider) {
				
				mainNum = target.sliderValue;
				
				lastMainNum = mainNum;
				dealCheckStatus();
			}else if (target == backgroundSlider) {
				backgroundNum = target.sliderValue;
				
				
				lastBackgroundNum = backgroundNum;
				dealCheckStatus();
			}else if (target == uiSlider) {
				uiNum = target.sliderValue;
				
				lastUiNum = uiNum;
				dealCheckStatus();
			}else if (target == roleSlider) {
				roleNum = target.sliderValue;
				
				lastRoleNum = backgroundNum;
				dealCheckStatus();
			}
		}
		
		private function dealCheckStatus():void {
			if (mainNum == 0) {
				if (mainCheck.selected) {
					mainCheck.selected = false;
				}
			}else {
				if (!mainCheck.selected) {
					mainCheck.selected = true;
				}
			}
			
			if (backgroundNum == 0) {
				if (backgroundCheck.selected) {
					backgroundCheck.selected = false;
				}
			}else {
				if (!backgroundCheck.selected) {
					backgroundCheck.selected = true;
				}
			}
			
			if (uiNum == 0) {
				if (uiCheck.selected) {
					uiCheck.selected = false;
				}
			}else {
				if (!uiCheck.selected) {
					uiCheck.selected = true;
				}
			}			
			if (roleNum == 0) {
				if (roleCheck.selected) {
					roleCheck.selected = false;
				}
			}else {
				if (!roleCheck.selected) {
					roleCheck.selected = true;
				}
			}
		}
		
		private function setCheck(type:int,isCheck:Boolean):void {
			switch(type) {
				case 0:
					mainCheck.selected = isCheck;
					break;
				case 1:
					backgroundCheck.selected = isCheck;
					break;
				case 2:
					uiCheck.selected = isCheck;
					break;
				case 3:
					roleCheck.selected = isCheck;
					break;
			}
		}
		
		private function setSliderValue(type:int,value:Number):void {
			switch(type) {
				case 0:
					mainSlider.sliderValue = value;
					break;
				case 1:
					backgroundSlider.sliderValue = value;
					break;
				case 2:
					uiSlider.sliderValue = value;
					break;
				case 3:
					roleSlider.sliderValue = value;
					break;
			}
		}
		
		private function onDefaultClick(evt:ATouchEvent):void {
			mainNum = SetModule.DEFAULT_SOUND;
			backgroundNum = SetModule.DEFAULT_SOUND;
			uiNum = SetModule.DEFAULT_SOUND;
			roleNum = SetModule.DEFAULT_SOUND;
			setLastNums();
			dealCheckStatus();
			setSliderValue(0,mainNum);
			setSliderValue(1,backgroundNum);
			setSliderValue(2,uiNum);
			setSliderValue(3,roleNum);
			//setCheck(0,true);
			//setCheck(1,true);
			//setCheck(2,true);
			//setCheck(3,true);
		}
		
		private function onOkClick(evt:ATouchEvent):void {
			onApplyClick(evt);
			closeClick(evt);
		}
		
		private function onApplyClick(evt:ATouchEvent):void {
			SetModule.saveValues(mainNum,backgroundNum,uiNum,roleNum);
		}
		
		private function onCancleClick(evt:ATouchEvent):void {
			closeClick(evt);	
		}	

		//按钮点击
		override protected  function closeClick(e:ATouchEvent):void {
			UUFacade.getWindow(Set_StateUU).close();
		}
		
		public function get mainNum():Number 
		{
			return _mainNum;
		}
		
		public function set mainNum(value:Number):void 
		{
			_mainNum = value;
			mainLabel.text = CommonUtil.numToStr(value);
		}
		
		public function get backgroundNum():Number 
		{
			return _backgroundNum;
		}
		
		public function set backgroundNum(value:Number):void 
		{
			_backgroundNum = value;
			backgroundLabel.text = CommonUtil.numToStr(value);
		}
		
		public function get uiNum():Number 
		{
			return _uiNum;
		}
		
		public function set uiNum(value:Number):void 
		{
			_uiNum = value;
			uiLabel.text = CommonUtil.numToStr(value);
		}
		
		public function get roleNum():Number 
		{
			return _roleNum;
		}
		
		public function set roleNum(value:Number):void 
		{
			_roleNum = value;
			roleLabel.text = CommonUtil.numToStr(value);
		}
	}

}