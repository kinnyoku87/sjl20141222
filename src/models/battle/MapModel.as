package models.battle
{
	import com.netease.protobuf.UInt64;
	import flash.geom.Point;
	import org.agony2d.Agony;
	import org.agony2d.utils.MathUtil;
	
	import configs.battle.BattleConfigurator;
	
	import models.GameModel;
	import models.battle.actions.MovementAction;
	
	import proto.cs.ChessPos;
	
	import utils.path.AStar;
	import utils.path.Grid;
	import utils.path.Node;

public class MapModel
{

	
	public static function initialize( numGrids:int ) : void {
//			_astar = new AStar;
		_pathGrid = new Grid(numGrids, numGrids);
		
		_pathGrid2 = new Grid(numGrids, numGrids);
		// 天元.
		//setPathNodeWalkable(13, false);
	}
	
	/**
	 * 獲取方向值.
	 */
	public static function getDirection( startX:int, startY:int, targetX:int, targetY:int ) : int {
		// 向下
		if(targetY < startY){
			return 2;
		}
		// 向上
		else if(targetY > startY){
			return 8;
		}
		// 向左
		else if(targetX < startX){
			return 4;
		}
		// 向右
		else if(targetX > startX){
			return 6;
		}
		// 行列相同.
		return 0;
	}
	
	public static function getDirection2( startPos:Point, targetPos:Point ) : int {
		return getDirection(startPos.x, startPos.y, targetPos.x, targetPos.y);
	}
	
	public static function getDirection3( startPos:ChessPos, targetPos:ChessPos ) : int {
		return getDirection(startPos.x, startPos.y, targetPos.x, targetPos.y);
	}
	
	/**
	 * 获取角度
	 * 
	 * @param	startPos
	 * @param	targetPos
	 * @return
	 */
	public static function getAngle( startPos:Point, targetPos:Point ) : Number {
		var coord_A:Point;
		var coord_B:Point;
		
		coord_A = BattleConfigurator.getCoordByPos(startPos.x, startPos.y);
		coord_B = BattleConfigurator.getCoordByPos(targetPos.x, targetPos.y);
		
		return Math.atan2((coord_B.y - coord_A.y), (coord_B.x - coord_A.x)) * 180 / Math.PI + 90;
	}
	
	/**
	 * 判断行列是否存在.
	 * 
	 * @param	posX
	 * @param	posY
	 * @param	numGrids	棋盘规格.
	 * @return
	 */
	public static function isExistPos( posX:int, posY:int ) : Boolean {
		//startX  =  (prevGridId - 1) % numGrids;
		//startY  =  int((prevGridId - 1) / numGrids);
		
		return (posX >= 0 && posY >= 0 && posX < BattleModel.numGrids && posY < BattleModel.numGrids);
	}
	
	
	
	///////////////////////////////////////////////
	// Path Finding
	///////////////////////////////////////////////
	
	/**
	 * 設定節點是否可通過.
	 *  
	 * @param gridId
	 * @param b
	 */		
	// 尋路地圖 and 遊戲地圖，Y軸為顛倒.
	public static function setPathNodeWalkable( gridId:int, b:Boolean ) : void {
		var x:int;
		var y:int;
		
		x = (gridId - 1) % BattleModel.numGrids;
		y = BattleModel.numGrids - 1 - int((gridId - 1) / BattleModel.numGrids);
		
		_pathGrid.setWalkable(x, y, b);
	}
	
	public static function setPathNodeWalkable2( gridId:int, b:Boolean ) : void {
		var x:int;
		var y:int;
		
		x = (gridId - 1) % BattleModel.numGrids;
		y = BattleModel.numGrids - 1 - int((gridId - 1) / BattleModel.numGrids);
		
		_pathGrid2.setWalkable(x, y, b);
	}
	
	/**
	 * 自動更新格子通過狀態.
	 *  
	 * @param gridId
	 * 
	 */		
	public static function autoUpdatePathNodeWalkable( gridId:int ) : void {
		var x:int;
		var y:int;
		var vo:CharacterVo;
		
		x = (gridId - 1) % BattleModel.numGrids;
		y = BattleModel.numGrids - 1 - int((gridId - 1) / BattleModel.numGrids);
		vo = BattleModel.getVoByGridId(gridId);
		
		// 可能是空格子.
		_pathGrid.setWalkable(x, y, !vo || vo.isFriend);
	}
	
	
	/**
	 * 尋路
	 * 
	 * @param	startGridId
	 * @param	endGridId
	 * @param	exclude	排除自动攻击的特殊场合.
	 * 					找出临位置4个点，按距离排序，从近到远判断.
	 * @param	allWalkable
	 * @return
	 */
	public static function findPath( startGridId:int, endGridId:int, exclude:Boolean = false, allWalkable:Boolean = false ): Array {
		var path:Array;
		var chessPos:ChessPos;
		var node:Node;
		var i:int;
		var l:int;
		var AY:Array; // 當自動移動後攻擊時，可能會站到有人物的位置上，這個列表保存這些人物.
		var vo:CharacterVo;
		var gridId:int;
		var currPathGrid:Grid;
		var pos:Point;
		
		astar ||= new AStar;
		currPathGrid = allWalkable ? _pathGrid2 : _pathGrid;
		
		// 全部可通过.
		currPathGrid.setStartNode2(startGridId);
		
		
		// 當自動移動後攻擊時，可能會站到有人物的位置上.
		if (exclude) {
			/*while(true){
				if(!astar.findPath(currPathGrid)){
					GameModel.getLog().error("BattleModel", "findPath", "尋路錯誤: {0} -> {1}.", startGridId, endGridId);
				}
				path = astar.path;
				node = path[path.length - 2]; 
				gridId = BattleConfigurator.posToGrid(node.posX, node.posY);
				if(BattleModel.getVoByGridId(gridId) != null){
					// walkable暫時設為false.
					MapModel.setPathNodeWalkable2(gridId, false);
					(AY ||= []).push(gridId);
				}
				else {
					break;
				}
			}
			// 檢查并還原walkable.
			if(AY){
				l = AY.length;
				while(i < l){
					gridId = AY[i++];
					MapModel.setPathNodeWalkable2(gridId, true);
				}
			}*/
			pos = ____checkAutoAttack(startGridId, endGridId, currPathGrid);
			currPathGrid.setEndNode2(BattleConfigurator.posToGrid(pos.x, pos.y));
		}
		else {
			currPathGrid.setEndNode2(endGridId);
			//if(!astar.findPath(currPathGrid)){
				//GameModel.getLog().error("BattleModel", "findPath", "尋路錯誤: {0} -> {1}.", startGridId, endGridId);
			//}
			//path = astar.path;
		}
		
		if(!astar.findPath(currPathGrid)){
			GameModel.getLog().error("BattleModel", "findPath", "尋路錯誤: {0} -> {1}.", startGridId, endGridId);
		}
		path = astar.path;
		
		Agony.getLog().simplify("[ Client寻路数据 ]: ({1} - {2}) => {0}", path, startGridId, endGridId);
		
		l = path.length;
		while(i<l){
			node = path[i];
			chessPos = path[i++] = new ChessPos;
			chessPos.x = node.posX;
			chessPos.y = node.posY;
		}
		
		return path;
	}
	
	/**
	 * 自动攻击.
	 * 
	 * @param	startGridId
	 * @param	endGridId
	 * @param	pathGrid
	 * @return	最后到达的行列.
	 */
	private static function ____checkAutoAttack( startGridId:int, endGridId:int, pathGrid:Grid ) : Point {
		var posList:Vector.<Point>;
		var pos:Point;
		
		cachedStartPos = BattleConfigurator.gridToPos(startGridId);
		posList = new <Point>[];
		pos = BattleConfigurator.gridToPos(endGridId);
		// 排除.
		if (isExistPos(pos.x - 1, pos.y) && !BattleModel.getVoByPos(pos.x - 1, pos.y)) {
			posList.push(new Point(pos.x - 1,pos.y));
		}
		if (isExistPos(pos.x + 1, pos.y) && !BattleModel.getVoByPos(pos.x + 1, pos.y)) {
			posList.push(new Point(pos.x + 1,pos.y));
		}
		if (isExistPos(pos.x, pos.y - 1) && !BattleModel.getVoByPos(pos.x, pos.y - 1)) {
			posList.push(new Point(pos.x,pos.y - 1));
		}
		if (isExistPos(pos.x, pos.y + 1) && !BattleModel.getVoByPos(pos.x, pos.y + 1)) {
			posList.push(new Point(pos.x,pos.y + 1));
		}
		posList.sort(____onSort);
		
		return posList[0];
	}
	
	
	private static var cachedStartPos:Point;
	private static function ____onSort( objA:Point, objB:Point ):Number {
		if (MathUtil.getDistance(objA.x, objA.y, cachedStartPos.x, cachedStartPos.y) < MathUtil.getDistance(objB.x, objB.y, cachedStartPos.x, cachedStartPos.y)) {
			return -1;
		}
		return 1;
	}
	
	
	
	public static var cachedStartGridId:int;
	
	public static var cachedAssaultGridId:int; // 可攻击目标的格子id.
	
	
	private static var astar:AStar;
	
	private static var _pathGrid:Grid;
	private static var _pathGrid2:Grid;
	
	
	
	///////////////////////////////////////////////
	// Walkable
	///////////////////////////////////////////////
	
	public static var cachedResult_A:Vector.<int>; // 路徑.
	public static var cachedResult_B:Vector.<int>; // 可攻擊目標.
	
	private static var cachedList_A:Vector.<int>; // 正在遍歷
	private static var cachedList_B:Vector.<int>; // 緩存遍歷
	private static var cacheExistList:Array; // 已經存在列表
	private static var cacheFriendList:Array; // 友方
	private static var len_result_A:int;
	private static var len_result_B:int;
	private static var cachedList_len:int;
	private static var _cachedStartGridId:int;
	
	
	/**
	 * 获取可移动路径和可攻击人物.
	 *  
	 * @param startGridId
	 * @param step
	 * @param allWalkable
	 * 
	 */		
	public static function makePath( startGridId:int, step:int, allWalkable:Boolean ) : void {
		var tmpList:Vector.<int>;
		var len:int;
		
		var i:int;
		var gridId:int;
		var prevGridId:int;
		
		var startX:int;
		var startY:int;
		
		_cachedStartGridId = startGridId;
		
		//x + 1 + y * 5
		//var a:int; // 左邊界
		//var b:int; // 上邊界
		//var c:int; // 右邊界
		//var d:int; // 下邊界
		
		if(!cachedList_A){
			cachedList_A = new <int>[];
			cachedList_B = new <int>[];
			cachedResult_A = new <int>[];
			cachedResult_B = new <int>[];
			cacheExistList = [];
			cacheFriendList = [];
		}
		else {
			cachedList_A.length = cachedList_B.length = cachedResult_A.length = cachedResult_B.length = cacheExistList.length = cacheFriendList.length = len_result_A = len_result_B = cachedList_len = 0;
		}
		//c  =  d  =  numGrids;
		startX = (startGridId - 1) % BattleModel.numGrids;
		startY = int((startGridId - 1) / BattleModel.numGrids);
		cacheExistList[startGridId] = true;
		cachedList_B[len++] = startGridId;
		
		// 當step為0時，為檢測最外側可攻擊敵方.
		while (len > 0 && step-- > -1) {
			i                    =  0;
			tmpList              =  cachedList_A;
			cachedList_A         =  cachedList_B;
			cachedList_B         =  tmpList;
			cachedList_B.length  =  cachedList_len  =  0;
			
			while (i < len) {
				prevGridId  =  cachedList_A[i++];
				startX  =  (prevGridId - 1) % BattleModel.numGrids;
				startY  =  int((prevGridId - 1) / BattleModel.numGrids);
				
				// 是否已緩存 or 超出棋盤.
				gridId  =  (startX - 1) + 1 + startY * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX - 1, startY)){
					____doParseGrid(gridId, step, prevGridId, allWalkable);
				}
				gridId  =  (startX + 1) + 1 + startY * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX + 1, startY)){
					____doParseGrid(gridId, step, prevGridId, allWalkable);
				}
				gridId  =  startX + 1 + (startY - 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX, startY - 1)){
					____doParseGrid(gridId, step, prevGridId, allWalkable);
				}
				gridId  =  startX + 1 + (startY + 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX, startY + 1)){
					____doParseGrid(gridId, step, prevGridId, allWalkable);
				}
			}
