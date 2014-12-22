package views.UU.comps {
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	import utils.TextUtil;

	public class CampUU extends FusionUU {
		
		
		public function init( type:int, count:int ) : void {
			
			var img:BitmapLoaderUU;
			var label:LabelUU;
			
			btn = new ButtonUU;
			this.addNode(btn);
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("camp/img/camp_frame.png");
			this.addNode(img);
			img.x = 10;
			img.y = 170;
			
			label = TextUtil.createLabel("", 17, ColorUtil.TEAL, false);
			this.addNode(label);
			label.x = 50;
			label.y = 178;
			
			if (type == CAMP_ID.CAMP_ID_SHANG) {
				btn.skinName = "camp_shang";
				label.text = "商国套牌";
			}
			else if (type == CAMP_ID.CAMP_ID_ZHOU) {
				btn.skinName = "camp_zhou";
				label.text = "周国套牌";
			}
			else if (type == CAMP_ID.CAMP_ID_YAO) {
				btn.skinName = "camp_yao";
				label.text = "妖族套牌";
			}
			else if (type == CAMP_ID.CAMP_ID_WU) {
				btn.skinName = "camp_wu";
				label.text = "巫族套牌";
			}
			
			label = TextUtil.createLabel(count, 22, ColorUtil.YELLOW);
			this.addNode(label);
			label.x = 15;
			label.y = 172;
			
			
			this.userData = type;
			
			
			//this.addEventListener(NodeEvent.DISPOSE, ____onDispose);
		}
		
		public function setSelected( b:Boolean ) : void {
			if (b) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", _bitmapId, 0);
				_animator.x = -155
				_animator.y = -140;
				//_animator.pivotX = 256;
				//_animator.pivotY = 256;
				this.addNodeAt(_animator, 0);
				btn.visible = this.touchable = false;
			}
			else {
				btn.visible = this.touchable = true;
				_animator.kill();
				_animator = null;
			}
		}
		
		
		private var btn:ButtonUU;
		private var _animator:AnimatorUU;
		private var _bitmapId:String;
		
		
		// 这个方法是什么意思。。。。。我又是谁。。。我在哪里。。。.
		
		// 想起来了...visible屬性并不是自動重置的...
		// 但是這麼做也晚了...因为btn已经被killed...
		//private function ____onDispose(e:NodeEvent):void {
			//if (_animator) {
				//btn.visible = true;
			//}
		//}
	}

}