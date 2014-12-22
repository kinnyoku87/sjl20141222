package utils.path 
{
	import models.GameModel;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ErrorUtil 
	{
		
		public function ErrorUtil() 
		{
			
		}
		
		
		public static function showError(str:String):void {
			GameModel.getLog().simplify(str);
		}
	}

}