//				trace("遞歸格子: ", list_B);
			len = cachedList_len;
		}
	}
	
	private static function ____doParseGrid( gridId:int, step:int, prevGridId:int, allWalkable:Boolean ) : void {
		var vo:CharacterVo;
		
		// 排除天元.
		//if(gridId != 13){
			//return;
		//}
		
		if (!allWalkable) {
			// 存在人物，無法走到該點.
			vo = BattleModel.getVoByGridId(gridId);
			if(vo){
				// 可攻擊的人物.
				if(BattleModel.getVoByGridId(gridId).isAssaultable()){
					// 前一格不能有人物，除了被选择人物本身.
					if(!BattleModel.getVoByGridId(prevGridId) || prevGridId == _cachedStartGridId) {
						cacheExistList[gridId] = cachedResult_B[len_result_B++] = gridId;
					}
				}
				// 友方人物，可穿越.
				else {// if(step >= 1){
					cacheExistList[gridId] = cacheFriendList[gridId] = cachedList_B[cachedList_len++] = gridId;
//						cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
//					else {
//						cacheExistList[gridId] = gridId;
//					}
			}
			// 可走路徑，排除最後一步.
			else if(step >= 0) {
				cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
			}
		}
		else {
			// 存在人物，無法走到該點.
			vo = BattleModel.getVoByGridId(gridId);
			if(vo){
				// 可攻擊的人物.
				if(BattleModel.getVoByGridId(gridId).isAssaultable()){
					// 前一格不能有人物，除了被选择人物本身..
					if(!BattleModel.getVoByGridId(prevGridId) || prevGridId == _cachedStartGridId) {
						cacheExistList[gridId] = cachedResult_B[len_result_B++] = gridId;
					}
					// 全部可穿越.
					if (allWalkable) {
						cachedList_B[cachedList_len++] = gridId;
					}
				}
				// 友方人物，可穿越.
				else {// if(step >= 1){
					cacheExistList[gridId] = cacheFriendList[gridId] = cachedList_B[cachedList_len++] = gridId;
//						cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
//					else {
//						cacheExistList[gridId] = gridId;
//					}
			}
			// 可走路徑，排除最後一步.
			else if(step >= 0) {
				cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
			}
		}
	}
	
	
	
	//////////////////////////////////////////////
	// Pos
	//////////////////////////////////////////////
	
	private static var _minStep:int;
	private static var _maxStep:int;
	
	/**
	 * 获取pos列表.
	 */		
	public static function findPosList( startGridId:int, minStep:int, maxStep:int, zAutoSort:Boolean = false ) : Vector.<int> {
		var tmpList:Vector.<int>;
		var len:int;
		
		var i:int;
		var gridId:int;
		var prevGridId:int;
		
		var startX:int;
		var startY:int;
		var step:int;
		
		_cachedStartGridId = startGridId;
		_minStep = minStep;
		_maxStep = maxStep;
		
		//x + 1 + y * 5
		//var a:int; // 左邊界
		//var b:int; // 上邊界
		//var c:int; // 右邊界
		//var d:int; // 下邊界
		
		if(!cachedList_A){
			cachedList_A = new <int>[];
			cachedList_B = new <int>[];
			cachedResult_A = new <int>[];
			cachedResult_B = new <int>[];
			cacheExistList = [];
			cacheFriendList = [];
		}
		else {
			cachedList_A.length = cachedList_B.length = cachedResult_A.length = cachedResult_B.length = cacheExistList.length = cacheFriendList.length = len_result_A = len_result_B = cachedList_len = 0;
		}
		//c  =  d  =  numGrids;
		startX = (startGridId - 1) % BattleModel.numGrids;
		startY = int((startGridId - 1) / BattleModel.numGrids);
		cacheExistList[startGridId] = true;
		cachedList_B[len++] = startGridId;
		
		// 當step為0時，為檢測最外側可攻擊敵方.
		while (len > 0) {
			i                    =  0;
			tmpList              =  cachedList_A;
			cachedList_A         =  cachedList_B;
			cachedList_B         =  tmpList;
			cachedList_B.length  =  cachedList_len  =  0;
			
			step++;
			while (i < len) {
				prevGridId  =  cachedList_A[i++];
				startX  =  (prevGridId - 1) % BattleModel.numGrids;
				startY  =  int((prevGridId - 1) / BattleModel.numGrids);
				
				// 是否已緩存 or 超出棋盤.
				gridId  =  (startX - 1) + 1 + startY * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX - 1, startY)){
					____doParseGrid2(gridId, step);
				}
				gridId  =  (startX + 1) + 1 + startY * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX + 1, startY)){
					____doParseGrid2(gridId, step);
				}
				gridId  =  startX + 1 + (startY - 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX, startY - 1)){
					____doParseGrid2(gridId, step);
				}
				gridId  =  startX + 1 + (startY + 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX, startY + 1)){
					____doParseGrid2(gridId, step);
				}
			}
