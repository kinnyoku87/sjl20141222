package assets.publicUU {

public class PublicUU_Assets {
	
	[Embed(source = "img/common/02.png")] public static var two:Class
	[Embed(source = "img/common/btn_play.jpg")] public static var btn_play:Class
	[Embed(source = "img/common/scroll.png")] public static var scroll:Class
	[Embed(source = "img/common/img.png")] public static var AT_img:Class
	[Embed(source = "img/common/img_role_girl.png")] public static var img_role_girl:Class
	[Embed(source = "img/common/img_role_boy.png")] public static var img_role_boy:Class
	[Embed(source = "img/common/btn_yellow.png")] public static var AT_btn_yellow:Class
	[Embed(source = "img/common/checkbox.png")] public static var AT_checkbox:Class
	[Embed(source = "img/common/nineScaleA.png")] public static var IMG_nineScaleA:Class
	[Embed(source = "img/common/gesture.png")] public static var IMG_gesture:Class
	[Embed(source = "img/common/track_A.png")] public static var IMG_track_A:Class
	[Embed(source = "img/common/thumb_A.png")] public static var IMG_thumb_A:Class
	[Embed(source = "img/common/track_B.png")] public static var IMG_track_B:Class
	[Embed(source = "img/common/thumb_B.png")] public static var IMG_thumb_B:Class
	[Embed(source = "img/common/grid_A.png")] public static var IMG_grid_A:Class
	
	
	[Embed(source = "mc/uiDemo.swf", mimeType = "application/octet-stream")]private static const uiDemo:Class
	public static function getMcList() : Array
	{
		return [
					new uiDemo,
				]
	}
}
}