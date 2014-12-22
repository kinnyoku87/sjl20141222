package views.UU.comps {
	import com.netease.protobuf.UInt64;
	import models.battle.actions.BattleAction;
	import models.battle.actions.BuffAction;
	import models.battle.actions.NextRoundAction;
	import models.events.ActionEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.core.IAssetBundle;
	import org.agony2d.resources.core.IAssetData;
	import org.agony2d.resources.inside.AssetData;
	import org.agony2d.resources.ResMachine;
	import org.agony2d.utils.formatString;
	import proto.cs.BattleBuff;
	import res.handlers.Atlas2_ResHandler;
	
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	import configs.ConfigRes;
	import configs.battle.BattleConfigurator;
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import models.battle.interactions.ClickCharacter_InteractPolicy;
	import models.battle.interactions.InteractPolicy;
	import models.player.PlayerModel;
	
	import net.NetManager;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.BitmapUtil;
	
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.MoveChessReq;
	
	import utils.TextUtil;
	
	// 第1层: 底层特效.
	// 第2层: 阴影。
	// 第3层: 可选择光晕.
	// 第4层: 选中光晕动画.
public class CharacterUU extends FusionUU {
	
	public function CharacterUU( vo:CharacterVo ){
		var isSelf:Boolean;
		var bundle:IAssetBundle;
		var asset:IAssetData;
		var name:String;
		var attack:*;
		var hp:*;
		var move:*;
		
		_bottomFusion = new FusionUU;
		this.addNode(_bottomFusion);
		
		// 脚下阴影.
		_shadow = new ImageLoaderUU;
		_shadow.source = TResourceManager.getAsset("battle/img/shadow.png");
		_shadow.pivotX = _shadow.sourceWidth / 2;
		_shadow.pivotY = _shadow.sourceHeight / 2;
		this.addNode(_shadow);
		
		_vo = vo;
		_cfg = CardConfigurator.getCardById(_vo.card_guid) as CharacterCardCfg;
		//_bitmapID = _cfg.quality > 4 ? "atlas/zhouwang" : "atlas/shang/shield";
		//_bitmapID = _cfg.quality > 4 ? "atlas/characters/zhouwang" : "atlas/shang/shield";
		//_bitmapID = _cfg.quality > 4 ? "atlas/zhouwang" : "atlas/characters/xinhuan";
		//_bitmapID = _cfg.quality > 4 ? "atlas/characters/zhouwang" : "atlas/characters/optional";
		//_bitmapID = _cfg.quality > 4 ? "atlas/characters/zhouwang" : "atlas/characters/gongjianjiangshang";
		//_clipId = _cfg.quality > 4 ? "common.eight" : "common.ten";
		//_clipId = "common.eight";
		
		// 人物动画.
		_animator = new AnimatorUU;
		this.addNode(_animator);
		
		// 潜行状态.
		if (this.isSneaking()) {
			Agony.getLog().simplify("[ 出現潛行人物 ]: {0}", _cfg.name);
			
			// 我的.
			if (PlayerModel.isMyRole(vo.role_id)) {
				name = _vo.name;
				attack = _vo.attack;
				hp = _vo.hp;
				move = _vo.move;
			}
			else {
				name = "潜行者";
				attack = "？";
				hp = "？";
				move = "？";
			}
			this.____doUpdateSneakingAnimator();
		}
		// 非潜行状态.
		else {
			this.____doUpdateAnimator();
			name = _vo.name;
			attack = _vo.attack;
			hp = _vo.hp;
			move = _vo.move;
		}
		
		// 是否為我方.
		isSelf = !_vo || (_vo.role_id && PlayerModel.isMyRole(vo.role_id));
		
		_nameLabel = TextUtil.createLabel(name, 15, isSelf ? 0x33dd33 : 0xdd3333, false, 1, 3.5);
		this.addNode(_nameLabel);
		_nameLabel.x = - 44 -_nameLabel.width / 2;
		//_nameLabel.y = -65;
		_nameLabel.y = -63.5;
		
		_attackLabel = TextUtil.createLabel(attack, 17, NORMAL_COLOR);
		this.addNode(_attackLabel);
		_attackLabel.x = -52;
		//_attackLabel.y = -40;
		_attackLabel.y = -45 + 1;
		
		_hpLabel = TextUtil.createLabel(hp, 17, NORMAL_COLOR);
		this.addNode(_hpLabel);
		_hpLabel.x = -52;
		//_hpLabel.y = -15;
		_hpLabel.y = -25 + 2;
		
		_moveLabel = TextUtil.createLabel(move, 17, NORMAL_COLOR);
		this.addNode(_moveLabel);
		_moveLabel.x = -52;
		_moveLabel.y = -5 + 3;
		
		_bottomFusion.touchable = _animator.touchable = _nameLabel.touchable = _attackLabel.touchable = _hpLabel.touchable = _moveLabel.touchable = false;
		
		this.____doUpdateColor();
		
		// [ 偵聽 ]: 點擊人物.
		//this.addEventListener(ATouchEvent.CLICK, ____onClick);
		this.addEventListener(ATouchEvent.CLICK, ____onClick);
	}
	
	private function ____doUpdateAnimator() : void {
		var asset:IAssetData;
		
		// 已经存在.
		if (UUFacade.cache.isAtlasExist(this.atlasId)) {
			this.updateClip();
			
			_animator.setTargetId(this.atlasId);
			
			this.idle(BattleModel.getIdleDirection(_vo.role_id));
			this.updatePivot(false);
			
			Agony.getLog().simplify("Atlas...Complete: [ {0} ]", this.atlasURL);
		}
		else {
			// 资源错误.
			asset = ResMachine.getAsset(this.atlasURL);
			if (asset && asset.hasError()) {
				Agony.getLog().simplify("Atlas...Error: [ {0} ]", this.atlasURL);
			}
			// 正在加载.
			else if (ResMachine.getInstance().getBundle(this.atlasURL)) {
				UUFacade.cache.addEventListener(this.atlasId, onAtlasComplete);
				ResMachine.getInstance().addEventListener(this.atlasURL, onAtlasError);
				
				Agony.getLog().simplify("Atlas...Loading: [ {0} ]", this.atlasURL);
			}
			// 未加载.
			else {
				UUFacade.cache.addEventListener(this.atlasId, onAtlasComplete);
				ResMachine.getInstance().addEventListener(this.atlasURL, onAtlasError);
				
				Agony.getLog().simplify("Atlas...None: [ {0} ]", this.atlasURL);
				
				ResMachine.getInstance().loadFiles(this.atlasURL).setHandler(Atlas2_ResHandler);
			}
			
			_animator.setTargetId("atlas/characters/optional");
			_clipId = "common.eight";
			
			this.idle(BattleModel.getIdleDirection(_vo.role_id));
			this.updatePivot(true);
		}
	}
	
	private function ____doUpdateSneakingAnimator():void {
		var asset:IAssetData;
		
		_animator.setTargetId("atlas/characters/optional");
		_clipId = "common.eight";
		
		_animator.alpha = 0.5;
		
		this.idle(BattleModel.getIdleDirection(_vo.role_id));
		this.updatePivot(true);
		
		// 后台加载，资源不存在.
		if (!UUFacade.cache.isAtlasExist(this.atlasId)) {
			// 资源错误.
			asset = ResMachine.getAsset(this.atlasURL);
			if (asset && asset.hasError()) {
				//Agony.getLog().simplify("Atlas...Error: [ {0} ]", this.atlasURL);
			}
			// 正在加载.
			else if (ResMachine.getInstance().getBundle(this.atlasURL)) {
				UUFacade.cache.addEventListener(this.atlasId, onAtlasComplete);
				ResMachine.getInstance().addEventListener(this.atlasURL, onAtlasError);
				
				Agony.getLog().simplify("Atlas...Loading: [ {0} ]", this.atlasURL);
			}
			// 未加载.
			else {
				UUFacade.cache.addEventListener(this.atlasId, onAtlasComplete);
				ResMachine.getInstance().addEventListener(this.atlasURL, onAtlasError);
				
				Agony.getLog().simplify("Atlas...None: [ {0} ]", this.atlasURL);
				
				ResMachine.getInstance().loadFiles(this.atlasURL).setHandler(Atlas2_ResHandler);
			}
		}
	}
	
	public function breakSneaking() : void {
		_vo.isSneakingBroken = true;
		
		Agony.getLog().simplify("!!!!! {0} 潛行狀態被打破.", _vo.name);
		
		_animator.alpha = 1.0;
		
		this.____doUpdateAnimator();
		_nameLabel.text = _vo.name;
		_attackLabel.text = String(_vo.attack);
		_hpLabel.text = String(_vo.hp);
		_moveLabel.text = String(_vo.move);
		
		_nameLabel.x = - 44 -_nameLabel.width / 2;
	}
	
	private function onAtlasComplete(e:AEvent):void {
		UUFacade.cache.removeEventListener(atlasId, onAtlasComplete);
		ResMachine.getInstance().removeEventListener(atlasURL, onAtlasError);
		
		if (this.isSneaking()) {
			return;
		}
		
		this.updateClip();
		
		_animator.setTargetId(atlasId, _clipId);
		
		this.updatePivot(false);
	}
	
	private function onAtlasError(e:AEvent):void {
		UUFacade.cache.removeEventListener(atlasId, onAtlasComplete);
		ResMachine.getInstance().removeEventListener(atlasURL, onAtlasError);
	}
	
	private function get atlasId() : String {
		return "atlas/characters/" + _cfg.atlasId;
	}
	
	private function get atlasURL():String {
		return "atlas/characters/" + _cfg.atlasId + ".atlas";
	}
	
	private function updateClip() : void {
		if (_cfg.frameRate == 0) {
			_clipId = "common.eight";
		}
		else if (_cfg.frameRate == 10) {
			_clipId = "common.ten";
		}
	}
	
	private function updatePivot( optional:Boolean ) : void {
		_animator.pivotX = _animator.sourceWidth * .5;
		
		// 缺省.
		if (optional) {
			_animator.pivotY = _animator.sourceHeight * .5 + 40;
		}
		else {
			// 辛环.
			//if (_cfg.id == 10015) {
				//_animator.pivotY = _animator.sourceHeight * .5 + 75;
			//}
			// 其他.
			//else {
				//_animator.pivotY = _animator.sourceHeight * .5 + 40;
			//}
			_animator.pivotY = _animator.sourceHeight * .5 + 40 - _cfg.offsetY;
		}
	}
	
	
	
	public static const NORMAL_COLOR:uint = 0xffffff;
	
	public static const DECREASE_COLOR:uint = 0xffff00;
	
	public static const INCREASE_COLOR:uint = 0x8080FF;
	
	
	
	
	
	public function get vo() : CharacterVo {
		return _vo;
	}
	
	public function get cfg() : CharacterCardCfg {
		return _cfg;
	}
	
	override public function get userData() : Object {
		return _shadow.userData;
	}
	
	override public function set userData( v:Object ) : void {
		_shadow.userData = v;
	}
	
	/**
	 * 是否为潜行状态.
	 * 
	 * @return
	 */
	public function isSneaking() : Boolean {
		return (CharacterVo.SNEAK_CHARACTER_ID_LIST[_cfg.id] && !_vo.isSneakingBroken);
	}
	
	// direction 方向，根據Numpad
	// 8 - 上
	// 2 - 下
	// 4 - 左
	// 6 - 右
	
	/**
	 * 攻擊動畫.
	 * 
	 * @param direction
	 * @param count
	 * @param callback
	 */		
	public function attack( direction:int, count:int = 1, callback:Function = null ) : void {
		//_animator.play(_clipId, _bitmapID + "attack/" + this.____toDirection(direction), count, callback);
		_animator.play(_clipId, "attack/" + this.____toDirection(direction > 0 ? direction : BattleModel.getIdleDirection(vo.role_id)), count, callback);
	}
	
	/**
	 * 閒置動畫.
	 * 
	 * @param direction
	 */		
	public function idle( direction:int ) : void {
		//_animator.play(_clipId, _bitmapID + "/idle/" + this.____toDirection(direction), 0);
		_animator.play(_clipId, "idle/" + this.____toDirection(direction > 0 ? direction : BattleModel.getIdleDirection(vo.role_id)), 0);
	}
	
	/**
	 * 奔跑動畫. 
	 * 
	 * @param direction
	 */		
	public function run( direction:int ) : void {
		//_animator.play(_clipId, _bitmapID + "/run/" + this.____toDirection(direction), 0);
		_animator.play(_clipId, "run/" + this.____toDirection(direction > 0 ? direction : BattleModel.getIdleDirection(vo.role_id)), 0);
	}
	
	/**
	 * 擁有該人物的角色id
	 *  
	 * @param role_id
	 * 
	 */		
	public function idleNormal( role_id:UInt64 = null ) : void {
		this.idle(BattleModel.getIdleDirection(role_id));
	}
	
	/**
	 * 更新數值.
	 */
	public function updateValues() : void {
		if (this.isSneaking() && !PlayerModel.isMyRole(_vo.role_id)) {
			return;
		}
		_attackLabel.text = String(_vo.attack);
		_hpLabel.text = String(_vo.hp);
		_moveLabel.text = String(_vo.getFinalMove());
		
		this.____doUpdateColor();
	}
	
	public function toString():String {
		return formatString("id:{0}({1},{2})", [this.vo.name, this.x, this.y]);
	}
	
	
	////////////////////////////////////////////
	// buff
	////////////////////////////////////////////
	
	public function addBuffView( buffAction:BuffAction, stateRef:Class ) : void {
		var buffView:StateFusionUU;
		var buff:BattleBuff;
		
		if (!_buffViews) {
			_buffViews = {};
		}
		
		buff = buffAction.buff;
		
		if (_buffViews[buff.buffId]) {
			this.removeBuffView(buff.buffId);
		}
		
		buffView = new StateFusionUU;
		
		if (stateRef["bottomEffect"]) {
			this._bottomFusion.addNode(buffView);
		}
		else {
			this.addNode(buffView);
		}
		buffView.setState(stateRef, [buffAction]);
		_buffViews[buff.buffId] = buffView;
	}
	
	public function removeBuffView( buffId:int ) : void {
		var buffView:StateFusionUU;
		
		buffView = _buffViews ? _buffViews[buffId] : null;
		if (buffView) {
			buffView.kill();
			delete _buffViews[buffId];
		}
	}
	
	/**
	 * 设定是否睡眠.
	 * 
	 * @param	enabled
	 */
	public function setSleep( enabled:Boolean ) : void {
		if (enabled) {
			if (!_sleepAnimator) {
				_sleepAnimator = new AnimatorUU;
				_sleepAnimator.play("common.sleep", "atlas/scene/sleep", 0);
				_sleepAnimator.x = -_sleepAnimator.sourceWidth / 2;
				_sleepAnimator.y = -_sleepAnimator.sourceHeight / 2;
				_sleepAnimator.touchable = false;
				this.addNode(_sleepAnimator);
				
				BattleModel.addEventListener(ActionEvent.NEXT_ACTION, onNextAction);
			}
		}
		else {
			if (_sleepAnimator) {
				BattleModel.removeEventListener(ActionEvent.NEXT_ACTION, onNextAction);
				_sleepAnimator.kill();
				_sleepAnimator = null;
			}
		}
	}
	
	
	
	
	private var _assaultImg:ImageLoaderUU;
	
	private var _animator:AnimatorUU;
	
	//private var _bitmapID:String;
	
	private var _clipId:String;
	
	private var _vo:CharacterVo;
	
	private var _nameLabel:LabelUU;
	
	private var _attackLabel:LabelUU;
	
	private var _hpLabel:LabelUU;
	
	private var _moveLabel:LabelUU;
	
	private var _cfg:CharacterCardCfg;
	
	private var _bottomFusion:FusionUU;
	
	private var _shadow:ImageLoaderUU;
	
	private var _halo:ImageLoaderUU;
	
	private var _selectedAnimator:AnimatorUU;
	
	
	private var _buffViews:Object; // buffId : view
	
	private var _sleepAnimator:AnimatorUU;
	
	private var _sneakingAnim:AnimatorUU;
	
	
	
	
	private function onNextAction(e:ActionEvent):void {
		if (e.action is NextRoundAction) {
			BattleModel.removeEventListener(ActionEvent.NEXT_ACTION, onNextAction);
			
			_sleepAnimator.kill();
			_sleepAnimator = null;
		}
	}
	
	/**
	 * 选择Ui状态变化.
	 * 
	 * @param	flag
	 */
	public function setSelectedUiState( flag:int ) : void {
		if (flag == CharacterVo.NONE) {
			if (_selectedAnimator) {
				_selectedAnimator.kill();
				_selectedAnimator = null;
			}
		}
		
		else if (flag == CharacterVo.SELECTED || flag == CharacterVo.SELECTED_MOVE_DIRTY) {
			//_animator.filters = [new GlowFilter(0xdd33dd, 0.88, 16, 16)];
			_selectedAnimator = new AnimatorUU;
			_selectedAnimator.play("common.eighteen", "atlas/common/selected2", 0);
			//_selectedAnimator.pivotX = _selectedAnimator.sourceWidth / 2;
			//_selectedAnimator.pivotY = _selectedAnimator.sourceHeight / 2;
			//_selectedAnimator.x = -1;
			//_selectedAnimator.y = -6;
			_selectedAnimator.x = -1 - _selectedAnimator.sourceWidth / 2;
			_selectedAnimator.y = -6 - _selectedAnimator.sourceHeight / 2;
			_selectedAnimator.touchable = false;
			this.addNodeAt(_selectedAnimator, 3);
			
			if (flag == CharacterVo.SELECTED_MOVE_DIRTY) {
				_selectedAnimator.filters = [new ColorMatrixFilter(BitmapUtil.GRAY_SCALE_MATRIX)];
			}
		}
		
	}
	
	/** 
	 * 更新操作狀態.
	 */		
	public function changeViewByOperationFlag() : void {
		///////////////////////////
		// 清除之前交互狀態.
		///////////////////////////
		if(_vo.oldInteractionFlag == CharacterVo.SELECTED || _vo.oldInteractionFlag == CharacterVo.SELECTED_MOVE_DIRTY){
			_animator.filters = null;
		}
		else if(_vo.oldInteractionFlag == CharacterVo.ASSAULT){
			_assaultImg.kill();
			_assaultImg = null;
		}
		
		if (_halo) {
			_halo.kill();
			_halo = null;
		}
		
		///////////////////////////
		// 新的交互狀態
		///////////////////////////
		
		//  技能目标 (可与"可操作" / "发生过移动" 同时存在，但优先触发).
		if (_vo.interactionFlag & CharacterVo.TARGET) {
			_halo = new ImageLoaderUU;
			_halo.source = TResourceManager.getAsset("battle/img/select_red.png");
			_halo.pivotX = _halo.sourceWidth / 2;
			_halo.pivotY = _halo.sourceHeight / 2;
			this.addNodeAt(_halo, 2);
		}
		
		// 发生过移动.
		else if(_vo.interactionFlag & CharacterVo.MOVE_DIRTY){
			// 光晕.
			_halo = new ImageLoaderUU;
			_halo.source = TResourceManager.getAsset("battle/img/select_yellow.png");
			_halo.pivotX = _halo.sourceWidth / 2;
			_halo.pivotY = _halo.sourceHeight / 2;
			_halo.touchable = false;
			this.addNodeAt(_halo, 2);
		}
		
		// 可操作.
		else if(_vo.interactionFlag & CharacterVo.SELECTABLE){
			// 光晕.
			_halo = new ImageLoaderUU;
			_halo.source = TResourceManager.getAsset("battle/img/select_green.png");
			_halo.pivotX = _halo.sourceWidth / 2;
			_halo.pivotY = _halo.sourceHeight / 2;
			_halo.touchable = false;
			this.addNodeAt(_halo, 2);
		}
		// 可攻击.
		else if(_vo.interactionFlag & CharacterVo.ASSAULT){
			_assaultImg = new ImageLoaderUU;
			this.addNode(_assaultImg);
			_assaultImg.source = TResourceManager.getAsset("battle/img/assault.png");
			//_assaultImg.pivotX = _assaultImg.width / 2;
			//_assaultImg.pivotY = _assaultImg.height / 2;
			//_assaultImg.x = -3;
			_assaultImg.x = -_assaultImg.width / 2 + 3;
			_assaultImg.y = -_assaultImg.height / 2 - 1;
			_assaultImg.touchable = false;
			
		}
		
	}
	
	// 自動更新數字顏色.
	private function ____doUpdateColor():void{
		// 攻擊.
		if(_vo.attack > _cfg.attack){
			this._attackLabel.color = INCREASE_COLOR;
		}
		else if(_vo.attack < _cfg.attack){
			this._attackLabel.color = DECREASE_COLOR;
		}
		else {
			this._attackLabel.color = NORMAL_COLOR;
		}
		// 生命.
		if(_vo.hp > _cfg.hp){
			this._hpLabel.color = INCREASE_COLOR;
		}
		else if(_vo.hp < _cfg.hp){
			this._hpLabel.color = DECREASE_COLOR;
		}
		else {
			this._hpLabel.color = NORMAL_COLOR;
		}
		// 移動.
		if(_vo.move > _cfg.movement){
			this._moveLabel.color = INCREASE_COLOR;
		}
		else if(_vo.move < _cfg.movement){
			this._moveLabel.color = DECREASE_COLOR;
		}
		else {
			this._moveLabel.color = NORMAL_COLOR;
		}
	}
	
	
	
	private function ____toDirection( direction:int ) : String {
		var result:String;
		var chairId:int;
		
		chairId = BattleRoleModel.getMyBattleRoleVo().chairId;
		if (chairId == 0) {
			if(direction == 8){
				_animator.scaleX = 1.0;
				result = "back";
			}
			else if(direction == 2){
				_animator.scaleX = 1.0;
				result = "front";
			}
			else if(direction == 4){
				_animator.scaleX = -1.0;
				result = "left";
			}
			else if(direction == 6){
				_animator.scaleX = 1.0;
				result = "left";
			}
		}
		else if (chairId == 1) {
			if(direction == 2){
				_animator.scaleX = 1.0;
				result = "back";
			}
			else if(direction == 8){
				_animator.scaleX = 1.0;
				result = "front";
			}
			else if(direction == 6){
				_animator.scaleX = -1.0;
				result = "left";
			}
			else if(direction == 4){
				_animator.scaleX = 1.0;
				result = "left";
			}
		}
		return result;
	}
	
	
	// 点击.
	private function ____onClick( e:ATouchEvent ) : void {
		InteractPolicy.execPolicy(ClickCharacter_InteractPolicy, [_vo]);
	}
}
}