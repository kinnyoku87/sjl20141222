package models 
{
	import configs.error.ErrorConfiguration;
	import configs.ErrorConfig;
	import org.agony2d.flashApi.UUFacade;
	import ui.Alert;
	import ui.AlertInfo;
	import ui.Prompt;
	/**
	 * ...提示管理类
	 * @author ... dcl
	 */
	public class PromptManager 
	{
		private static var _instanse:PromptManager;
		public function PromptManager() 
		{
			
		}
		
		//文字版 提示错误码
		public function showError(id:int):void {
			var error:String = ErrorConfiguration.getError(id);
			//UUFacade.getWindow(Prompt).activate([error]);
			showPropmt(error);
		}
		
		//文字版 提示一般提示
		public function showPropmt(str:String):void {
			//UUFacade.getWindow(Prompt).activate([str]);
			var alertInfo:AlertInfo = new AlertInfo();
			alertInfo.msg = str;
			UUFacade.getWindow(Alert).activate([alertInfo]);
		}
		
		//提示版（有背景框）
		public function showAlert(alertInfo:AlertInfo):void {
			UUFacade.getWindow(Alert).activate([alertInfo]);
		}

		
		
		
		static public function  get instanse():PromptManager 
		{
			if (_instanse == null) _instanse = new PromptManager();
			return _instanse;
		}
		
		
	}

}