package views.UU.room.states 
{
	import com.greensock.TweenMax;
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.UInt64;
	import configs.EventConfig;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import event.EventManager;
	import flash.filters.GlowFilter;
	import flash.text.TextFieldAutoSize;
	import flash.utils.clearInterval;
	import flash.utils.clearTimeout;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import models.GameModel;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomItemPage;
	import models.room.RoomModule;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.FindRoomReq;
	import proto.cs.FindRoomRes;
	import ui.DataProvider;
	import ui.ItemView;
	import ui.ListUU2;
	import ui.PageUU;
	import utils.TextUtil;
	import views.UU.room.items.Room_ItemUU;
	/**
	 * ...房间列表块
	 * @author ... dcl
	 */
	public class Room_List_StateUU extends StateUU
	{
		
		public function Room_List_StateUU() 
		{
			
		}
		
		private var tabGroup:RadioGroupUU;
		private var list:ListUU2;
		//private var page:PageUU;
		private var input:TextInputUU;
		private var curPage:int = 1;
		private var maxPage:int;
		private var lPageBtn:ButtonUU;
		private var rPageBtn:ButtonUU;
		private var pageLabel:LabelUU;
		private var roomArr:Array;
		private var maxRow:int = 6;
		private var selectedItemIndex:int;
		private var lastItemIndex:uint;      //上次选中的tab 
		private var itemArr:Array;
		
		private var showAllBtn:ButtonUU;
		private var freshTime:uint; //计时器

		
		private var gamingCheck:CheckBoxUU;
		private var handleTxt:LabelUU;    //操作标题
		override public function onEnter():void 
		{
			var btn:RadioUU;
			var img:Scale9MultiBitmapsUU;
			var searchBtn:ButtonUU;
			
			var titleTxt:LabelUU;
			
			
			
			tabGroup = new RadioGroupUU();
			// 初级
			btn = new RadioUU(SkinNameConfig.tab_horizon_btn);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F_A____F;
			btn.locatingTypeForVerti = LocatingType.F_A____F;
			btn.locatingOffsetX = 30;
			btn.locatingOffsetY = -5;
			btn.image.width = 100 ;
			btn.image.height = 42 ;
			trace("========================================"+btn.image.width);
			trace("========================================"+btn.image.height);
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xffd695, true,2).text = "初级";
			btn.group = tabGroup;
			btn.scaleY = 0.9;
			
			// 中级
			btn = new RadioUU(SkinNameConfig.tab_horizon_btn);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L____L_A;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = 5;
			//btn.locatingOffsetY = -5;
			btn.image.width = 100 ;
			btn.image.height = 42 ;
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xffd695, true,2).text = "中级";
			btn.group = tabGroup;
			btn.scaleY = 0.9;
			
			// 高级
			btn = new RadioUU(SkinNameConfig.tab_horizon_btn);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.L____L_A;
			btn.locatingTypeForVerti = LocatingType.L___A___L;
			btn.locatingOffsetX = 5;
			//btn.locatingOffsetY = -5;
			btn.image.width = 100 ;
			btn.image.height = 42 ;
			TextUtil.decorateLabel(btn.getLabel(), 22, 0xffd695, true,2).text = "高级";
			btn.group = tabGroup;
			btn.scaleY = 0.9;
			

			
			
			
			titleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(titleTxt);
			titleTxt.locatingTypeForHoriz = LocatingType.F_A____F;
			titleTxt.locatingTypeForVerti = LocatingType.L____L_A;
			titleTxt.locatingOffsetX = 25;
			titleTxt.locatingOffsetY = 0;
			this.fusion.addNode(titleTxt);
			titleTxt.text = "房间号";
			
			titleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(titleTxt);
			titleTxt.locatingTypeForHoriz = LocatingType.L____L_A;
			titleTxt.locatingTypeForVerti = LocatingType.L___A___L;
			titleTxt.locatingOffsetX = 85;
			this.fusion.addNode(titleTxt);
			titleTxt.text = "人数";
			
			titleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(titleTxt);
			titleTxt.locatingTypeForHoriz = LocatingType.L____L_A;
			titleTxt.locatingTypeForVerti = LocatingType.L___A___L;
			titleTxt.locatingOffsetX = 80;
			this.fusion.addNode(titleTxt);
			titleTxt.text = "时间";
			
			titleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(titleTxt);
			titleTxt.locatingTypeForHoriz = LocatingType.L____L_A;
			titleTxt.locatingTypeForVerti = LocatingType.L___A___L;
			titleTxt.locatingOffsetX = 100;
			this.fusion.addNode(titleTxt);
			titleTxt.text = "设定";
			
			titleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(titleTxt);
			titleTxt.locatingTypeForHoriz = LocatingType.L____L_A;
			titleTxt.locatingTypeForVerti = LocatingType.L___A___L;
			titleTxt.locatingOffsetX = 100;
			this.fusion.addNode(titleTxt);
			titleTxt.text = "状态";
			
			handleTxt = new LabelUU(TextFieldAutoSize.CENTER);
			setTxtFormat(handleTxt);
			handleTxt.locatingTypeForHoriz = LocatingType.L____L_A;
			handleTxt.locatingTypeForVerti = LocatingType.L___A___L;
			handleTxt.locatingOffsetX = 110;
			this.fusion.addNode(handleTxt);
			handleTxt.text = "操作";
			handleTxt.visible = true;
			//竞技场模式不显示
			if (RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_ARENA) {
				handleTxt.visible = false;
			}
			
			list = new ListUU2(Room_ItemUU);
			list.rowCount = maxRow;
			this.fusion.addNode(list);
			list.paddingTop = 5;
			list.itemGap = 10;
			//if (!firstListCache) {
				//firstListCache = list;
			//}
			//
			list.locatingTypeForVerti = LocatingType.L____L_A;
			RoomModConfig.roomListInit = true;
			//roomArr = [];
			//itemArr = [];
			
			//查找背景条
			img = new Scale9MultiBitmapsUU;	
			img.skinName = SkinNameConfig.search_bg_scale9;
			this.fusion.addNode(img);
			img.width = 250;
			img.height = 30;
			img.locatingTypeForHoriz = LocatingType.F____A_F;
			img.locatingTypeForVerti = LocatingType.F_A____F;
			img.locatingOffsetX = -30;
			img.locatingOffsetY = 5;
			
			//查找输入框
			input = new TextInputUU(false);
			this.fusion.addNode(input);
			input.locatingTypeForHoriz = LocatingType.L_A____L;
			input.locatingTypeForVerti = LocatingType.L___A___L;
			input.width = 250;
			input.height = 30;
			input.color = 0x4a3727;
			input.size = 22;
			input.maxChars = 22;
			input.font = TextUtil.FONT_A;
			input.text = "请输入房间号查找";
			input.restrict = "0-9";
			input.addEventListener(NodeEvent.FOCUS_IN, onFocus)
			input.addEventListener(NodeEvent.FOCUS_OUT, onFocus)
			
			searchBtn = new ButtonUU(SkinNameConfig.search_btn);
			this.fusion.addNode(searchBtn);
			searchBtn.locatingTypeForHoriz = LocatingType.L____A_L;
			searchBtn.locatingTypeForVerti = LocatingType.L___A___L;
			searchBtn.locatingOffsetX = -10;
			searchBtn.addEventListener(ATouchEvent.CLICK,onSearchClick);
			
			
			//page = new PageUU(TextUtil.createLabel6("", 22, 0xffe2b9, false, 0x371c02,2,null,10),SkinNameConfig.lPage_room_btn, SkinNameConfig.rPage_room_btn);
			//page.textStyle = "currentPage";
			//page.style = [-15,-2,10,5];
			//this.fusion.addNode(page);
			//page.locatingTypeForHoriz = LocatingType.F___A___F;
			//page.locatingTypeForVerti = LocatingType.F____A_F;
			//page.locatingOffsetX = -50;
			//page.locatingOffsetY = -10;
			addEvents();
			
			//翻页
			pageLabel = TextUtil.createLabel6("", 22, 0xffe2b9, false, 0x371c02, 2,TextFieldAutoSize.CENTER, null, 10);
			pageLabel.text = "第" + curPage + "页";
			pageLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			pageLabel.locatingTypeForVerti = LocatingType.F____A_F;
			pageLabel.locatingOffsetY = -15;
			this.fusion.addNode(pageLabel);
			lPageBtn = new ButtonUU(SkinNameConfig.lPage_room_btn);
			this.fusion.addNode(lPageBtn);
			lPageBtn.locatingTypeForHoriz = LocatingType.A_L____L;
			lPageBtn.locatingTypeForVerti = LocatingType.L___A___L;
			lPageBtn.locatingOffsetX = -15;
			lPageBtn.locatingOffsetY = -2;
			rPageBtn = new ButtonUU(SkinNameConfig.rPage_room_btn);
			this.fusion.addNode(rPageBtn);
			rPageBtn.locatingNode = pageLabel;
			rPageBtn.locatingTypeForHoriz = LocatingType.L____L_A;
			rPageBtn.locatingTypeForVerti = LocatingType.L___A___L;
			rPageBtn.locatingOffsetX = 10;
			rPageBtn.locatingOffsetY = 5;
			lPageBtn.addEventListener(ATouchEvent.CLICK,onPageChange);
			rPageBtn.addEventListener(ATouchEvent.CLICK, onPageChange);
			
			
			
			
			showAllBtn = new ButtonUU(SkinNameConfig.show_allroom_btn);
			TextUtil.decorateLabel6(showAllBtn.getLabel(), "显示全部房间", 20, 0xffe2b9, true, 0x371c02);
			this.fusion.addNode(showAllBtn);
			showAllBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			showAllBtn.locatingTypeForVerti = LocatingType.F___A___F;
			showAllBtn.addEventListener(ATouchEvent.CLICK, OnShowRoomClick);
			showAllBtn.visible = false;
			
			// 自动开始.
			gamingCheck = new CheckBoxUU(SkinNameConfig.room_checkbox_btn, RoomModConfig.isGamingCheck);
			this.fusion.addNode(gamingCheck);
			
			var txt:LabelUU = TextUtil.createLabel6("显示游戏中的房间", 22, ColorUtil.rgb(255,226,122), false, ColorUtil.BLACK,1);
			gamingCheck.addNode(txt);
			txt.locatingTypeForHoriz = LocatingType.L____L_A;
			txt.locatingTypeForVerti = LocatingType.F___A___F;
			txt.locatingOffsetX = 5;
			gamingCheck.locatingTypeForHoriz = LocatingType.F____A_F;
			gamingCheck.locatingTypeForVerti = LocatingType.F____A_F;
			gamingCheck.locatingOffsetY = -15;
			gamingCheck.locatingOffsetX = -70;
			gamingCheck.addEventListener(AEvent.CHANGE,onCheckChange);
		}
		
		private function onCheckChange(evt:AEvent):void {
			RoomModConfig.isGamingCheck = gamingCheck.selected;
			findRoomReq();
		}

		private function  addEvents():void {
			if (RoomModule.getRoomMode() != RoomModConfig.ROOM_MOD_PRACTICE) {
				freshTime = setInterval(findRoomReq,5000);
			}
			//EventManager.ins.addEvtListener(EventConfig.Get_Room_Item_List, onRoomList);
			
			RoomModule.addEventListener(RoomEvent.Get_Room_Item_List, onRoomList);
			tabGroup.addEventListener(AEvent.CHANGE, onRadioChanged);
			
			
			
			tabGroup.selectedIndex = getDuanLevel();
			lastItemIndex = tabGroup.selectedIndex;
		}
		
		private function removeEvents():void {
			if (RoomModule.getRoomMode() != RoomModConfig.ROOM_MOD_PRACTICE) {
				clearInterval(freshTime);
			}
			//EventManager.ins.removeEvtListener(EventConfig.Get_Room_Item_List, onRoomList);
			RoomModule.removeEventListener(RoomEvent.Get_Room_Item_List, onRoomList);

			tabGroup.removeEventListener(AEvent.CHANGE, onRadioChanged);
		}
		
		private var findRoomRes:FindRoomRes;
		private function onRoomList(evt:RoomEvent):void {
			findRoomRes = evt.data as  FindRoomRes;
			updateList();
		}
		
		private function updateList():void {

			if (list == null) {
				return;
			}
			list.dataProvide = RoomModule.getInstance().getRoomList(RoomModConfig.isGamingCheck,findRoomRes.roomBaseInfo);
			maxPage = curPage;
			if (list.dataProvide.length > maxRow) {
				maxPage = curPage + 1;
			}
			pageLabel.text = "第" + curPage + "页";
		}
		
		//点击查询
		private function onSearchClick(e:ATouchEvent):void {
			var searchTxt:String = input.text;
			if (searchTxt == "请输入房间号查找"  || searchTxt == "" || int(searchTxt) == 0) {
				return;
			}
			if (freshTime != 0) {
				clearInterval(freshTime);
			}
			searchRoom(searchTxt);
			//freshTime = setInterval(searchRoom, 5000, searchTxt);
			showAllBtn.visible = true;
			gamingCheck.visible = false;
		}
		
		//点击显示所有房间
        private function OnShowRoomClick(e:ATouchEvent):void
        {
            if (freshTime != 0)
            {
				clearInterval(freshTime);
            }
			findRoomReq();
			freshTime = setInterval(findRoomReq, 5000);
			showAllBtn.visible = false;
			gamingCheck.visible = true;
			input.text = "请输入房间号查找";
        }
		
		//搜索查询
		private function searchRoom(_searchTxt:String):void {
			var msg:FindRoomReq = new FindRoomReq();
			msg.offset = curPage - 1;
			msg.roomCount = maxRow;
			msg.mod = GameModel.gameMode;
			msg.stage = RoomModConfig.curStage;
			//msg.isAbsence = true;
			msg.roomId = Int64.parseInt64(_searchTxt);
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_FIND_REQ, msg);
		}
		
		//翻页
		private function onPageChange(e:AEvent):void {
			
			if (e.target == lPageBtn) {
				curPage--;
                if(curPage <= 0)
                {
                    curPage = maxPage;
                }
			}else {
				curPage++;
				if (curPage > maxPage) {
					curPage = 1;
				}
			}
			findRoomReq();
		}
		
		//普通查询
		private function findRoomReq():void {
			var msg:FindRoomReq = new FindRoomReq();
			msg.offset = curPage - 1;
			msg.roomCount = maxRow;
			msg.mod = GameModel.gameMode;
			msg.stage = RoomModConfig.curStage;
			//msg.isAbsence = true;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_FIND_REQ, msg);
		}
		
		//获取当前在哪个段位段    初级，中级，高级
		private function getDuanLevel():int {
			var duanLevel:int = PlayerModel.getInstance().myRole.duanweiLevel(GameModel.gameMode);
			var level:int = 0;
			if (duanLevel >= 1 && duanLevel <= 9) 
			{
				level = 0;
			}else if(duanLevel >= 10 && duanLevel <= 19) {
				level = 1;
			}else if (duanLevel >= 20) {
				level = 2;
			}
			return level;
		}
		
		private function onRadioChanged(e:AEvent):void {
			//page.currentPage = 1;
			var level:int = getDuanLevel();
			if (tabGroup.selectedIndex > level) {
				RoomModule.dispatchEvent(RoomEvent.Deal_Room_Error,getPromptStr(tabGroup.selectedIndex));
				tabGroup.selectedIndex = lastItemIndex;
				return;
			}
			curPage = 1;
			RoomModConfig.curStage = tabGroup.selectedIndex + 1;
			findRoomReq();
		}
		
		private function getPromptStr(level:int):String {
			var str:String = "";
			switch(level) {
				case 0:
					str = "段位等级 1-9 的人才可进入";
				break;
				case 1:
					str = "段位等级 10-30 的人才可进入";
				break;
				case 2:
					str = "段位等级 20-30 的人才可进入";
				break;
			}
			return str;
		}
		
		public function setTxtFormat(label:LabelUU):void {		
			label.font = TextUtil.FONT_A;
			label.color = 0xafffab7;
			label.size = 20;
			label.filters = [new GlowFilter(ColorUtil.BLACK, 1, 2, 2, 22)];
			label.letterSpacing = 1;
			label.bold = true;
			label.touchable = false;
		}
		
		public function onFocus(e:NodeEvent):void 
		{
			if (e.type == NodeEvent.FOCUS_IN) {
				if (input.text == "请输入房间号查找") {
					input.text = "";
				}
			}else if(e.type == NodeEvent.FOCUS_OUT){
				if (input.text == "") {
					input.text = "请输入房间号查找";
				}
			}
		}
		
		override public function onExit():void 
		{
			//super.onExit();			
			//list.doDispose();
			
			list = null;
			removeEvents();
		}
	}

}