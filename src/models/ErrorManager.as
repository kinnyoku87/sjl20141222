package models 
{
	import configs.ErrorConfig;
	import org.agony2d.flashApi.UUFacade;
	import ui.Prompt;
	/**
	 * ...错误码管理类
	 * @author ... dcl
	 */
	public class ErrorManager 
	{
		private static var _instanse:ErrorManager;
		public function ErrorManager() 
		{
			
		}
		
		
		public function showError(id:int):void {
			var error:String = getError(id);
			UUFacade.getWindow(Prompt).activate([error]);
		}
		
		public function getError(id:int):String
		{
			var error:String = "";
			if (ErrorConfig.errorData[id] != null)
			{
				error = ErrorConfig.errorData[id];
			}			
			if (error == "")
			{
				error = "Error:" + id.toString();
			}			
			return error;
		}
		
		
		
		static public function  get instanse():ErrorManager 
		{
			if (_instanse == null) _instanse = new ErrorManager();
			return _instanse;
		}
		
		
	}

}