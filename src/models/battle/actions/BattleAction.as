package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	
	import models.battle.BattleModel;
	
	// 戰鬥動作.
	
	//   1. 動作為隊列執行機制，當隊列成員數目為0時，加入動作直接執行.
	//   2. 隊列開始後，玩家不可再操作.
	//   3. 隊列執行完成後，會自動檢測是否為玩家狀態，是的話則開啟玩家操作.
	
	
	// 動作類型:
	
	//   1. (人物)登場.
	//   2. 移動.
	//   3. 個人摸牌.
	//   4. 對方摸牌.
	//   5. 技能.
	public class BattleAction {
		
		public function BattleAction( roleId:UInt64 ) {
			this._roleId = roleId;
		}
		
		//public function next() : void {
			//BattleModel.doIterateNextAction();
		//}
		
		public function get roleId():UInt64 {
			return _roleId;
		}
		
		public var _roleId:UInt64;
		
	}
}