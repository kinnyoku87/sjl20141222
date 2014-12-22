package views.UU.comps 
{
	import com.netease.protobuf.Int64;
	import configs.create.RoleHeadCfg;
	import configs.create.RoleCreateConfigurator;
	import flash.events.MouseEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	/**
	 * ...角色
	 * @author ... dcl
	 */
	public class RoleHeadUU extends FusionUU
	{
		private var spriteId:String;          //角色图片id
		private var img:BitmapLoaderUU;       //ui图片
		public var roleHeadCfg:RoleHeadCfg;   //数据
		private var _selected:Boolean;        //是否选中的
		
		public function RoleHeadUU(_spriteId:String) 
		{
			spriteId = _spriteId;
			init(_spriteId);
		}
		
		private function init(_spriteId:String):void {
			roleHeadCfg = RoleCreateConfigurator.getRoleHeadBySprite(_spriteId);
			
			//头像
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("common/head/" + roleHeadCfg.sprite + ".png");
			this.addNode(img);
			
			//头像背景框
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("creation/img/role_bg.png");
			this.addNode(img);
			img.locatingTypeForHoriz = LocatingType.L_A____L;
			img.locatingTypeForVerti = LocatingType.L_A____L;
			img.locatingOffsetX = -8;
			img.locatingOffsetY = -40;
			
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
		}
		
	
	}

}