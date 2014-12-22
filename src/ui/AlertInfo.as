package ui 
{
	/**
	 * ...
	 * @author ... dcl
	 */
	public class AlertInfo 
	{
		public static const defaultWidth:Number = 150;
		public static const defaultHeight:Number = 100;
		

		
		public static const type_1:int = 1;
		public static const type_2:int = 2;
		public static const type_3:int = 3;
		
		public static const skin_1:int = 1;
		public static const skin_2:int = 2;
		public static const skin_3:int = 3;
		public static const skin_4:int = 4;
		
		public static const buttonSkin_A:String = "A";
		public static const buttonSkin_B:String = "B";
		public static const buttonSkin_C:String = "C";
		public static const buttonSkin_D:String = "D";
		public static const buttonSkin_E:String = "E";
		
		//背景样式
		public var skin:int = skin_1;
		//按钮样式
		public var buttonSkin:String = buttonSkin_A;
		
		// 1.文字提示  2.一个按钮操作 3.两个按钮操作
		public var type:int = type_1;    

		//信息主要内容
		public var msg:String;
		public var okLabel:String = "";
		public var okCallback:Function = null;
		public var cancelLabel:String = "";
		public var cancelback:Function = null;
		public var title:String = "";
		
		public var msgLocatingY:Number = 0;
		public var btnLocatingY:Number = 0;
		public var titleLocatingY:Number = 0;
		//尺寸
		public var sizeWidth:Number = defaultWidth;
		public var sizeHeight:Number = defaultHeight;
		
		
		
		public function AlertInfo() 
		{
			
		}
		
	}

}