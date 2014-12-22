package configs.battle
{
	import flash.geom.Point;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	
	import models.GameModel;
	
	import org.agony2d.collections.CsvUtil;
	
	import proto.cs.ChessPos;

	public class BattleConfigurator
	{
		
		public static const GRID_TO_COORD_LIST____2:Array = [null, 
			new Point(60, 495), new Point(180, 495), new Point(301, 495), new Point(423, 495), new Point(546, 495),
			new Point(66, 374), new Point(183, 374), new Point(301, 374), new Point(420, 374), new Point(538, 374),
			new Point(74, 258), new Point(187, 258), new Point(301, 258), new Point(418, 258), new Point(531, 258),
			new Point(79, 149), new Point(190, 149), new Point(301, 149), new Point(415, 149), new Point(527, 149),
			new Point(85, 44),  new Point(194, 44),  new Point(301, 44),  new Point(414, 44),  new Point(522, 44)];
			
		public static const GRID_TO_COORD_LIST____8:Array = [null, 
			new Point(522, 44), new Point(414, 44), new Point(301, 44), new Point(194, 44), new Point(85, 44),
			new Point(527, 149), new Point(415, 149), new Point(301, 149), new Point(190, 149), new Point(79, 149),
			new Point(531, 258), new Point(418, 258), new Point(301, 258), new Point(187, 258), new Point(74, 258),
			new Point(538, 374), new Point(420, 374), new Point(301, 374), new Point(183, 374), new Point(66, 374),
			new Point(546, 495),  new Point(423, 495),  new Point(301, 495),  new Point(180, 495),  new Point(60, 495)];
		
		public static const GRID_TO_COORD_7_7_LIST____2:Array = [null, 
			new Point(54, 611), new Point(159, 611), new Point(264, 611), new Point(370, 611), new Point(476, 611), new Point(584, 611), new Point(688, 611),
			new Point(62, 502), new Point(165, 502), new Point(266, 502), new Point(370, 502), new Point(474, 502), new Point(576, 502), new Point(680, 502),
			new Point(71, 399), new Point(170, 399), new Point(269, 399), new Point(370, 399), new Point(471, 399), new Point(572, 399), new Point(672, 399),
			new Point(77, 301), new Point(176, 301), new Point(271, 301), new Point(370, 301), new Point(469, 301), new Point(566, 301), new Point(664, 301),
			new Point(84, 210), new Point(180, 210), new Point(274, 210), new Point(370, 210), new Point(466, 210), new Point(561, 210), new Point(657, 210),
			new Point(92, 120), new Point(185, 120), new Point(277, 120), new Point(370, 120), new Point(463, 120), new Point(557, 120), new Point(650, 120),
			new Point(97, 36),  new Point(189, 36),  new Point(279, 36),  new Point(370, 36),  new Point(461, 36),  new Point(552, 36),  new Point(642, 36)];
			
		public static const GRID_TO_COORD_7_7_LIST____8:Array = [null, 
			new Point(642, 36),  new Point(552, 36),  new Point(461, 36),  new Point(370, 36),  new Point(279, 36),  new Point(189, 36),  new Point(97, 36),
			new Point(650, 120), new Point(557, 120), new Point(463, 120), new Point(370, 120), new Point(277, 120), new Point(185, 120), new Point(92, 120),
			new Point(657, 210), new Point(561, 210), new Point(466, 210), new Point(370, 210), new Point(274, 210), new Point(180, 210), new Point(84, 210),
			new Point(664, 301), new Point(566, 301), new Point(469, 301), new Point(370, 301), new Point(271, 301), new Point(176, 301), new Point(77, 301),
			new Point(672, 399), new Point(572, 399), new Point(471, 399), new Point(370, 399), new Point(269, 399), new Point(170, 399), new Point(71, 399),
			new Point(680, 502), new Point(576, 502), new Point(474, 502), new Point(370, 502), new Point(266, 502), new Point(165, 502), new Point(62, 502),
			new Point(688, 611), new Point(584, 611), new Point(476, 611), new Point(370, 611), new Point(264, 611), new Point(159, 611), new Point(54, 611)];
			
		
		public static function initGrids( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var vo:GridCfg;
			
			_grid2CoordList = [];
			const ROLE_FIELDS:Array = ["id", "whose", "type", null, null ];	
			l = v.length;
			while(i<l){
				vo = new GridCfg;
				CsvUtil.setValues(vo, v[i++], ROLE_FIELDS);
				_grid2CoordList[vo.id] = vo;
			}
			GameModel.getLog().simplify("初期化: csv - [ Grid ].");
		}
		
		
		// 由格子id獲取格子cfg.
		public static function getCfgByGridId( v:int ) : GridCfg {
			return _grid2CoordList[v];
		}
		
		// 由格子id獲取coord.
		public static function getCoordByGridId( v:int, myRole:Boolean = true ) : Point {
			var chairId:int;
			var battleRole:BattleRoleVo;
			
			battleRole = BattleRoleModel.getMyBattleRoleVo();
			chairId = battleRole ? battleRole.chairId : 0;
			if (chairId == 0) {
				//return GRID_TO_COORD_LIST____2[v];
				return BattleModel.numGrids == 7 ? GRID_TO_COORD_7_7_LIST____2[v] : GRID_TO_COORD_LIST____2[v];
			}
			else if (chairId == 1) {
				//return GRID_TO_COORD_LIST____8[v];
				return BattleModel.numGrids == 7 ? GRID_TO_COORD_7_7_LIST____8[v] : GRID_TO_COORD_LIST____8[v];
			}
			return null;
		}
		
		// 由行列信息獲取coord.
		public static function getCoordByPos( x:int, y:int ) : Point {
			var chairId:int;
			var gridId:int;
			
			gridId = x + 1 + y * BattleModel.numGrids;
			chairId = BattleRoleModel.getMyBattleRoleVo().chairId;
			
			if (chairId == 0) {
				return BattleModel.numGrids == 7 ? GRID_TO_COORD_7_7_LIST____2[gridId] : GRID_TO_COORD_LIST____2[gridId];
			}
			else if (chairId == 1) {
				return BattleModel.numGrids == 7 ? GRID_TO_COORD_7_7_LIST____8[gridId] : GRID_TO_COORD_LIST____8[gridId];
			}
			return null;
		}
		
		// 由行列信息(点)獲取coord.
		public static function getCoordByPos2( pos:ChessPos ) : Point {
			return getCoordByPos(pos.x, pos.y);
		}
		
		public static function getCoordByPos3( pos:Point ) : Point {
			return getCoordByPos(pos.x, pos.y);
		}
		
		// 格子id => 行列.
		
		// ...
		// 15, 16, 17, 18, 19, 20, 21
		// 8,   9, 10, 11, 12, 13, 14
		// 1,   2,  3,  4,  5,  6,  7
		
		// ...
		// (0,1), (1,1), (2,1), (3,1), (4,1), (5,1), (6,1)
		// (0,0), (1,0), (2,0), (3,0), (4,0), (5,0), (6,0)
		public static function gridToPos( v:int ) : Point {
			return new Point((v - 1) % BattleModel.numGrids, int((v - 1) / BattleModel.numGrids));
		}
		
		public static function gridToPos2( v:int ) : ChessPos {
			var pos:ChessPos;
			
			pos = new ChessPos;
			pos.x = (v - 1) % BattleModel.numGrids;
			pos.y = int((v - 1) / BattleModel.numGrids);
			return pos;
		}
		
		// 行列 => 格子id.
		public static function posToGrid( x:int, y:int ) : int {
			return x + 1 + y * BattleModel.numGrids;
		}
		
		// 行列 => 格子id.
		public static function posToGrid2( v:ChessPos ) : int {
			return v.x + 1 + v.y * BattleModel.numGrids;
		}

		// 行列 => 格子id.
		public static function posToGrid3( v:Point ) : int {
			return v.x + 1 + v.y * BattleModel.numGrids;
		}
		
		
		
		
		private static var _grid2CoordList:Array;
	}
}