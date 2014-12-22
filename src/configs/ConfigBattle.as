package configs
{
	public class ConfigBattle
	{
		public function ConfigBattle()
		{
		}
		
		//public static const NUM_GRID:int = 5;
		public static const NUM_GRID:int = 7;
		
		public static const GRID_LOCATING_OFFSET_Y:int = -81;
		
		
		// 失血hp彈出時間.
		public static const LOST_HP_OFFSET_DURATION:Number = 1.25;
		
		// 失血hp消失時間
		public static const LOST_HP_ALPHA_DURATION:Number = 0.8;
		
		// 技能相关文本彈出時間.
		public static const SKILL_TXT_OFFSET_DURATION:Number = 1.3;
		
		// 失血hp消失時間
		public static const SKILL_TXT_ALPHA_DURATION:Number = 0.7;
		
		// 死亡延迟時間.
		public static const DEATH_DELAY:Number = 0.75;
		
		
		// 回合初始法力.
		public static const INIT_MANA_FOR_ROUND:int = 9;
		
		
		// 初期化卡牌数目.
		public static const NUM_INIT_CARDS:int = 5;
		
		
		public static const CARD_POS_UPDATE_DURATION:Number = 0.44;
		
		public static const EMIT_CARD_DURATION:Number = 0.6;
		
		public static const EMIT_CARD_DURATION_PRE:Number = 0.365;
		
		public static const CARD_MOTION_STRENGTH:Number = 1.0;
		
		public static const CARD_MOTION_QUALITY:Number = 5.0;
	}
}