package configs.error 
{
	import models.GameModel;
	import models.room.RoomModule;
	import org.agony2d.collections.CsvUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ErrorConfiguration 
	{
		
		public static const CALLBACK_ERRORS:Array = [941,6009];     // 既给提示又执行回调的错误码集合
		public static const CALLBACK_SECTION_ERRORS:Object = {"min":8000,"max":10000};     // 既给提示又执行回调的错误码区间集合
		public static const HANDLE_ERRORS:Array = [900];          //根据错误码做其他操作的集合
		
		private static var errorList:Object = {};
		public function ErrorConfiguration() 
		{
			
		}
		
		public static function initError( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var error:ErrorCfg;

			const FIELDS:Array = ["id", "value"];
			l = v.length;
			while(i<l){
				error = new ErrorCfg;
				CsvUtil.setValues(error, v[i++], FIELDS);
				errorList[error.id] = error;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Error ].");
		}
		
		public static function getError(id:int):String {
			var error:String = "";
			if (errorList[id] != null)
			{
				error = errorList[id].value;
			}			
			if (error == "")
			{
				error = "Error:" + id.toString();
			}			
			return error;
		}
		
		public static function checkErrorStealBack(errorId:int):Boolean {
			return  checkCallBack(errorId) || checkHandleBack(errorId);
		}
		
		public static function checkCallBack(errorId:int):Boolean {
			return CALLBACK_ERRORS.indexOf(errorId) != -1 || (errorId >= CALLBACK_SECTION_ERRORS["min"] && errorId <= CALLBACK_SECTION_ERRORS["max"]);
		}
		
		public static function checkHandleBack(errorId:int):Boolean {
			return HANDLE_ERRORS.indexOf(errorId) != -1;
		}
		
		public static function dealHandErrors(errorId:int):void {
			switch(errorId) {
				//房间不存在  RoomModule
				case 900:
					RoomModule.dealRoomError(getError(errorId));
					break;
				default:break;
					
			}
		}
		
	}

}