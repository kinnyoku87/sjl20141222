package views.UU.room.items 
{
	import configs.create.RoleCreateConfigurator;
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import models.GameModel;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomMemberVo;
	import models.room.RoomModule;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.RoomMemberInfo;
	import proto.com.RoomMod;
	import proto.com.ScoreInfo;
	import proto.cs.GetSimpleRoleRes;
	import utils.TextUtil;
	/**
	 * ...房间里的玩家
	 * @author ... dcl
	 */
	public class Room_RoleUU extends FusionUU
	{
		private var bg:Scale9MultiBitmapsUU;          	
		private var icon:BitmapLoaderUU;
		private var kongwei:BitmapLoaderUU;
		private var name:LabelUU;
		private var ready:BitmapLoaderUU;
		private var owner:BitmapLoaderUU;
		private var gaming:BitmapLoaderUU;
		private var duanwei:LabelUU;
		private var duanweiBg:BitmapLoaderUU;
		
		private var memberInfo:RoomMemberVo;
		private var countLabel:LabelUU;
		public function Room_RoleUU() 
		{
			init();
		}
		
		private function init():void {
			bg = new Scale9MultiBitmapsUU;
			bg.skinName = SkinNameConfig.room_member_scale9
			//bg.source = TResourceManager.getAsset("room/img/role_head.png");
			bg.width = 193;
			bg.height = 204;
			addNode(bg);
			
			this.spaceWidth = bg.spaceWidth;
			this.spaceHeight = bg.spaceHeight;
			
			icon = new BitmapLoaderUU;
		
			icon.locatingTypeForHoriz = LocatingType.L_A____L;
			icon.locatingTypeForVerti = LocatingType.L_A____L;
			icon.locatingOffsetX = 12;
			icon.locatingOffsetY = 12;
			addNode(icon);
			
			
			duanweiBg = new BitmapLoaderUU;
			duanweiBg.source = TResourceManager.getAsset("room/img/duanwei_number.png");
			addNode(duanweiBg);
			duanweiBg.locatingTypeForHoriz = LocatingType.F____A_F;
			duanweiBg.locatingTypeForVerti = LocatingType.F____A_F;
			duanweiBg.locatingOffsetX = -10;
			duanweiBg.locatingOffsetY = -10;
			
			duanwei = TextUtil.createLabel6("",18,ColorUtil.WHITE,false,ColorUtil.BLACK,1);
			addNode(duanwei);
			duanwei.locatingTypeForHoriz = LocatingType.L___A___L;
			duanwei.locatingTypeForVerti = LocatingType.L___A___L;
			
			name = TextUtil.createLabel6("",20,0xffb448,true,0x291600);
			addNode(name);
			name.locatingTypeForHoriz = LocatingType.F___A___F;
			name.locatingTypeForVerti = LocatingType.F____A_F;
			name.locatingOffsetY = -10;
			
			ready = new BitmapLoaderUU;
			ready.source = TResourceManager.getAsset("room/img/ready.png");
			addNode(ready);
			ready.locatingNode = bg;
			ready.locatingTypeForHoriz = LocatingType.F_A____F;
			ready.locatingTypeForVerti = LocatingType.F_A____F;
			
			owner = new BitmapLoaderUU;
			owner.source = TResourceManager.getAsset("room/img/room_owner.png");
			addNode(owner);
			owner.locatingNode = bg;
			owner.locatingTypeForHoriz = LocatingType.F_A____F;
			owner.locatingTypeForVerti = LocatingType.F_A____F;
			
			gaming = new BitmapLoaderUU;
			gaming.source = TResourceManager.getAsset("room/img/gaming.png");
			addNode(gaming);
			gaming.locatingNode = bg;
			gaming.locatingTypeForHoriz = LocatingType.F____A_F;
			gaming.locatingTypeForVerti = LocatingType.F____A_F;
			gaming.locatingOffsetX = -5;
			gaming.locatingOffsetY = -40;
			
			
			
			countLabel = TextUtil.createLabel6("", 25, ColorUtil.RED, true, ColorUtil.BLACK, 2);
			countLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			countLabel.locatingTypeForVerti = LocatingType.F____A_F;
			countLabel.locatingOffsetY = -60;
			countLabel.touchable = false;
			addNode(countLabel);
			
			kongwei = new BitmapLoaderUU;
			kongwei.source = TResourceManager.getAsset("room/img/empty_place.png");
			addNode(kongwei);
			
		}
		
		public function UpdateView():void {
			if (memberInfo == null) {
				bg.visible = duanweiBg.visible = ready.visible = owner.visible = icon.visible =  false;
				duanwei.text = name.text = "";
				kongwei.visible = true;
			}else {
				kongwei.visible = false;
				bg.visible = duanweiBg.visible  = icon.visible = true;
				ready.visible = memberInfo.roomMember.ready;
				gaming.visible = memberInfo.roombattleState == RoomModConfig.ROOM_STATE_INBATTLE;
				if (memberInfo.roomMember.roleId && RoomModule.getInstance().isRoomOwner(memberInfo.roomMember.roleId)) {
					owner.visible = true;
					ready.visible = false;
				}
				if (memberInfo.roomMember.roleId && PlayerModel.isMyRole(memberInfo.roomMember.roleId)) {
					duanwei.text = PlayerModel.getInstance().myRole.duanweiLevel(GameModel.gameMode).toString();
				}else {
					duanwei.text = getDuanWei(memberInfo.simpleRole,GameModel.gameMode).toString();
				}
				
				name.text = memberInfo.simpleRole.name;
				//var sprite:String = RoleCreateConfigurator.getRoleHeadById(int(memberInfo.simpleRole.icon)).sprite;
				var sprite:String = int(memberInfo.simpleRole.icon) <= 1000 ? "1006" : memberInfo.simpleRole.icon;
				icon.source = TResourceManager.getAsset("room/roomHead/" + sprite + ".png");
				//icon.width = 170;
				//icon.height = 140;
			}
		}
		//非自己的段位
		public function getDuanWei(roleInfo:GetSimpleRoleRes, mod : int):int
		{
			if(mod == RoomMod.ROOM_MOD_PRACTICE){
				return 1;
			}
			
			for(var i:int = 0; i < roleInfo.scoreList.length; i++)
			{
				if(mod == ScoreInfo(roleInfo.scoreList[i]).mod)
				{
					return int(ScoreInfo(roleInfo.scoreList[i]).score / 100) + 1;
				}
			}
			return 0;
		}
		
		public function setData(_data:Object):void {
			memberInfo = _data as RoomMemberVo;
			UpdateView();
		}
		
		public function setTimeCount(count:String):void {
			countLabel.text = count;
		}
		
		//override agony_internal function doDispose():void{
			//super.doDispose();
			//if (countTimer != null) {
				//countTimer.removeEventListener(TimerEvent.TIMER, onUpdateTime);
				//countTimer.stop();
				//countTimer = null;
				//
			//}	
			//
		//}
	}

}