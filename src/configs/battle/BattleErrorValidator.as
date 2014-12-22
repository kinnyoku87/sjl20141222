package configs.battle 
{
	import configs.error.ErrorConfiguration;
	import models.battle.BattleModel;
	import models.GameModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.UUFacade;
	import views.UU.battle.Battle_active_StateUU;
	import views.UU.battle.GuessCard_StateUU;
	
	public class BattleErrorValidator 
	{
		public static var ret:int;
		
		// 警告列表
		
		// 8006: 技能释放目标错误.
		// 8015: 人物的主动技能对其无效.
		// 8022: 对方手牌为空.
		public static const WARNING_LIST:Object = { 8006:true,
													8015:true, 
													8022:true };
		
		public static function isWarning() : Boolean {
			return WARNING_LIST[ret] != null;
		}
		
		public static function toWarning() : String {
			return "技能释放失败 !\n      " + ErrorConfiguration.getError(ret);
		}
		
		public static function handleError( errorId:int ) : void {
			// 警告提示.
			if (WARNING_LIST[errorId]) {
				ret = errorId;
				
				Agony.getLog().simplify("[ 战斗警告( {0} ) ]: {1}", errorId, ErrorConfiguration.getError(errorId));
			}
			else if ((errorId == -1 && BattleModel.isBattleStarted) || (errorId >= 8000 && errorId < 10000)) {
				GameModel.getLog().simplify("\n============================================================\n");
				GameModel.getLog().error("BattleErrorValidator", "handleError", "錯誤码( {0} ): [ {1} ].", errorId, ErrorConfiguration.getError(errorId));
			}
		}
		
		
		
	}

}