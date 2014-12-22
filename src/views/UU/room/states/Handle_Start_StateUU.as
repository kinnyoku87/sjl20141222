package views.UU.room.states 
{
	import cn.flashk.controls.events.CustomEvent;
	import com.netease.protobuf.Message;
	import configs.ConfigNet;
	import configs.EventConfig;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import event.EventManager;
	import flash.events.TimerEvent;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import models.cardSet.CardSetEvent;
	import models.cardSet.CardSetModule;
	import models.GameModel;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomModule;
	import net.NetManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import org.agony2d.utils.formatString;
	import proto.com.CAMP_ID;
	import proto.com.RoomMod;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.MatchJoinReq;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.UU.room.Room_Camp_StateUU;
	/**
	 * ...开始比赛的操作区
	 * @author ... dcl
	 */
	public class Handle_Start_StateUU extends StateUU
	{
		private var roomIdTxt:LabelUU;
		private var waitTxt:LabelUU;
		private var btn:ButtonUU;
		private var cardTxt:LabelUU;
		private var myCard:ButtonUU;
		private var myCardImg:BitmapLoaderUU;
		private var duanweiImg:BitmapLoaderUU;
		private var duanweiTitle:LabelUU;
		private var duanweiTxt:LabelUU;
		private var checkBox:CheckBoxUU;
		 
		private var isAutoStart:Boolean;   //是否自动开始
		private var isOwner:Boolean;       //是否自己为房主
		
		private var startTimer:Timer;
		private var startCount:int;
		private var ownerTimer:Timer;
		private var ownerCount:int;
		private var enterTimer:Timer;
		private var enterCount:int;
		public function Handle_Start_StateUU() 
		{
			
		}
		
		override public function onEnter():void 
		{
			
			var waitImg:BitmapLoaderUU;
			var txt:LabelUU;
			
			
			waitImg = new BitmapLoaderUU;
			waitImg.source = TResourceManager.getAsset("room/img/wait_prompt.png");
			this.fusion.addNode(waitImg);
			waitImg.x = 35;
			waitImg.y = 5;
			
			roomIdTxt = new LabelUU();
			roomIdTxt = TextUtil.createLabel6("",20,ColorUtil.WHITE,false,ColorUtil.BLACK,0);
			this.fusion.addNode(roomIdTxt);
			roomIdTxt.locatingNode = waitImg;
			roomIdTxt.locatingTypeForHoriz = LocatingType.L_A____L;
			roomIdTxt.locatingTypeForVerti = LocatingType.L___A___L;
			
			waitTxt = new LabelUU(TextFieldAutoSize.CENTER);
			waitTxt = TextUtil.createLabel6("正在等待其他玩家，请稍后。。。",20,0xdaaa77,true,ColorUtil.BLACK);
			this.fusion.addNode(waitTxt);
			waitTxt.locatingNode = waitImg;
			waitTxt.locatingTypeForHoriz = LocatingType.L___A___L;
			waitTxt.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			myCardImg = new BitmapLoaderUU;
			myCardImg.source = TResourceManager.getAsset("room/img/duanwei_bg.png");
			
			myCardImg.rotation = -180;
			myCardImg.scaleY = -1;
			
			
			this.fusion.addNode(myCardImg);
			myCardImg.locatingTypeForHoriz = LocatingType.F_A____F;
			myCardImg.locatingTypeForVerti = LocatingType.F____A_F;
			myCardImg.locatingOffsetX = 260;
			myCardImg.locatingOffsetY = -15;
			myCardImg.height = -120;
			
			//设置初始的套牌
			//GameModel.campIndex = CAMP_ID.CAMP_ID_SHANG;

			cardTxt = TextUtil.createLabel6("", 22, 0xffc38d, false, 0x0e0b08);
			cardTxt.locatingTypeForHoriz = LocatingType.L___A___L;
			cardTxt.locatingTypeForVerti = LocatingType.L_A____L;
			cardTxt.locatingOffsetX = -220;
			cardTxt.locatingOffsetY = 2;
			this.fusion.addNode(cardTxt);
			
			myCard = new ButtonUU(SkinNameConfig.create_room_btn);
			TextUtil.decorateLabel6(myCard.getLabel(),"我的套牌", 36, 0xffe2b9, false, 0x50310c, 3);
			this.fusion.addNode(myCard);
			//myCard.locatingNode = myCardImg;
			myCard.locatingTypeForHoriz = LocatingType.L___A___L;
			myCard.locatingTypeForVerti = LocatingType.L____L_A;
			myCard.locatingOffsetY = 5;
			myCard.locatingOffsetX = 5;
			myCard.addEventListener(ATouchEvent.CLICK, onMyCardClick);
			myCard.scaleY = 0.8;
			
			//txt = TextUtil.createLabel6("我的套牌", 36, 0xffe2b9, true, 0x50310c, 3);
			//txt.locatingTypeForHoriz = LocatingType.F___A___F;
			//txt.locatingTypeForVerti = LocatingType.F___A___F;
			//txt.locatingOffsetX = -20;
			//myCard.addNode(txt);
			
		
			duanweiImg = new BitmapLoaderUU;
			duanweiImg.source = TResourceManager.getAsset("room/img/duanwei_bg.png");
			this.fusion.addNode(duanweiImg);
			duanweiImg.locatingTypeForHoriz = LocatingType.F____A_F;
			duanweiImg.locatingTypeForVerti = LocatingType.F____A_F;
			duanweiImg.locatingOffsetX = -20;
			duanweiImg.locatingOffsetY = -15;
			duanweiImg.height = 120;
			
			//txt = new LabelUU();
			duanweiTitle = TextUtil.createLabel6("当前段位", 24, 0xffc38d, false, 0x0e0b08);
			
			duanweiTitle.locatingTypeForHoriz = LocatingType.L___A___L;
			duanweiTitle.locatingTypeForVerti = LocatingType.L_A____L;
			duanweiTitle.locatingOffsetY = 2;
			this.fusion.addNode(duanweiTitle);
			
			//cardTxt = new LabelUU;
			//cardTxt.text = "5";
			duanweiTxt = TextUtil.createLabel6(PlayerModel.getInstance().myRole.duanweiLevel(GameModel.gameMode), 50, 0xffe9c2, true, 0x410b06);
			duanweiTxt.locatingNode = duanweiImg;
			this.fusion.addNode(duanweiTxt);
			duanweiTxt.locatingTypeForHoriz = LocatingType.L___A___L;
			duanweiTxt.locatingTypeForVerti = LocatingType.L___A___L;
			duanweiTxt.locatingOffsetY = 10;
			
		
			
			btn = new ButtonUU();
			btn.skinName = SkinNameConfig.start_end_btn;
			btn.scaleX = 0.75;
			btn.scaleY = 0.75;
			TextUtil.decorateLabel6(btn.getLabel(), "", 36, 0xffe9b2, true, 0x371c02); 
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F___A___F;
			btn.locatingOffsetY = 15;
			
			btn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			//txt = new LabelUU();
			
			//btnTxt = TextUtil.createLabel6("", 50, 0xffe9c2, true, 0x410b06); 
			//btn.addNode(btnTxt);
			//btnTxt.locatingTypeForHoriz = LocatingType.F___A___F;
			//btnTxt.locatingTypeForVerti = LocatingType.F___A___F;
			//btnTxt.locatingOffsetX = -15;
			
	
			// 自动开始.
			checkBox = new CheckBoxUU(SkinNameConfig.room_checkbox_btn, true);
			this.fusion.addNode(checkBox);
			
			txt = TextUtil.createLabel6("自动开始", 20, 0xd8b99e, true, 0x1d0b00);
			checkBox.addNode(txt);
			checkBox.locatingOffsetX = 25
			checkBox.locatingTypeForHoriz = LocatingType.L____L_A
			checkBox.locatingTypeForVerti = LocatingType.F___A___F;
			checkBox.locatingOffsetY = 5;
			checkBox.addEventListener(AEvent.CHANGE,onCheckChange);
			
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			clearStartTime();
			clearOwnerTime();
			
			updateTxt();
			setMyCardVisible();
			updateMyCard();
			isAutoStart = false;
			checkBox.selected = isAutoStart;
			updateBtnType();
			
			enterTime();
			RoomModule.addEventListener(RoomEvent.Start_Room_State, onUpdateStartState);
			RoomModule.addEventListener(RoomEvent.Update_Room_Role, onUpdateInfo);
			RoomModule.addEventListener(RoomEvent.Camp_Change,onCampChange);
			RoomModule.addEventListener(RoomEvent.Owner_Start_Ntf,onOwnerStart);
			CardSetModule.addEventListener(CardSetEvent.Remove_Card_Bag,onCampChange);
		}
		
		private function onCheckChange(e:AEvent):void {
			isAutoStart = checkBox.selected;
			autoStart();
		}
		
		//private function onCampChange(evt:String,data:Object = null):void {
			//updateMyCard();
		//}
		
		private function setMyCardVisible():void {
			myCard.visible = myCardImg.visible = cardTxt.visible = RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_FREE || RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_PRACTICE;
			duanweiTitle.visible = duanweiImg.visible = duanweiTxt.visible = checkBox.visible = RoomModule.getRoomMode() != RoomModConfig.ROOM_MOD_PRACTICE;
			
			isOwner = RoomModule.getInstance().isRoomOwner(PlayerModel.getInstance().myRole.id);
			var btnStr:String = GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE || isOwner ? "开始" : "退出";
			btn.getLabel().text = btnStr;
			
			checkBox.visible = isOwner && GameModel.gameMode != RoomMod.ROOM_MOD_PRACTICE;
		}
		
		private function autoStart():void {
			 // 勾选了自动开始后，请求开始游戏
            if (RoomModConfig.curRoomMember == RoomModule.getInstance().getRoomMember && isAutoStart && isOwner)
            {
                //if (isCanStart)
                //{

					NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_START_MATCH_REQ,null);
                //}
            }
		}
		
		private function updateView():void {
			
		}
		
		private function updateTxt():void {
			roomIdTxt.text = "";
			if (GameModel.gameMode != RoomMod.ROOM_MOD_PRACTICE) {
				roomIdTxt.text = RoomModConfig.roomInfo ? "房间名：" + RoomModConfig.roomInfo.roomId : "";
			}
			switch(GameModel.gameMode) {
				case RoomMod.ROOM_MOD_PRACTICE:
					waitTxt.text = "提示：练习模式的对手都是随机的.";
				break;
				default:
					waitTxt.text = "正在等待其他玩家，请稍候。。。";
				break;
			}
			waitTxt.color = 0xdaaa77;
		}
		
		private function onUpdateInfo(e:RoomEvent):void {
			setMyCardVisible();
			updateBtnType();
		}
		
		private function onCampChange(e:RoomEvent):void {
			updateMyCard();
		}
		
		private function onUpdateStartState(e:RoomEvent):void {
			
			clearStartTime();
			startCount = 6;
			startTimer = new Timer(1000, 0);
			RoomModConfig.isStartState = true;
			waitTxt.text = "";
			updateBtnType();
			onUpdateTime(null);
			startTimer.addEventListener(TimerEvent.TIMER, onUpdateTime);
			startTimer.start();
			
		}
		
		private function onUpdateTime(evt:TimerEvent ):void {
			if (startCount == 0) {
				clearStartTime();
				updateTxt();
				return;
			}
			startCount --;
			waitTxt.text = "开始倒计时：" + startCount.toString() + "...";
			waitTxt.color = ColorUtil.RED;
		}
		
		private function onOwnerStart(e:RoomEvent):void {
			
			// 勾选了自动开始后，请求开始游戏
            if (RoomModConfig.curRoomMember == RoomModule.getInstance().getRoomMember && isAutoStart && isOwner)
            {
				NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_START_MATCH_REQ,null);
				return;
            }
			clearOwnerTime();
			ownerCount = 21;
			ownerTimer = new Timer(1000, 0);
			//RoomModConfig.isStartState = true;
			waitTxt.text = "";
			updateBtnType();
			onUpdateOwnerTime(null);
			ownerTimer.addEventListener(TimerEvent.TIMER, onUpdateOwnerTime);
			ownerTimer.start();
		}
		
		private function onUpdateOwnerTime(evt:TimerEvent ):void {
			if (ownerCount == 0 || RoomModConfig.isStartState) {
				clearOwnerTime();
				updateTxt();
				return;
			}
			ownerCount --;
			waitTxt.text = "请房主在 " + ownerCount.toString() + "秒内开始游戏，否则将被踢出房间...";
			waitTxt.color = ColorUtil.RED;
		}
		
		private function enterTime():void {
			
			clearEnterTime();
			enterCount = 61;
			RoomModConfig.enterRoomTime = 61;
			enterTimer = new Timer(1000, 0);
			onUpdateEnterTime(null);
			enterTimer.addEventListener(TimerEvent.TIMER, onUpdateEnterTime);
			enterTimer.start();
			
		}
		
		private function onUpdateEnterTime(evt:TimerEvent ):void {
			if (enterCount == 0) {
				clearEnterTime();
				return;
			}
			enterCount --;
			RoomModConfig.enterRoomTime --;
		}
		
		
		private function updateMyCard():void {
			//GameModel.campIndex = GameModel.campIndex == 0 ? CAMP_ID.CAMP_ID_SHANG : GameModel.campIndex;
			//cardTxt.text = getCampText(GameModel.campIndex );
			//为null 则为第一次进房间  则默认为卡包索引为0的卡包
			if (GameModel.campBag == null) {
				GameModel.campBag  = CardSetModule.getCardBgByIndex(0);
			}
			cardTxt.text = GameModel.campBag.name;
		}
		
		private function updateBtnType():void {
			btn.touchable = RoomModConfig.curRoomMember == RoomModule.getInstance().getRoomMember && !RoomModConfig.isStartState;
			if (GameModel.gameMode == RoomModConfig.ROOM_MOD_PRACTICE) btn.touchable = true;
		}
		
		private function onMyCardClick(e:ATouchEvent):void {
			UUFacade.getWindow(Room_Camp_StateUU).activate([RoomMod.ROOM_MOD_PRACTICE]);
		}
		
		
		private function onBtnClick(e:ATouchEvent): void {
			if (RoomModule.getInstance().isRoomOwner(PlayerModel.getInstance().myRole.id)) {
				if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) {
					//发送直接开始比赛请求
                        var matchJoinReq:MatchJoinReq = new MatchJoinReq();
                        matchJoinReq.campId = GameModel.campBag.campId;
						matchJoinReq.mod = GameModel.gameMode;
                        matchJoinReq.bagIndex =  GameModel.campBag.bagIndex;
                        matchJoinReq.useBagCard = true;
						NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_MATCH_JOIN_REQ,matchJoinReq);
				}else {
					if (RoomModConfig.curRoomMember == RoomModule.getInstance().getRoomMember) {
						// 发送开始游戏请求
						clearOwnerTime();
						NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_START_MATCH_REQ,null);
					}else {
						GameModel.getLog().simplify("房间人员不足，不能开始游戏,还差[{0}]", RoomModule.getInstance().getRoomMember -  RoomModConfig.curRoomMember);
					}
				}
			}else {
				if (enterCount > 0) {
					RoomModule.dealRoomError("进入房间未满1分钟，禁止退出！还剩"+enterCount+"秒");
					return;
				}
				
				
				NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_QUIT_REQ, null);
				//clearStartTime();
				//clearOwnerTime();
				//clearEnterTime();
			}
		}
		
		//private function getCampText(campId:int):String {
			//var str:String ="";
			//switch(campId) {
				//case CAMP_ID.CAMP_ID_SHANG:
					//str = "商国套牌";
					//break;
				//case CAMP_ID.CAMP_ID_ZHOU:
					//str = "周国套牌";
					//break;
				//case CAMP_ID.CAMP_ID_YAO:
					//str = "妖族套牌";
					//break;
				//case CAMP_ID.CAMP_ID_WU:
					//str = "巫族套牌";
					//break;
			//}
			//return str;
		//}
		
		private function clearStartTime():void {
			if (startTimer != null) {
				startTimer.removeEventListener(TimerEvent.TIMER, onUpdateTime);
				startTimer.stop();
				startTimer = null;
				
			}
			
		}
		private function clearOwnerTime():void {
			if (ownerTimer != null) {
				ownerTimer.removeEventListener(TimerEvent.TIMER, onOwnerStart);
				ownerTimer.stop();
				ownerTimer = null;
			}
		}
		
		private function clearEnterTime():void {
			if (enterTimer != null) {
				enterTimer.removeEventListener(TimerEvent.TIMER, onUpdateEnterTime);
				enterTimer.stop();
				enterTimer = null;
			}
			RoomModConfig.enterRoomTime = 0;
		}
		
		override public function onExit():void 
		{
			super.onExit();
			clearStartTime();
			clearOwnerTime();
			clearEnterTime();
			RoomModConfig.isStartState = false;
			//EventManager.ins.removeEvtListener(EventConfig.Start_Room_State,onUpdateStartState);
			RoomModule.removeEventListener(EventConfig.Start_Room_State,onUpdateStartState);
			RoomModule.removeEventListener(RoomEvent.Update_Room_Role, onUpdateInfo);
			RoomModule.removeEventListener(RoomEvent.Camp_Change, onCampChange);
			RoomModule.removeEventListener(RoomEvent.Owner_Start_Ntf,onOwnerStart);
			CardSetModule.removeEventListener(CardSetEvent.Remove_Card_Bag,onCampChange);
		}
	}

}