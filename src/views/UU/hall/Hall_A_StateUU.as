package views.UU.hall 
{
	import com.netease.protobuf.Int64;
	import configs.ConfigNet;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import flash.events.TimerEvent;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import models.events.TimeEvent;
	import models.fangchenmi.FangChenMiEvent;
	import models.fangchenmi.FangChenMiModule;
	import models.GameModel;
	import models.player.PlayerModel;
	import net.NetManager;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.project.ViewFacade;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import utils.TextUtil;
	import utils.TimeUtil;
	import views.Login_StateVV;
	import views.UU.cg.CG_StateUU;
	import views.UU.fangchenmi.FangChenMi_StateUU;
	import views.UU.hall.tabs.Tab_Exercise_StateUU;
	import views.UU.hall.tabs.Tab_Single_StateUU;
	import views.UU.hall.tabs.Tab_Multiple_StateUU;
	import views.UU.hall.tabs.Tab_Match_StateUU;
	import views.UU.login.Login_Bg_StateUU;
	import views.UU.login.Login_UserInput_StateUU;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	
	import proto.com.RoomMod;
	
	import views.Room_StateVV;
	
public class Hall_A_StateUU extends StateUU {
	

	private var practiseMode:RadioUU;
	private var freeMode:RadioUU;
	private var arenaMode:RadioUU;
	private var breakMode:RadioUU;
	
	private var fangchenmiLabel:LabelUU;
	private var fangchenmiImg:ImageLoaderUU;
	private var fangchenmiShowTime:Timer;
	private var fangchenmiHover:Boolean;
	override public function onEnter():void {
		var btn:ButtonUU;
		var img:BitmapLoaderUU;
		var radio:RadioUU;
		var i:int;
		var l:int;
		
		//this.fusion.spaceWidth = this.fusion.root.spaceWidth;
		//this.fusion.spaceHeight = this.fusion.root.spaceHeight;
		this.fusion.spaceWidth = Agony.getAdapter().rootWidth;
		this.fusion.spaceHeight = Agony.getAdapter().rootHeight;
		
		
		_radioGroup = new RadioGroupUU;
		
		
		// Bg.
		img = new BitmapLoaderUU;
		//img.source = TResourceManager.getAsset("temp/bg/hall_bg.jpg");
		img.source = TResourceManager.getAsset("temp/bg/bg.png");
		this.fusion.addNode(img);
		
		
		// 練習.
		practiseMode = new RadioUU;
		practiseMode.skinName = "hall_radio";
		this.fusion.addNode(practiseMode);
		practiseMode.x = 90;
		practiseMode.y = 60;
		practiseMode.userData = RoomModConfig.ROOM_MOD_PRACTICE;
		practiseMode.group = _radioGroup;
		
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("hall/img/exercise_A.png");
		practiseMode.addNode(img);
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		
		
		// 集换.
		freeMode = new RadioUU;
		freeMode.skinName = "hall_radio";
		this.fusion.addNode(freeMode);
		freeMode.x = 90;
		freeMode.locatingTypeForVerti = LocatingType.L____L_A;
		freeMode.locatingOffsetY = 30;
		freeMode.userData = RoomModConfig.ROOM_MOD_FREE;
		freeMode.group = _radioGroup;
		
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("hall/img/free_A.png");
		freeMode.addNode(img);
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		
		// 竞技.
		arenaMode = new RadioUU;
		arenaMode.skinName = "hall_radio";
		this.fusion.addNode(arenaMode);
		arenaMode.x = 90;
		arenaMode.locatingTypeForVerti = LocatingType.L____L_A;
		arenaMode.locatingOffsetY = 30;
		arenaMode.userData = RoomModConfig.ROOM_MOD_ARENA;
		arenaMode.group = _radioGroup;
		
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("hall/img/match_A.png");
		arenaMode.addNode(img);
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		
		// 闯关.
		breakMode = new RadioUU;
		breakMode.skinName = "hall_radio";
		this.fusion.addNode(breakMode);
		breakMode.x = 90;
		breakMode.locatingTypeForVerti = LocatingType.L____L_A;
		breakMode.locatingOffsetY = 30;
		breakMode.userData = RoomModConfig.ROOM_MOD_BREAK;
		breakMode.group = _radioGroup;
		
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("hall/img/break_A.png");
		breakMode.addNode(img);
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		
		this._radioGroup.addEventListener(AEvent.CHANGE, onModeChanged);
		
		
		
		// Tab狀態視圖.
		_stateFusion = new StateFusionUU;
		this.fusion.addNode(_stateFusion);
		this._stateFusion.spaceWidth = Agony.getAdapter().rootWidth;
		this._stateFusion.spaceHeight = Agony.getAdapter().rootHeight;
		
		
		
		// 視圖初期化.
		this._radioGroup.selectedIndex = 0;
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		onResize(null);
		
		
		
		if(PlayerModel.getInstance().myRole.getTotalLevel < 3) // 解锁自由模式
        {
			freeMode.touchable = false;
        }
        if (PlayerModel.getInstance().myRole.getTotalLevel < 4) // 解锁竞技模式
        {
			arenaMode.touchable = false;
        }
		breakMode.touchable = false;
		
		//退出重新登录
		var backBtn:ButtonUU = new ButtonUU;
		backBtn.skinName = SkinNameConfig.back_btn;
		this.fusion.addNode(backBtn);
		backBtn.locatingTypeForHoriz = LocatingType.F____A_F;
		backBtn.locatingTypeForVerti = LocatingType.F____A_F;
		backBtn.locatingOffsetX = -50;
		backBtn.locatingOffsetY = -50;
		backBtn.addEventListener(ATouchEvent.CLICK,onBack);
		
		//播放cg
		var playBtn:ButtonUU = new ButtonUU;
		playBtn.skinName = SkinNameConfig.play_btn;
		this.fusion.addNode(playBtn);
		playBtn.locatingTypeForHoriz = LocatingType.A_L____L;
		playBtn.locatingTypeForVerti = LocatingType.L___A___L;
		playBtn.locatingOffsetX = -50;
		playBtn.addEventListener(ATouchEvent.CLICK,onPlay);
		
		fangchenmiImg = new ImageLoaderUU;
		fangchenmiImg.source = TResourceManager.getAsset("common/img/fangchenmi.png");
		this.fusion.addNode(fangchenmiImg);
		fangchenmiImg.locatingTypeForHoriz = LocatingType.F___A___F;
		fangchenmiImg.locatingTypeForVerti = LocatingType.F_A____F;
		fangchenmiImg.locatingOffsetX = -100;
		fangchenmiImg.locatingOffsetY = 70;
		fangchenmiImg.addEventListener(ATouchEvent.CLICK,onFangchenmiClick);
		fangchenmiImg.addEventListener(ATouchEvent.HOVER,onFangchenmiHover);
		fangchenmiImg.addEventListener(ATouchEvent.LEAVING,onFangchenmiLeaving);
		
		fangchenmiLabel = TextUtil.createLabel6("", 20, 0xffb244, true, 0x24100, 2, TextFieldAutoSize.NONE);
		this.fusion.addNode(fangchenmiLabel);
		fangchenmiLabel.locatingTypeForHoriz = LocatingType.L____L_A;
		fangchenmiLabel.locatingTypeForVerti = LocatingType.L___A___L;
		fangchenmiLabel.locatingOffsetX = 10;
		fangchenmiLabel.width = 450;
		fangchenmiLabel.height = 80;
		fangchenmiLabel.wordWrap = true;
		
		requstBattleParams();
		onUpdateFangchenmi(null);
		updateFangchenmi(!FangChenMiModule.isVarificate);
	}
		
	//请求参数数据
	private function requstBattleParams():void {
		NetManager.sendRequest(CmdType.CT_BATTLE,CmdCodeBattle.CC_BATTLE_GET_PARAM_REQ,null);
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
	
	
	private var _radioGroup:RadioGroupUU;
	private var _stateFusion:StateFusionUU;
	
	
	
	private function onModeChanged(e:AEvent):void {
		var radio:RadioUU;
		radio = _radioGroup.selectedRadio;
		for (var i:int = 0 ; i < _radioGroup.numRadios;i++ ) 
		{
			setRadioStatus(_radioGroup.getRadioAt(i),false);
		}
		setRadioStatus(radio,true);
	}
	
	private function selectRadio(radio:RadioUU):void {
		
	}
	
	private function setRadioStatus(radio:RadioUU, isSelect:Boolean):void {
		var path:String;
		switch(int(radio.userData)) {
			case RoomModConfig.ROOM_MOD_PRACTICE:
				path = isSelect ? "hall/img/exercise_B.png" : "hall/img/exercise_A.png";
				if(isSelect) _stateFusion.setState(Tab_Exercise_StateUU);
				break;
				
			case RoomModConfig.ROOM_MOD_FREE:
				path = isSelect ? "hall/img/free_B.png" : "hall/img/free_A.png";
				if(isSelect) _stateFusion.setState(Tab_Single_StateUU);
				break;
				
			case RoomModConfig.ROOM_MOD_ARENA:
				path = isSelect ? "hall/img/match_B.png" : "hall/img/match_A.png";
				if(isSelect) _stateFusion.setState(Tab_Multiple_StateUU);
				break;
				
			case RoomModConfig.ROOM_MOD_BREAK:
				path = isSelect ? "hall/img/break_B.png" : "hall/img/break_A.png";
				if(isSelect) _stateFusion.setState(Tab_Match_StateUU);
				break;
			default:
				break;
		}
		var img:BitmapLoaderUU = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset(path);	
		radio.removeNode(radio.getNodeAt(1));
		radio.addNode(img);
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		radio.x = isSelect ? 60 : 90;
	}
	
	//返回
	private function onBack(e:ATouchEvent):void {
		closeConnect();
	}
	
	private function onPlay(e:ATouchEvent):void {
		UUFacade.getWindow(Hall_A_StateUU).close();
		UUFacade.getWindow(CG_StateUU).activate();
	}
	
		
	//断开连接
	private function closeConnect():void {
			//NetManager.connect("192.168.4.195", 8843);
			//NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected1);
			// 網路管.
		NetManager.connect(ConfigNet.ip, ConfigNet.port);
			// (連接完畢) -> 偵聽器...
		NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected2);
	}
		
	/**
	 * 登陸遊戲.
	 */
	public static function ____onNetConnected2(e:AEvent):void{
		NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected2);
		GameModel.getLog().simplify("客戶端再次登陸.");
		UUFacade.getWindow(Hall_A_StateUU).close();
		UUFacade.getWindow(Login_Bg_StateUU).activate();
		UUFacade.getWindow(Login_UserInput_StateUU).activate();
	}
	
	override public function onExit():void {
		TimeUtil.removeEventListener(TimeEvent.Timer_Handler_Event, onUpdateTime);
		FangChenMiModule.removeEventListener(FangChenMiEvent.Update_FanChenMi_Info, onUpdateFangchenmi);
	}
	
	private function onResize(e:NodeEvent):void {
			//img.width = this.fusion.root.spaceWidth;
			//img.height = this.fusion.root.spaceHeight;
			
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;	
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		
	}
}

}