//				trace("遞歸格子: ", list_B);
			len = cachedList_len;
		}
		
		if (zAutoSort) {
			cachedResult_A.sort(____onSort_A);
		}
		
		return cachedResult_A;
	}
	
	private static function ____doParseGrid2( gridId:int, step:int ) : void {
		if (_maxStep <= 0 || step <= _maxStep) {
			if (step >= _minStep) {
				cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
			}
			else {
				cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
			}
		}
	}
	
	/**
	 * 获取某点斜方向pos列表.
	 */		
	public static function findDiagonalPosList( startGridId:int ) : Vector.<int> {
		var tmpList:Vector.<int>;
		var len:int;
		
		var i:int;
		var gridId:int;
		var prevGridId:int;
		
		var initStartX:int;
		var initStartY:int;
		var startX:int;
		var startY:int;
		var step:int;
		
		_cachedStartGridId = startGridId;
		
		//x + 1 + y * 5
		//var a:int; // 左邊界
		//var b:int; // 上邊界
		//var c:int; // 右邊界
		//var d:int; // 下邊界
		
		if(!cachedList_A){
			cachedList_A = new <int>[];
			cachedList_B = new <int>[];
			cachedResult_A = new <int>[];
			cachedResult_B = new <int>[];
			cacheExistList = [];
			cacheFriendList = [];
		}
		else {
			cachedList_A.length = cachedList_B.length = cachedResult_A.length = cachedResult_B.length = cacheExistList.length = cacheFriendList.length = len_result_A = len_result_B = cachedList_len = 0;
		}
		//c  =  d  =  numGrids;
		initStartX = (startGridId - 1) % BattleModel.numGrids;
		initStartY = int((startGridId - 1) / BattleModel.numGrids);
		cacheExistList[startGridId] = true;
		cachedList_B[len++] = startGridId;
		
		// 當step為0時，為檢測最外側可攻擊敵方.
		while (len > 0) {
			i                    =  0;
			tmpList              =  cachedList_A;
			cachedList_A         =  cachedList_B;
			cachedList_B         =  tmpList;
			cachedList_B.length  =  cachedList_len  =  0;
			
			step++;
			while (i < len) {
				prevGridId  =  cachedList_A[i++];
				startX  =  (prevGridId - 1) % BattleModel.numGrids;
				startY  =  int((prevGridId - 1) / BattleModel.numGrids);
				
				// 是否已緩存 or 超出棋盤.
				gridId  =  (startX - 1) + 1 + (startY - 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX - 1, startY - 1) && (Math.abs(initStartX - (startX - 1)) == Math.abs(initStartY - (startY - 1)))){
					//____doParseGrid2(gridId, step);
					cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
				gridId  =  (startX - 1) + 1 + (startY + 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX - 1, startY + 1) && (Math.abs(initStartX - (startX - 1)) == Math.abs(initStartY - (startY + 1)))){
					//____doParseGrid2(gridId, step);
					cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
				gridId  =  (startX + 1) + 1 + (startY - 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX + 1, startY - 1) && (Math.abs(initStartX - (startX + 1)) == Math.abs(initStartY - (startY - 1)))){
					//____doParseGrid2(gridId, step);
					cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
				gridId  =  (startX + 1) + 1 + (startY + 1) * BattleModel.numGrids;
				if(!cacheExistList[gridId] && isExistPos(startX + 1, startY + 1) && (Math.abs(initStartX - (startX + 1)) == Math.abs(initStartY - (startY + 1)))){
					//____doParseGrid2(gridId, step);
					cachedResult_A[len_result_A++] = cacheExistList[gridId] = cachedList_B[cachedList_len++] = gridId;
				}
			}
//				trace("遞歸格子: ", list_B);
			len = cachedList_len;
		}
		
		return cachedResult_A;
	}
	
	/**
	 * 查找一定范围内的行列数组.
	 * 
	 * @param	minX
	 * @param	maxX
	 * @param	minY
	 * @param	maxY
	 * @param	zAutoSort
	 * @return
	 */
	public static function find_Area_PosList( minX:int, maxX:int, minY:int, maxY:int, zAutoSort:Boolean = false ) : Vector.<int> {
		var result:Vector.<int>;
		var i:int;
		var n:int;
		
		result = new <int>[];
		while (minY <= maxY) {
			i = minX;
			while (i <= maxX) {
				if (isExistPos(i, minY)) {
					result[n++] = i + 1 + minY * BattleModel.numGrids;
				}
				i++;
			}
			minY++;
		}
		if (zAutoSort) {
			cachedResult_A.sort(____onSort_A);
		}
		return result;
	}
	
	/**
	 * 某人物前方3×3.
	 * 
	 * @param	roleId
	 * @param	startGridId
	 * @param	zAutoSort
	 * @return
	 */
	public static function findFront_3_3_PosList( roleId:UInt64, startGridId:int, zAutoSort:Boolean = false ) : Vector.<int> {
		var result:Vector.<int>;
		var i:int;
		var pos_A:Point;
		//var index_A:int;
		
		//result = new <int>[];
		pos_A = BattleConfigurator.gridToPos(startGridId);
		if (BattleRoleModel.getBattleRoleVo(roleId).chairId == 0) {
			result = find_Area_PosList(pos_A.x - 1, pos_A.x + 1, pos_A.y + 1, pos_A.y + 3, false);
		}
		else {
			result = find_Area_PosList(pos_A.x - 1, pos_A.x + 1, pos_A.y - 3, pos_A.y - 1, false);
		}
		//index_A = result.indexOf(startGridId);
		//result.splice(index_A, 1);
		//trace(result);
		return result;
	}
	
	/**
	 * 前方竖列
	 * 
	 * @param	roleId
	 * @param	startGridId
	 * @param	minStep
	 * @param	maxStep
	 * @return
	 */
	public static function findFront_Verti_PosList( roleId:UInt64, startGridId:int, minStep:int = 1, maxStep:int = -1 ) : Vector.<int> {
		var startPos:Point;
		var posY:Number;
		var battleRole:BattleRoleVo;
		var result:Vector.<int>;
		var i:int;
		
		result = new <int>[];
		battleRole = BattleRoleModel.getBattleRoleVo(roleId);
		startPos = BattleConfigurator.gridToPos(startGridId);
		posY = startPos.y;
		// 一号位.
		if (battleRole.chairId == 0) {
			while (maxStep <= 0 || minStep <= maxStep) {
				if (isExistPos(startPos.x, posY + minStep)) {
					result[i++] = BattleConfigurator.posToGrid(startPos.x, posY + minStep);
				}
				else {
					break;
				}
				minStep++;
			}
		}
		else {
			while (maxStep <= 0 || minStep <= maxStep) {
				if (isExistPos(startPos.x, posY - minStep)) {
					result[i++] = BattleConfigurator.posToGrid(startPos.x, posY - minStep);
				}
				else {
					break;
				}
				minStep++;
			}
		}
		return result;
	}
	
	public static function getVoListByFront_Verti( roleId:UInt64, startGridId:int, minStep:int = 1, maxStep:int = -1 ) : Vector.<CharacterVo> {
		var result:Vector.<CharacterVo>;
		var vo:CharacterVo;
		var l:int;
		var gridId:int;
		
		cachedResult_A = findFront_Verti_PosList(roleId, startGridId, minStep, maxStep);
		result = new <CharacterVo>[];
		l = cachedResult_A.length;
		while (--l > -1) {
			gridId = cachedResult_A[l];
			vo = BattleModel.getVoByGridId(gridId);
			if (vo && vo.isAssaultable()) {
				result.push(vo);
			}
		}
		return result;
	}
	
	/**
	 * 直线方向.
	 * 
	 * @param	startGridId
	 * @param	directionGridId
	 * @param	minStep
	 * @param	maxStep
	 * @return
	 */
	public static function findStraight_PosList( startGridId:int, minStep:int = 1, maxStep:int = -1, directionGridId:int = -1 ) : Vector.<int> {
		var startPos:Point;
		var directionPos:Point;
		var posX:int;
		var posY:int;
		var directionX:int;
		var directionY:int;
		var battleRole:BattleRoleVo;
		var result:Vector.<int>;
		var i:int;
		var k:int;
		var directionFlag:int;
		
		result = new <int>[];
		startPos = BattleConfigurator.gridToPos(startGridId);
		posX = startPos.x;
		posY = startPos.y;
		if (directionGridId > 0) {
			directionPos = BattleConfigurator.gridToPos(directionGridId);
			directionX = directionPos.x;
			directionY = directionPos.y;
			if (directionX < posX) {
				directionFlag = 4;
			}
			else if (directionX > posX) {
				directionFlag = 6;
			}
			else if (directionY < posY) {
				directionFlag = 2;
			}
			else if (directionY > posY) {
				directionFlag = 8;
			}
		}
		if (directionGridId < 0 || directionFlag == 4) {
			k = minStep;
			while (maxStep <= 0 || k <= maxStep) {
				if (isExistPos(posX - k, posY)) {
					result[i++] = BattleConfigurator.posToGrid(posX - k, posY);
				}
				else {
					break;
				}
				k++;
			}
		}
		if (directionGridId < 0 || directionFlag == 6) {
			k = minStep;
			while (maxStep <= 0 || k <= maxStep) {
				if (isExistPos(posX + k, posY)) {
					result[i++] = BattleConfigurator.posToGrid(posX + k, posY);
				}
				else {
					break;
				}
				k++;
			}
		}
		if (directionGridId < 0 || directionFlag == 2) {
			k = minStep;
			while (maxStep <= 0 || k <= maxStep) {
				if (isExistPos(posX, posY - k)) {
					result[i++] = BattleConfigurator.posToGrid(posX, posY - k);
				}
				else {
					break;
				}
				k++;
			}
		}
		if (directionGridId < 0 || directionFlag == 8) {
			k = minStep;
			while (maxStep <= 0 || k <= maxStep) {
				if (isExistPos(posX, posY + k)) {
					result[i++] = BattleConfigurator.posToGrid(posX, posY + k);
				}
				else {
					break;
				}
				k++;
			}
		}
		return result;
	}
	
	/**
	 * 获取指定距离范围的行列信息.
	 * 
	 * @param	startGridId
	 * @param	minStep
	 * @param	maxStep
	 * @return
	 */
	public static function getVoListByDistanceForRival( startGridId:int, minStep:int, maxStep:int ) : Vector.<CharacterVo> {
		var result:Vector.<CharacterVo>;
		var vo:CharacterVo;
		var l:int;
		var gridId:int;
		
		cachedResult_A = findPosList(startGridId, minStep, maxStep);
		result = new <CharacterVo>[];
		l = cachedResult_A.length;
		while (--l > -1) {
			gridId = cachedResult_A[l];
			vo = BattleModel.getVoByGridId(gridId);
			if (vo && vo.isAssaultable()) {
				result.push(vo);
			}
		}
		return result;
	}
	
	/**
	 * 获取指定行的格子id列表.
	 * 
	 * @param	minRow
	 * @param	maxRow
	 * @return
	 */
	public static function getGridIdListByRow( minRow:int, maxRow:int = -1 ) : Vector.<int> {
		var result:Vector.<int>;
		var posX:int;
		var posY:int;
		var i:int;
		var l:int;
		var k:int;
		
		result = new <int>[];
		i = minRow * BattleModel.numGrids + 1;
		l = ((maxRow < 0 ? minRow : maxRow) + 1) * BattleModel.numGrids + 1;
		while (i < l) {
			result[k++] = i++;
		}
		
		return result;
	}
	
	/**
	 * 获取指定列的格子id列表.
	 * 
	 * @param	minCol
	 * @param	maxCol
	 * @return
	 */
	public static function getGridIdListByCol( minCol:int, maxCol:int ) : Vector.<int> {
		return null;
	}
	
	/**
	 * 获取斜角方向的行列信息.
	 * 
	 * @param	startPos
	 * @param	numStep
	 * @return
	 */
	public static function getDiagonalPosList( startPos:Point, minStep:int = 1, maxStep:int = -1 ) : Array {
		var posList:Array;
		
		
		return posList;
	}
	
	private static function ____onSort_A( objA:int, objB:int ):Number {
		if (BattleRoleModel.getMyBattleRoleVo().chairId == 0) {
			if (objA > objB) {
				return -1;
			}
			return 1;
		}
		if (objA < objB) {
			return -1;
		}
		return 1;
	}
}
}