package models.gameOver 
{
	import com.netease.protobuf.UInt64;
	import configs.room.RoomModConfig;
	import flash.events.GameInputEvent;
	import models.battle.BattleModel;
	import models.GameModel;
	import models.player.CampVo;
	import models.player.PlayerModel;
	import models.room.RoomModule;
	import models.set.SetModule;
	import models.task.TasksModule;
	import models.unlock.UnlockModule;
	import net.NetManager;
	import org.agony2d.events.Notifier;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.sounds.MusicManager;
	import proto.cs.ArenaOverNtf;
	import views.Room_StateVV;
	import views.UU.battle.gameOver.Game_Over_StateUU;
	/**
	 * ...
	 * @author dcl
	 */
	public class GameOverModule 
	{
		
		
		public static const DUAN_RUMEN:int = 1;          //入门
		public static const DUAN_XINSHOU:int = 2;        //新手
		public static const DUAN_CHUJI:int = 3;          //初级
		public static const DUAN_ZHONGJI:int = 4;        //中级 
		public static const DUAN_GAOJI:int = 5;          //高级
		public static const DUAN_ZHUANYEJI:int = 6;      //专业级
		public static const DUAN_ZHUANJIAJI:int = 7;     //专家级
		public static const DUAN_DASHIJI:int = 8;        //大师级
		public static const DUAN_ZONGSHIJI:int = 9;      //宗师级
		public static const DUAN_WANGZHEJI:int = 10;     //王者级
		
		public static const DUAN_IMG:Object = { 1:"rumen", 2:"xinshou", 3:"chuji", 4:"zhongji", 5:"gaoji",
												6:"zhuanye",7:"zhuanjia",8:"dashi",9:"zongshi",10:"wangzhe"};
		
		public static const GAME_OVER_STATE_NONE:String = "GAME_OVER_STATE_NONE";
		public static const GAME_OVER_STATE_LEVEL:String = "GAME_OVER_STATE_LEVEL";
		public static const GAME_OVER_STATE_DUAN:String = "GAME_OVER_STATE_DUAN";
		public static const GAME_OVER_STATE_TASK:String = "GAME_OVER_STATE_TASK";
		public static const GAME_OVER_STATE_UNLOCK:String = "GAME_OVER_STATE_UNLOCK";
		public static const GAME_OVER_STATE_END:String = "GAME_OVER_STATE_END";
		
		
		public static var isWin:Boolean;   //战斗是否胜利
		public static var isUpGrade:Boolean;
		public static var curState:String;
		public static var oldCampVo:CampVo;
		public static var nowCampVo:CampVo;
		
		private static var _notifier:Notifier = new Notifier();
		public function GameOverModule() 
		{
			
		}
		
		/**
		 * 偵聽事件.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function addEventListener( type:String, listener:Function ) : void {
			_notifier.addEventListener(type, listener);
		}
			
		/**
		* 移除偵聽.
		* 
		* @param type
		* @param listener
		*/		
		public static function removeEventListener( type:String, listener:Function ) : void {
			_notifier.removeEventListener(type, listener);
		}
			
		public static function dispatchEvent( str:String, data:Object = null ) : void {
			_notifier.dispatchEvent(new GameOverEvent(str, data));
		}
		
		//进入战场时先获取有关信息，结束时对比处理
		public static function initBattle():void {
			oldCampVo = PlayerModel.getInstance().myRole.getCampVo(GameModel.campBag.campId);
			GameModel.getLog().simplify("OldCampVo-->{0}",oldCampVo);
		}
		
		
		public static function gameOver():void {
			isWin = BattleModel.isWinner;

			nowCampVo = PlayerModel.getInstance().myRole.getCampVo(GameModel.campBag.campId);
			GameModel.getLog().simplify("overCampVo-->{0}", nowCampVo);
			isUpGrade = nowCampVo.level != oldCampVo.level;
			curState = GAME_OVER_STATE_LEVEL;  
			checkAndUpdateSteps();
			if (isUpGrade) UnlockModule.addUnlockCard(GameModel.campBag.campId,nowCampVo.level);
			UUFacade.getWindow(Game_Over_StateUU).activate();
			
		}
		
		//检测此步骤是否需执行，需要则抛事件    不需要则步骤跳到下一步继续检测
		public static function checkAndUpdateSteps():void {
			
			if (curState == GAME_OVER_STATE_LEVEL) {
				dispatchEvent(GameOverEvent.Game_Over_State_Event);
			}
			else if (curState == GAME_OVER_STATE_DUAN) {
				dispatchEvent(GameOverEvent.Game_Over_State_Event);
			}
			else if (curState == GAME_OVER_STATE_TASK) {
				if (TasksModule.completed.length > 0 ) {
					dispatchEvent(GameOverEvent.Game_Over_State_Event);
				}else {
					curState = GAME_OVER_STATE_UNLOCK;
					checkAndUpdateSteps();
				}
			}
			else if (curState == GAME_OVER_STATE_UNLOCK) {
				var bLock:Boolean =UnlockModule.checkCanUnlock() && isUpGrade;
				if (bLock) {
					dispatchEvent(GameOverEvent.Game_Over_State_Event);
				}else {
					curState = GAME_OVER_STATE_END;
					checkAndUpdateSteps();
				}
			}else if (curState == GAME_OVER_STATE_END) {
				dispatchEvent(GameOverEvent.Game_Over_End_Event);
				endGame();
			}
		}
		
		private static function endGame():void {
			GameModel.netBattleExiting();
			RoomModConfig.lastSceneState = RoomModConfig.SCENE_STATE_BATTLE;
			//RoomModule.dealBattleBack();      //还原房间信息
			UUFacade.getWindow(Game_Over_StateUU).close();
			MusicManager.getInstance().loadAndPlay("assets/sounds/music/hall_bg.mp3", 0, SetModule.mainSound * SetModule.backgroundSound);
			ViewFacade.setStateView(Room_StateVV);
		}
		
		//public static function get duanScore():int {
			//
		//}
		public static function get duanImg():String {
			var imgSource:String = "";
			var level:int = int(PlayerModel.getInstance().myRole.getScore(GameModel.gameMode) / 300) + 1;
			return "gameover/img/" + DUAN_IMG[level] + ".png";
		}
	}

}