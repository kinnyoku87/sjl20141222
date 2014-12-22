package views.UU.room 
{
	import com.greensock.TweenMax;
	import configs.ConfigInitUsername;
	import configs.EventConfig;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import event.EventManager;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import models.events.TimeEvent;
	import models.fangchenmi.FangChenMiEvent;
	import models.fangchenmi.FangChenMiModule;
	import models.GameModel;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomModule;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.PivotFusionUU;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.RoomBaseInfo;
	import proto.com.RoomMemberInfo;
	import proto.com.RoomMod;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.CreateRoomReq;
	import proto.cs.JoinRoomRes;
	import utils.GameUtil;
	import utils.TextUtil;
	import utils.TimeUtil;
	import views.CardSet_StateVV;
	import views.Hall_StateVV;
	import views.Shop_StateVV;
	import views.UU.fangchenmi.FangChenMi_StateUU;
	import views.UU.room.states.Figure_Fight_StateUU;
	import views.UU.room.states.Figure_Head_StateUU;
	import views.UU.room.states.Figure_Money_StateUU;
	import views.UU.room.states.Handle_Into_StateUU;
	import views.UU.room.states.Handle_Start_StateUU;
	import views.UU.room.states.Room_Friend_StateUU;
	import views.UU.room.states.Room_List_StateUU;
	import views.UU.room.states.Room_Members_StateUU;
	import views.UU.room.states.Room_TimeCount_StateUU;
	import views.UU.Set.Set_StateUU;
	import views.UU.task.Task_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Room2_StateUU extends StateUU
	{
		private var roomBoard:Scale9MultiBitmapsUU;
		private var roleHeadBoard:Scale9MultiBitmapsUU;
		
		private var _leftTopFusion:FusionUU;
		private var _rightTopFusion:FusionUU;
		private var _leftBottomFusion:FusionUU;
		private var _rightBottomFusion:FusionUU;
		
		private var _leftTopFrame:BitmapLoaderUU;
		private var _rightTopFrame:BitmapLoaderUU;
		private var _leftBottomFrame:BitmapLoaderUU;
		private var _rightBottomFrame:BitmapLoaderUU;
		
		private var radioGroup:RadioGroupUU;
	
		public function Room2_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			// 整体边框.
			roomBoard = new Scale9MultiBitmapsUU;
			roomBoard.skinName = SkinNameConfig.room_scale9;
			this.fusion.addNode(roomBoard);
			roomBoard.touchable = false;
			
			_leftTopFusion = new FusionUU();
			_rightTopFusion = new FusionUU();
			_leftBottomFusion = new FusionUU();
			_rightBottomFusion = new FusionUU();
			this.fusion.addNode(_leftTopFusion);
			this.fusion.addNode(_rightTopFusion);
			this.fusion.addNode(_leftBottomFusion);
			this.fusion.addNode(_rightBottomFusion);
			
			
			
			_leftTopFusion.locatingOffsetX = 35;
			_leftTopFusion.locatingOffsetY = 25;
			
			_rightTopFusion.locatingOffsetX = -35;
			_rightTopFusion.locatingOffsetY = 25;
			
			_leftBottomFusion.locatingOffsetX = 2;
			_leftBottomFusion.locatingOffsetY = -25;
			
			_rightBottomFusion.locatingOffsetX = -35;
			_rightBottomFusion.locatingOffsetY = -25;
			
			_leftTopFrame = new BitmapLoaderUU;
			_leftTopFrame.source = TResourceManager.getAsset("room/img/left_top_frame.png");
			_leftTopFusion.addNode(_leftTopFrame);
			
			_rightTopFrame = new BitmapLoaderUU;
			_rightTopFrame.source = TResourceManager.getAsset("room/img/right_top_frame.png");
			_rightTopFusion.addNode(_rightTopFrame);
			
			_leftBottomFrame = new BitmapLoaderUU;
			_leftBottomFrame.source = TResourceManager.getAsset("room/img/left_bottom_frame.png");
			_leftBottomFusion.addNode(_leftBottomFrame);
			
			//_rightBottomFrame = new BitmapLoaderUU;
			//_rightBottomFrame.source = TResourceManager.getAsset("room/img/right_top_frame.png");
			//var friendUU:FusionUU = new FusionUU;
			//friendUU.width = _rightTopFrame.width;
			//friendUU.height = Agony.getAdapter().rootHeight - _rightTopFrame.height;
			//_rightBottomFusion.addNode(friendUU);
			

			
			//_leftTopFusion.spaceWidth = _leftTopFrame.width;
			//_leftTopFusion.spaceHeight = _leftTopFrame.height;
//
			//_rightTopFusion.spaceWidth = _rightTopFrame.width;
			//_rightTopFusion.spaceHeight = _rightTopFrame.height;
			//
			//_leftBottomFusion.spaceWidth = _leftBottomFrame.width;
			//_leftBottomFusion.spaceHeight = _leftBottomFrame.height;
			//
			//_rightBottomFusion.spaceWidth = _rightTopFrame.width;
			//_rightBottomFusion.spaceHeight = Agony.getAdapter().rootHeight - _rightTopFrame.height;
			
			setFrameLocat();
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, ____onResize);
			
			initLeftTop();
			initLeftBottom();
			initRightTop();
			initRightBottom();
			initEvents();
			if (RoomModConfig.lastSceneState == RoomModConfig.SCENE_STATE_BATTLE) {
				RoomModule.dealBattleBack();
			}
			RoomModConfig.isInDaTing = true;
			RoomModConfig.lastSceneState = RoomModConfig.SCENE_STATE_COMMON;
			//if (!TaskModule.isFirstOpen) {
				//UUFacade.getWindow(Task_StateUU).activate();
				//TaskModule.isFirstOpen = true;
			//}
		}
		
		private function initEvents():void {
			//EventManager.ins.addEvtListener(EventConfig.Join_Room_Into,onIntoRoom);
			//EventManager.ins.addEvtListener(EventConfig.Quit_Room_Out,onOutRoom);
			RoomModule.addEventListener(RoomEvent.Join_Room_Into,onIntoRoom);
			RoomModule.addEventListener(RoomEvent.Quit_Room_Out, onOutRoom);
			RoomModule.addEventListener(RoomEvent.Deal_Room_Error,onRoomError);
		}
		
		
		private function onIntoRoom(evt:String, data:Object = null):void {
			if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) return;
			roomFustion.setState(Room_Members_StateUU);
			handleFustion.setState(Handle_Start_StateUU);
			UUFacade.getWindow(Room_Create_StateUU).close();
		}
		
		private function onOutRoom(evt:RoomEvent):void {

			roomFustion.setState(Room_List_StateUU);
			handleFustion.setState(Handle_Into_StateUU);
		}
		
		private var roomFustion:StateFusionUU;
		private var promptTxt:LabelUU;
		
		private var fangchenmiLabel:LabelUU;
		private var fangchenmiImg:ImageLoaderUU;
		private var fangchenmiShowTime:Timer;
		private var fangchenmiHover:Boolean;
		//初始化左上房间
		private function initLeftTop():void {
			roomFustion = new StateFusionUU;
			this._leftTopFusion.addNode(roomFustion);
			this.roomFustion.spaceWidth = _leftTopFusion.spaceWidth;
			this.roomFustion.spaceHeight = _leftTopFusion.spaceHeight;
			

			if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) {
				roomFustion.setState(Room_Members_StateUU);
			}else {
				if (RoomModConfig.isJoinOrOutRoom) {
					roomFustion.setState(Room_Members_StateUU);
					UUFacade.getWindow(Room_Create_StateUU).close();   //进入房间后，关闭创建房间窗口
				}else {
					roomFustion.setState(Room_List_StateUU);
				}
				
			}
			
			promptTxt = TextUtil.createLabel6("", 25, ColorUtil.RED, true, ColorUtil.BLACK, 1);
			this._leftTopFusion.addNode(promptTxt);
			promptTxt.locatingTypeForHoriz = LocatingType.L___A___L;
			promptTxt.locatingTypeForVerti = LocatingType.L_A____L;
			promptTxt.touchable = false;
			
			
			
			fangchenmiLabel = TextUtil.createLabel6("", 20, 0xffb244, true, 0x24100, 2, TextFieldAutoSize.NONE);
			this._leftTopFusion.addNode(fangchenmiLabel);
			fangchenmiLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			fangchenmiLabel.locatingTypeForVerti = LocatingType.L___A___L;
			fangchenmiLabel.locatingOffsetY = 20;
			fangchenmiLabel.width = 700;
			fangchenmiLabel.height = 80;
			fangchenmiLabel.wordWrap = true;
			
		}
		
		private var promptTween:TweenMax;
		private function showPromp(str:String):void {
			promptTween && promptTween.kill();
			promptTxt.text = str;
			promptTxt.alpha = 1;
			promptTween = TweenMax.to(promptTxt,3,{alpha:0});
		}
		
		
		
		private function onRoomError(evt:RoomEvent):void {
			showPromp(evt.data as String);
		}
		
		
		private var handleFustion:StateFusionUU;           //操作界面
		private var handleScale9:Scale9BitmapUU;     //操作背景图片
		
		
		private var taskBtn:ButtonUU;    //任务按钮
		private var shopBtn:ButtonUU;    //商城按钮
		private var cardBtn:ButtonUU;    //卡包按钮
		private var packageBtn:ButtonUU;    //包裹按钮
		private var giftBtn:ButtonUU;    //礼包按钮
		private var emailBtn:ButtonUU;    //邮件按钮
		//初始化 左下
		private function initLeftBottom():void {
			var iconBg:ImageLoaderUU;
			
			
			handleScale9 = new Scale9BitmapUU;
			handleScale9.source = TResourceManager.getAsset("room/img/handle_bg_scale9.png");
			//handleScale9.skinName = SkinNameConfig.handle_bg_scale9;
			handleScale9.height = 180;
			handleScale9.width = this._leftBottomFrame.width;
			this._leftBottomFusion.addNode(handleScale9);
			handleScale9.locatingTypeForHoriz = LocatingType.L____A_L;
			handleScale9.locatingTypeForVerti = LocatingType.L_A____L;

			handleFustion = new StateFusionUU;
			this._leftBottomFusion.addNode(handleFustion);
			this.handleFustion.spaceWidth = handleScale9.width;
			this.handleFustion.spaceHeight = handleScale9.height;
			
			if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) {
				handleFustion.setState(Handle_Start_StateUU);
			}else {
				if (RoomModConfig.isJoinOrOutRoom) {
					handleFustion.setState(Handle_Start_StateUU);
				}else {
					handleFustion.setState(Handle_Into_StateUU);
				}
			}
			
			var btnPivot:PivotFusionUU;
			
			//商城
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -54;
			iconBg.locatingOffsetX = 15;
			
			btnPivot = new PivotFusionUU();
			shopBtn = new ButtonUU(SkinNameConfig.icon_shop);
			btnPivot.addNode(shopBtn);
			btnPivot.pivotX = shopBtn.image.width / 2;
			btnPivot.pivotY = shopBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;
			
			
			shopBtn.addEventListener(ATouchEvent.CLICK, onShopClick);
			GameUtil.addOverState(btnPivot);
			
			//任务
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -5;
			iconBg.locatingOffsetX = 200;

			btnPivot = new PivotFusionUU();
			taskBtn = new ButtonUU(SkinNameConfig.icon_task);
			btnPivot.addNode(taskBtn);
			btnPivot.pivotX = taskBtn.image.width / 2;
			btnPivot.pivotY = taskBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;
			
			taskBtn.addEventListener(ATouchEvent.CLICK, onTaskClick);
			GameUtil.addOverState(btnPivot);
			
		
			//包裹
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -5;
			iconBg.locatingOffsetX = 350;
			
			btnPivot = new PivotFusionUU();
			packageBtn = new ButtonUU(SkinNameConfig.icon_package);
			btnPivot.addNode(packageBtn);
			btnPivot.pivotX = packageBtn.image.width / 2;
			btnPivot.pivotY = packageBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;	
			GameUtil.addOverState(btnPivot);
			
			//礼包
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -5;
			iconBg.locatingOffsetX = 500;
			
			btnPivot = new PivotFusionUU();
			giftBtn = new ButtonUU(SkinNameConfig.icon_gift);
			btnPivot.addNode(giftBtn);
			btnPivot.pivotX = giftBtn.image.width / 2;
			btnPivot.pivotY = giftBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;	
			GameUtil.addOverState(btnPivot);
			
			//邮件
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -5;
			iconBg.locatingOffsetX = 650;
			
			btnPivot = new PivotFusionUU();
			emailBtn = new ButtonUU(SkinNameConfig.icon_email);
			btnPivot.addNode(emailBtn);
			btnPivot.pivotX = emailBtn.image.width / 2;
			btnPivot.pivotY = emailBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;	
			GameUtil.addOverState(btnPivot);
			
			//卡牌
			iconBg = new ImageLoaderUU;
			iconBg.source = TResourceManager.getAsset("room/btn/icon_bg.png");
			this._leftBottomFusion.addNode(iconBg);
			iconBg.locatingTypeForHoriz = LocatingType.F_A____F;
			iconBg.locatingTypeForVerti = LocatingType.F____A_F;
			iconBg.locatingOffsetY = -54;
			iconBg.locatingOffsetX = 842;
			
			btnPivot = new PivotFusionUU();
			cardBtn = new ButtonUU(SkinNameConfig.icon_card);
			btnPivot.addNode(cardBtn);
			btnPivot.pivotX = cardBtn.image.width / 2;
			btnPivot.pivotY = cardBtn.image.height / 2;
			this._leftBottomFusion.addNode(btnPivot);
			btnPivot.locatingTypeForHoriz = LocatingType.L___A___L;
			btnPivot.locatingTypeForVerti = LocatingType.L___A___L;
			btnPivot.locatingOffsetX = btnPivot.pivotX;
			btnPivot.locatingOffsetY = btnPivot.pivotY;	
			cardBtn.addEventListener(ATouchEvent.CLICK, onCardSetClick);
			GameUtil.addOverState(btnPivot);
		}
		
		private function onTaskClick(e:ATouchEvent) : void {
			UUFacade.getWindow(Task_StateUU).activate();
		}
		
		
		private function onShopClick(e:ATouchEvent) : void {
			ViewFacade.setStateView(Shop_StateVV);
		}
		
		private function onCardSetClick(e:ATouchEvent) : void {
			ViewFacade.setStateView(CardSet_StateVV);
		}
		
		
		
		private var figueFustion:StateFusionUU;
		private var tab1:RadioUU;    //形象
		private	var tab2:RadioUU;   //战绩
		private	var tab3:RadioUU;   //财富
		private var selectBg:ImageLoaderUU;
		//初始化 右上
		private function initRightTop():void {
			var btn:ButtonUU;
			var tab:RadioUU;
			var nameLabel:LabelUU;
			var campLevel:LabelUU;
			
			
			// 返回.
			btn = new ButtonUU(SkinNameConfig.normal_btn);
			this._rightTopFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F____A_F;
			btn.locatingOffsetX = -30;
			btn.y = 10
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text = "返回";
			btn.addEventListener(ATouchEvent.CLICK, ____onBack);
			
			// 设置.
			btn = new ButtonUU(SkinNameConfig.normal_btn);
			this._rightTopFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text =  "设置";
			btn.addEventListener(ATouchEvent.CLICK, ___onSetClick );
			
			
			// 帮助.
			btn = new ButtonUU(SkinNameConfig.normal_btn);
			this._rightTopFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(), 18, ColorUtil.ORANGE, false).text = "帮助";
			
			// 声音.
			btn = new ButtonUU(SkinNameConfig.normal_btn);
			this._rightTopFusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L_A____L;
			btn.locatingOffsetX = -3;
			//btn.y = 26
			TextUtil.decorateLabel(btn.getLabel(),18, ColorUtil.ORANGE, false).text =  "声音";
			
			
			
			
			roleHeadBoard = new Scale9MultiBitmapsUU();
			roleHeadBoard.skinName = SkinNameConfig.rolehead_scale9;
			roleHeadBoard.width = 230;
			roleHeadBoard.height = 285;
			this._rightTopFusion.addNode(roleHeadBoard);
			roleHeadBoard.locatingTypeForHoriz = LocatingType.F___A___F;
			roleHeadBoard.locatingTypeForVerti = LocatingType.F___A___F;
			roleHeadBoard.locatingOffsetX = 25;
			roleHeadBoard.locatingOffsetY = 20;
			roleHeadBoard.touchable = false;
			
			nameLabel = TextUtil.createLabel6("", 20, 0xffb448, true, 0x291600);
			nameLabel.text = PlayerModel.getInstance().myRole.name;
			this._rightTopFusion.addNode(nameLabel);
			nameLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			nameLabel.locatingTypeForVerti = LocatingType.F____A_F;
			nameLabel.locatingOffsetY = -8;
			
			
			
			selectBg = new ImageLoaderUU;
			selectBg.source = TResourceManager.getAsset("room/img/tab_vertical_bg.png");
			this._rightTopFusion.addNode(selectBg);
			selectBg.visible = false;
			
			this._rightTopFusion.swapNodes(roleHeadBoard, selectBg);
			
			
			
			figueFustion = new StateFusionUU;
			this._rightTopFusion.addNode(figueFustion);
			figueFustion.locatingNode = roleHeadBoard;
			figueFustion.locatingTypeForHoriz = LocatingType.L_A____L;
			figueFustion.locatingTypeForVerti = LocatingType.L_A____L;
			this.figueFustion.spaceWidth = roleHeadBoard.width;
			this.figueFustion.spaceHeight = roleHeadBoard.height;
			
			var levelBg:Scale9BitmapUU = new Scale9BitmapUU;
			levelBg.source = TResourceManager.getAsset("common/img/tips_scale9.png");
			this._rightTopFusion.addNode(levelBg);
			levelBg.width = 70;
			levelBg.height = 50;
			levelBg.locatingTypeForHoriz = LocatingType.F____A_F;
			levelBg.locatingTypeForVerti = LocatingType.F____A_F;
			levelBg.locatingOffsetY = -40;
			levelBg.locatingOffsetX = -30;
			
			
			var level:int = PlayerModel.getInstance().myRole.getTotalLevel;
			campLevel = TextUtil.createLabel6(level.toString(), 30, ColorUtil.YELLOW, false, ColorUtil.BLACK,1);
			//campLevel.locatingNode = roleHeadBoard;
			this._rightTopFusion.addNode(campLevel);
			campLevel.locatingTypeForHoriz = LocatingType.L___A___L;
			campLevel.locatingTypeForVerti = LocatingType.L___A___L;
			//campLevel.locatingOffsetY = -35;
			//campLevel.locatingOffsetX = -25;
			
			
			fangchenmiImg = new ImageLoaderUU;
			fangchenmiImg.source = TResourceManager.getAsset("common/img/fangchenmi.png");
			this._rightTopFusion.addNode(fangchenmiImg);
			fangchenmiImg.locatingTypeForHoriz = LocatingType.F____A_F;
			fangchenmiImg.locatingTypeForVerti = LocatingType.F_A____F;
			fangchenmiImg.locatingOffsetX = -40;
			fangchenmiImg.locatingOffsetY = 80;
			fangchenmiImg.addEventListener(ATouchEvent.CLICK,onFangchenmiClick);
			fangchenmiImg.addEventListener(ATouchEvent.HOVER,onFangchenmiHover);
			fangchenmiImg.addEventListener(ATouchEvent.LEAVING,onFangchenmiLeaving);
			
			
			var txt:LabelUU;
			
			radioGroup = new RadioGroupUU();
			// 形象.
			tab1 = new RadioUU(SkinNameConfig.tab_vertical_btn);
			this._rightTopFusion.addNode(tab1);
			tab1.locatingNode = roleHeadBoard;
			tab1.locatingOffsetY = 20;
			tab1.group = radioGroup;
			txt = TextUtil.decorateLabel5(tab1.getLabel(), "形象", 20, 0xffd695, true);
			txt.locatingOffsetY = -10;
			
			// 战绩.
			tab2 = new RadioUU(SkinNameConfig.tab_vertical_btn);
			this._rightTopFusion.addNode(tab2);
			tab2.locatingNode = roleHeadBoard;
			tab2.locatingOffsetY = 100
			tab2.group = radioGroup;
			txt = TextUtil.decorateLabel5(tab2.getLabel(), "战绩", 20, 0xffd695, true);
			txt.locatingOffsetY = -10;
			
			// 财富.
			tab3 = new RadioUU(SkinNameConfig.tab_vertical_btn);
			this._rightTopFusion.addNode(tab3);
			tab3.locatingNode = roleHeadBoard;
			tab3.locatingOffsetY = 180;

			tab3.group = radioGroup;
			txt = TextUtil.decorateLabel5(tab3.getLabel(), "财富", 20, 0xffd695, true);
			txt.locatingOffsetY = -10;
		
			
			this.radioGroup.addEventListener(AEvent.CHANGE, onRadioChanged);
			radioGroup.selectedIndex = 0;
			//setRigthTopStatus();
			
			onUpdateFangchenmi(null);
			updateFangchenmi(!FangChenMiModule.isVarificate);
		}
		
		
		private function onFangchenmiClick(evt:ATouchEvent):void {
			UUFacade.getWindow(FangChenMi_StateUU).activate();
		}
		
		private function onFangchenmiHover(evt:ATouchEvent):void {
			fangchenmiHover = true;
			fangchenmiLabel.visible = true;
			fangchenmiLabel.text = FangChenMiModule.FangchenmiStr;
		}
		
		private function onFangchenmiLeaving(evt:ATouchEvent):void {
			fangchenmiHover = false;
			if (fangchenmiShowTime == null) {
				fangchenmiLabel.visible = false;
			}
			
		}
		
		private function onUpdateTime(evt:TimeEvent):void {
			if (fangchenmiShowTime == null && !fangchenmiHover) {
				var bShow:Boolean = FangChenMiModule.updateFangChenmi();
				updateFangchenmi(bShow);
			}
			
		}
		
		private function updateFangchenmi(b:Boolean):void {
			fangchenmiLabel.visible = b;
			fangchenmiLabel.text = FangChenMiModule.FangchenmiStr;
			if (b) {	
				clearStartTime();
				fangchenmiShowTime = new Timer(1000, 5);
				fangchenmiShowTime.addEventListener(TimerEvent.TIMER_COMPLETE, function():void {	
					fangchenmiShowTime.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
					clearStartTime();
				});
				fangchenmiShowTime.start();
				
			}

		}
		
		
		
		private function onUpdateFangchenmi(evt:FangChenMiEvent):void {
			fangchenmiImg.visible = !FangChenMiModule.isVarificate;
			fangchenmiLabel.visible = !FangChenMiModule.isVarificate;
			if (FangChenMiModule.isVarificate) {
				TimeUtil.removeEventListener(TimeEvent.Timer_Handler_Event, onUpdateTime);
				FangChenMiModule.removeEventListener(FangChenMiEvent.Update_FanChenMi_Info, onUpdateFangchenmi);
			
			}else {
				TimeUtil.addEventListener(TimeEvent.Timer_Handler_Event, onUpdateTime);
				FangChenMiModule.addEventListener(FangChenMiEvent.Update_FanChenMi_Info, onUpdateFangchenmi);
			}
			
		}
		
		private function clearStartTime():void {
			if (fangchenmiShowTime != null) {
				fangchenmiShowTime.stop();
				fangchenmiShowTime = null;
			}
				
		}
		
		//设置玩家状态
		private function setRightTopStatus():void {
			tab1.locatingOffsetX = 0;
			tab2.locatingOffsetX = 0;
			tab3.locatingOffsetX = 0;
			switch(radioGroup.selectedIndex) {
				case 0:
					tab1.locatingOffsetX = 5;
					selectBg.locatingNode = tab1;
					figueFustion.setState(Figure_Head_StateUU,[PlayerModel.getInstance().myRole.icon]);
				break;
				case 1:
					tab2.locatingOffsetX = 5;
					selectBg.locatingNode = tab2;
					figueFustion.setState(Figure_Fight_StateUU);
				break;
				case 2:
					tab3.locatingOffsetX = 5;
					selectBg.locatingNode = tab3;
					
					figueFustion.setState(Figure_Money_StateUU);
				break;
				
			}
			tab1.locatingTypeForHoriz = LocatingType.A_L____L;
			tab1.locatingTypeForVerti = LocatingType.L_A____L;
			tab2.locatingTypeForHoriz = LocatingType.A_L____L;
			tab2.locatingTypeForVerti = LocatingType.L_A____L;
			tab3.locatingTypeForHoriz = LocatingType.A_L____L;
			tab3.locatingTypeForVerti = LocatingType.L_A____L;
			
			selectBg.locatingTypeForHoriz = LocatingType.L_A____L;
			selectBg.locatingTypeForVerti = LocatingType.L_A____L;
			selectBg.locatingOffsetX = -5.5;
			selectBg.locatingOffsetY = -12;
			selectBg.visible = true;
		}
		
		private var friendFusion:StateFusionUU;
		
		//初始化 右下
		private function initRightBottom():void {
			friendFusion = new StateFusionUU;
			this._rightBottomFusion.addNode(friendFusion);
			this.friendFusion.spaceWidth = _rightBottomFusion.spaceWidth;
			this.friendFusion.spaceHeight = _rightBottomFusion.spaceHeight;
			friendFusion.setState(Room_Friend_StateUU);
		}
		
		
		private function onRadioChanged(e:AEvent):void {
			setRightTopStatus();
		}
		
		// 返回大廳.
		private function ____onBack(e:ATouchEvent):void {
			if (RoomModConfig.isInRoom && GameModel.gameMode != RoomMod.ROOM_MOD_PRACTICE) {
				if (RoomModConfig.isStartState) {
					showPromp("游戏即将开始，无法返回！");
					return;
				}
				if (RoomModConfig.enterRoomTime > 0) {
					showPromp("进入房间未满1分钟，禁止退出！还剩 " + RoomModConfig.enterRoomTime + "秒");
					return;
				}
				NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_QUIT_REQ,null);
			}else {
				ViewFacade.setStateView(Hall_StateVV);
				RoomModConfig.isJoinOrOutRoom = false;
			}
			
			UUFacade.getWindow(Room_TimeCount_StateUU).close();
			
		}
		
		private function ___onSetClick(e:ATouchEvent):void {
			UUFacade.getWindow(Set_StateUU).activate();
		}
		
		override public function onExit():void {
			super.onExit();
			promptTween && promptTween.kill();
			
			clearStartTime();
			TimeUtil.removeEventListener(TimeEvent.Timer_Handler_Event, onUpdateTime);
			FangChenMiModule.removeEventListener(FangChenMiEvent.Update_FanChenMi_Info, onUpdateFangchenmi);
			
			if (this.fusion.getNodeIndex(roomFustion) != -1) {
				this.fusion.removeNode(roomFustion);
			}
			
			if (this.fusion.getNodeIndex(handleFustion) != -1) {
				this.fusion.removeNode(handleFustion);
			}
			
			if (this.fusion.getNodeIndex(figueFustion) != -1) {
				this.fusion.removeNode(figueFustion);
			}
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, ____onResize);
			
			RoomModConfig.isInDaTing = false;
			RoomModule.removeEventListener(RoomEvent.Join_Room_Into,onIntoRoom);
			RoomModule.removeEventListener(RoomEvent.Quit_Room_Out,onOutRoom);
			RoomModule.removeEventListener(RoomEvent.Deal_Room_Error,onRoomError);
		}
		
		private function ____onResize(e:NodeEvent):void {
			setFrameLocat();
		}
		
		// 设置各块的位置
		private function setFrameLocat():void {
			this.fusion.spaceWidth = this.fusion.root.spaceWidth;
			this.fusion.spaceHeight = this.fusion.root.spaceHeight;
			
			roomBoard.width = this.fusion.spaceWidth ;
			roomBoard.height = this.fusion.spaceHeight;
			
			_leftTopFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			_leftTopFusion.locatingTypeForVerti = LocatingType.F_A____F;
			
			_rightTopFusion.locatingTypeForHoriz = LocatingType.F____A_F;
			_rightTopFusion.locatingTypeForVerti = LocatingType.F_A____F;
			
			_leftBottomFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			_leftBottomFusion.locatingTypeForVerti = LocatingType.F____A_F;
			
			_rightBottomFusion.locatingTypeForHoriz = LocatingType.F____A_F;
			_rightBottomFusion.locatingTypeForVerti = LocatingType.F____A_F;
			
			_leftTopFusion.spaceWidth = _leftTopFusion.width;
			_leftTopFusion.spaceHeight = _leftTopFusion.height;
			
			_rightTopFusion.spaceWidth = _rightTopFusion.width;
			_rightTopFusion.spaceHeight = _rightTopFusion.height;
			
			_leftBottomFusion.spaceWidth = _leftBottomFusion.width;
			_leftBottomFusion.spaceHeight = _leftBottomFusion.height;
			
			_rightBottomFusion.spaceWidth = _rightTopFusion.width;
			_rightBottomFusion.spaceHeight = Agony.getAdapter().rootHeight - _rightTopFusion.height -50;
			
			//_leftTopFusion.scaleX = _leftBottomFusion.scaleX = _rightTopFusion.scaleX = _rightBottomFusion.scaleX =  Agony.getAdapter().pixelRatio;
			//_leftTopFusion.scaleY = _leftBottomFusion.scaleY = _rightTopFusion.scaleY = _rightBottomFusion.scaleY =  Agony.getAdapter().pixelRatio;
		}
	}

}