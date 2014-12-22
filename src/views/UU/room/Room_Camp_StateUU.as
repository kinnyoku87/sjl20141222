package views.UU.room 
{
	import configs.EventConfig;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import event.EventManager;
	import flash.display.InteractiveObject;
	import models.cardSet.CardSetModule;
	import models.GameModel;
	import models.room.RoomEvent;
	import models.room.RoomModule;
	import net.NetManager;
	import net.responses.RoomResponsor;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import proto.com.CampBattleCard;
	import proto.com.RoomMod;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.SelectCampReq;
	import ui.ShildStateUU;
	import utils.TextUtil;
	import views.UU.room.items.Room_CampUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Room_Camp_StateUU extends ShildStateUU
	{
		
		//private var _curCamp:Room_CampUU;
		//private var campGroup:RadioGroupUU;
		
		public function Room_Camp_StateUU() 
		{
			NAME =  "选择套牌";
		}
		
		override public function onEnter():void {
			super.onEnter();
			var bgImg:Scale9BitmapUU;
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 1000;
			bgImg.height = 700;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;

			this.fusion.addNode(title);
			this.fusion.addNode(closeBtn);
			
			var roomCamp:Room_CampUU;
			var i:int = 0;
			var len:int = CardSetModule.cardBagNum;
			while(i<len){
				roomCamp = new Room_CampUU(i);
				this.fusion.addNode(roomCamp);
				roomCamp.locatingTypeForHoriz = LocatingType.F_A____F;
				roomCamp.locatingTypeForVerti = LocatingType.F_A____F;
				roomCamp.locatingOffsetX = 50 + 220 * (i % 4);
				roomCamp.locatingOffsetY = 100 + 20 * int(i / 4);
				roomCamp.addEventListener(ATouchEvent.CLICK, onCampClick);
				i++;
			}
			addRootEvent();
		}
		
		// 選擇種族.
		private function onCampClick(e:ATouchEvent):void {
			var camp:CampBattleCard =  e.target.userData as CampBattleCard;
			//if (GameModel.campBagIndex ==  camp.campId) return;  
			
			if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) {
				GameModel.campBag = camp;
				RoomModule.dispatchEvent(RoomEvent.Camp_Change);
				closeClick(e);
				return;
			}
			
			GameModel.campBag = camp;
			var selectCampReq:SelectCampReq = new SelectCampReq();
			selectCampReq.campId = GameModel.campBag.campId;
			selectCampReq.bagIndex = GameModel.campBag.bagIndex;
			selectCampReq.useBagCard = true;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_SELECT_CAMP_REQ, selectCampReq);
			closeClick(e);
		}
		
		//关闭 取消点击
		override protected function closeClick(e:ATouchEvent):void {
			UUFacade.getWindow(Room_Camp_StateUU).close();
			
		}
		
		override public function onExit():void {
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
	}

}