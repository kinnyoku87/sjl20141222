package assets {
	
public class OptionalAssets {
	
	[Embed(source = "animation.zip", mimeType = "application/octet-stream")]
	public static var animation:Class;
	
	//[Embed(source = "animation/animation_A.xml")]
	//public static var animation:Class;
	
	[Embed(source = "atlas.zip", mimeType = "application/octet-stream")]
	public static var atlas:Class;
	
	[Embed(source = "ui2.zip", mimeType = "application/octet-stream")]
	public static var ui2:Class;
}
}