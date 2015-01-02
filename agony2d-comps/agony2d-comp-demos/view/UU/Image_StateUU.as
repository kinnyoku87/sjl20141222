package view.UU {
	import com.greensock.TweenLite;
	
	import assets.publicUU.PublicUU_Assets;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.core.AbstractImageLoaderUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.events.ATouchEvent;
	
	import view.UU.tips.Alpha_TipEffectStateUU;
	import view.UU.tips.Label_TipViewStateUU;

public class Image_StateUU extends StateUU
{
	
	private var numImage:int
	private const gapX:int = 170
	private const gapY:int = 90;
	
	private var imageList:Array = []
	private var urlList:Array = ['http://imgsrc.baidu.com/baike/abpic/item/a6c7d717e8257737c93d6dfe.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/a75fb6d3bccd1c74960a1637.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/b7bc4c66a9e7466baa184ce5.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/b840549012e67fb5a877a43b.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/8367d1fcefc971d6b801a011.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/14ce36d3d539b60060483bf4e950352ac75cb7ea.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/023b5bb5c9ea15cef137444bb6003af33b87b293.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/21e55823a69ae81d9822ed9a.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/310f3b1f6ea679fda7866987.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/389aa8fd9eca2b4208244d26.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/3a86813dc88dac68baa1679e.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/3b6833f56afd6076bc3109fc.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/3bc6f750ce96897e1138c244.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/4075890a88b5cc2994ca6b17.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/43e6c733fb787317ac4b5fe6.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/4d4970061b2a0f430308815c.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/6a22e824650029678744f991.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/6f4703951bcef95c7af4802f.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/9c57e3fadb66f48db48f31af.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/9dc3cf580d9ebfe1800a18a7.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/9f1011b30d3092f2d9335ace.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/a54e55fbb5983b3f024f5675.jpg',
								 'http://imgsrc.baidu.com/baike/abpic/item/a583631e869f64c31bd57698.jpg'
								 //'http://imgsrc.baidu.com/baike/abpic/item/a6c7d717e8257737c93d6dfe.jpg',
								 //'http://imda9f1f4b8961f17a21a.jpg'
								]
	
	override public function onEnter():void
	{
		var img:AbstractImageLoaderUU;
		//var IP:BitmapLoaderUU
		var i:int
		var correctionX:Number, correctionY:Number, velocityX:Number, velocityY:Number
		
		
		
		
		//this.fusion.spaceWidth = 800
		//this.fusion.spaceHeight = 500
		
		//this.fusion.pivotX = 300
		//this.fusion.pivotY = 300
		//this.fusion.setPivot(300,300)
		
		UUFacade.cache.addBitmap(PublicUU_Assets.img_role_girl);
		numImage = urlList.length
		{
			while (i < numImage)
			{
				img = new ImageLoaderUU;
				ImageLoaderUU(img).pivotX = 44;
				ImageLoaderUU(img).pivotY = 44;
				//IP = new BitmapLoaderUU();
				//IP.source = PublicUU_Assets.img_role_girl;
				//IP.graphics.beginFill(0xdddd44, 0.4)
				//IP.graphics.drawRect( -IP.width / 2 - 10, -IP.height / 2 - 10, IP.width + 20, IP.height + 20)
				//IP.cacheAsBitmap = true
				this.fusion.addNode(img)
				img.x = (i % 5) * gapX + 210
				img.y = int(i / 5) * gapY + 110
				img.scaleX = img.scaleY = 0.5
				imageList[i] = img
				img.optional = PublicUU_Assets.img_role_girl
				img.userData = urlList[i];
				
				
				UUToolTip.registerTip(img, Label_TipViewStateUU);
				//IP.cached = true;
				i++
				img.addEventListener(ATouchEvent.PRESS, onURL)
			}
		}
		
		var rawSprite:RawSpriteUU = new RawSpriteUU
		rawSprite.graphics.beginFill(0x44dd44, 0.5);
		rawSprite.graphics.lineStyle(1, 0);
		rawSprite.graphics.drawRect(20, 20, 200, 200)
		this.fusion.addNode(rawSprite)
		
		//var bmp:BitmapLoaderUU = new BitmapLoaderUU
		//bmp.source = PublicUU_Assets.img_role_girl
		//UUFacade.root.addNode(bmp);
		//bmp.horizLocatingType = LocatingType.F___A___F
		//bmp.vertiLocatingType = LocatingType.F___A___F
		
		//trace(getSize(bmp))
		
		onLoadImage(null)
		
		rawSprite.addEventListener(ATouchEvent.PRESS, onTouch)
		rawSprite.addEventListener(ATouchEvent.OVERLAY_PRESS, onTouch)
		rawSprite.addEventListener(ATouchEvent.RELEASE, onTouch)
		rawSprite.addEventListener(ATouchEvent.MOVE, onTouch)
		rawSprite.addEventListener(ATouchEvent.HOVER, onTouch)
		rawSprite.addEventListener(ATouchEvent.LEAVING, onTouch)
		rawSprite.addEventListener(ATouchEvent.CLICK, onTouch)
		
		//TouchManager.addEventListener(ATouchEvent.POST_MOVE, function(e:ATouchEvent):void {
			//trace(e.touch)
		//}, 1000000)
	}
	

	override public function onExit():void {	
		TweenLite.killTweensOf(this.fusion)
		var IP:NodeUU
		var i:int
		while (i < numImage)
		{
			IP = imageList[i];
			TweenLite.killTweensOf(IP)
			i++
		}
		imageList = null
		urlList = null
	}
	
	private function onLoadImage(e:AEvent):void
	{
		var IP:AbstractImageLoaderUU
		var i:int
		while (i < numImage)
		{
			IP = imageList[i];
			//IP.cached = true
			IP.source = urlList[i];
			IP.addEventListener(AEvent.COMPLETE, onScale)
			i++
		}	
	}
	
	private function onScale(e:AEvent):void
	{
		var IP:AbstractImageLoaderUU
		
		IP = e.target as AbstractImageLoaderUU
		IP.scaleX = IP.scaleY = 0.1
		ImageLoaderUU(IP).pivotX = IP.sourceWidth / 2;
		ImageLoaderUU(IP).pivotY = IP.sourceHeight / 2;
		TweenLite.to(IP, 2,{scaleX:0.5,scaleY:0.5})
	}
	
	
	private function onTouch(e:ATouchEvent):void {
		trace(e.type, e.touch.rootX, e.touch.rootY)
		
		//if (e.type == "leave") {
			//e
		//}
	}
	
	private function onURL(e:ATouchEvent):void {
		var node:AbstractImageLoaderUU;
		
		node = e.target as AbstractImageLoaderUU
		trace(node.source);
		trace((node as NodeUU).userData);
	}
}
}