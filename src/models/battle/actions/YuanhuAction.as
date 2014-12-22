package models.battle.actions 
{
	import com.netease.protobuf.UInt64;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import proto.cs.BattleEffect;

public class YuanhuAction extends BattleAction
{
	public function YuanhuAction(roleId:UInt64)
	{
		super(roleId);
	}
	
	public var battleEffect:BattleEffect;
	
	public function get targetVo():CharacterVo {
		return BattleModel.getVoByGuid(battleEffect.objectUid);
	}
	
	
	public function toString() : String {
		return "[ Yuanhu ]: " + (targetVo ? targetVo : "NULL 人物(尚未登场)");
	}
}

}