package views.UU.cg 
{
	import configs.skinname.SkinNameConfig;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import models.set.SetModule;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.sounds.MusicManager;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	import views.Hall_StateVV;
	import views.UU.hall.Hall_A_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CG_StateUU extends StateUU
	{
		private const videoURL:String = "assets/cg.flv";
		private var conn:NetConnection;
		private var stream:NetStream;
		private var video:Video;
		private var rawsprite:RawSpriteUU;       
		private var isSound:Boolean = false;    //是否有播放背景音乐
		private var maxDuration:Number;
		
		private var skipButton:ButtonUU;    //跳过  现为测试用，可能以后有用
		public function CG_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			//isSound = MusicManager.getInstance().totalVolume == 1 ? true : false;
			
			MusicManager.getInstance().stop();
			
			rawsprite = new RawSpriteUU;

			
			this.fusion.spaceWidth = Agony.getAdapter().rootWidth;
			this.fusion.spaceHeight = Agony.getAdapter().rootHeight;
			//rawsprite.spaceWidth = Agony.getAdapter().rootWidth;
			//rawsprite.spaceHeight = Agony.getAdapter().rootHeight;
			
            conn = new NetConnection();            
            conn.connect(null);
            
			stream = new NetStream(conn);
            var obj:Object = new Object();
			obj.onMetaData = onMetaData; 
            stream.client = obj;
			stream.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);
			
            video = new Video(Agony.getAdapter().rootWidth,Agony.getAdapter().rootHeight);
            video.attachNetStream(stream);
			video.smoothing = true;
			rawsprite.addChild(video);
			this.fusion.addNode(rawsprite);
			rawsprite.locatingTypeForHoriz = LocatingType.F___A___F;
			rawsprite.locatingTypeForVerti = LocatingType.F___A___F;
            stream.play(videoURL);
			
			
			skipButton = new ButtonUU();
			skipButton.skinName = SkinNameConfig.common_C;
			skipButton.image.width = 150;
			skipButton.image.height = 60;
			TextUtil.decorateLabel6(skipButton.getLabel(),"跳过(测试用)",22,ColorUtil.YELLOW,false,ColorUtil.BLACK,0);
			this.fusion.addNode(skipButton);
			skipButton.locatingTypeForHoriz = LocatingType.F___A___F;
			skipButton.locatingTypeForVerti = LocatingType.F____A_F;
			skipButton.locatingOffsetY = -100;
			skipButton.addEventListener(ATouchEvent.CLICK,onSkipClick);
			
            this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			onResize(null);
		}
		
		private function statusHandler(event:NetStatusEvent):void {			
			switch (event.info.code) {
                case "NetStream.Play.Start":
                    
                    break;
                case "NetStream.Play.StreamNotFound":
                    trace("Unable to locate video: " + videoURL);
                    break;
				case "NetStream.Play.Stop":
					UUFacade.getWindow(CG_StateUU).close();
					if (Hall_StateVV._isAssetsLoaded) {
						UUFacade.getWindow(Hall_A_StateUU).activate();
					}else {
						ViewFacade.setStateView(Hall_StateVV);
					}
					
					break;
            }

		}
		
		private function onMetaData(obj:Object):void 
		{ 
		   maxDuration = obj.duration;//获取总时间 
		} 
		  
		  public function position(value:Number):void 
		  { 
			  value = value > maxDuration ? maxDuration : value;
			  value = value < 0 ? 0 : value;
			  stream.seek(value);
			   //if (value == maxDuration)
			   //{ 
					//stream.seek(0); 
			   //} 
			   //else 
			   //{ 
					//if (value > Math.floor(maxDuration * stream.bytesLoaded / stream.bytesTotal)) 
					//{ 
						//stream.seek(Math.floor(maxDuration * stream.bytesLoaded / stream.bytesTotal)-5); 
					//} 
					//else 
					//{ 
						//stream.seek(value); 
					//} 
			   //} 
			   //trace("==="+value,int(maxDuration)); 
			   //trace("{}{}{}"+stream.bytesLoaded+":"+stream.bytesTotal); 
		  } 
		
		private function onSkipClick(evt:ATouchEvent):void {
			//position(stream.time);
			position(maxDuration);
		}
		
		
		
		
		private function onResize(evt:NodeEvent):void {
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
		
		override public function onExit():void {
			MusicManager.getInstance().loadAndPlay("assets/sounds/music/hall_bg.mp3", 0, 1);
		}
	}

}