package models.set 
{
	import org.agony2d.sounds.MusicManager;
	import org.agony2d.sounds.SfxManager;
	import org.agony2d.utils.ACookie;
	/**
	 * ...
	 * @author ...
	 */
	public class SetModule 
	{
		public static const DEFAULT_SOUND:Number = 0.8;
		public static const Set_Coockie_Name:String = "setCoockie";
		public static var  setCoockie:ACookie;
		// userData  {"mainSound":0,"backgroundSound":0,"uiSound":0,"roleSound":0};
		
		public static var mainSound:Number = DEFAULT_SOUND;       //主音量
		public static var backgroundSound:Number = DEFAULT_SOUND;  //背景音量
		public static var uiSound:Number = DEFAULT_SOUND;         //界面音效   现在有么？
		public static var roleSound:Number = DEFAULT_SOUND;       //角色音效   
		
		
		public function SetModule() 
		{
			
		}
		
		public static function saveValues(_main:Number,_bg:Number,_ui:Number,_role:Number):void {
			mainSound = _main;
			backgroundSound = _bg;
			uiSound = _ui;
			roleSound = _role;
			
			setVolumes();
		}
		
		public static function setVolumes():void {
			MusicManager.getInstance().totalVolume = mainSound * backgroundSound;
			SfxManager.getInstance().totalVolume = mainSound * roleSound;
			setCoockie.userData = { "mainSound":mainSound, "backgroundSound":backgroundSound,
										"uiSound":uiSound, "roleSound":roleSound };
			setCoockie.flush();
		}
		
		//进入游戏就要获取设置相关信息   这里设置音量或缓存
		public static function firstVolumes():void {
			//setCoockie = getCoockie();
			//if (setCoockie == null) {
				setCoockie = initCoockie();
				if (setCoockie.size != 0 ) {
					mainSound = setCoockie.userData["mainSound"];
					backgroundSound = setCoockie.userData["backgroundSound"];
					uiSound = setCoockie.userData["uiSound"];
					roleSound = setCoockie.userData["roleSound"];
				}
				setVolumes();
				
			//}else {	
				//
			//}
			
		}
		
		public static function getCoockie():ACookie {
			return ACookie.getCookie(Set_Coockie_Name);
		}
		
		public static function initCoockie():ACookie {
			return new ACookie(Set_Coockie_Name);
		}
		
	}

}