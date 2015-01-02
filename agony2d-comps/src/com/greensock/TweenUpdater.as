package com.greensock 
{
	import com.greensock.core.SimpleTimeline;
	import org.agony2d.base.inside.ITicker;
	import org.agony2d.base.LogMachine;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import org.agony2d.base.FrameManager;
	
	import org.agony2d.base.inside.agony_internal;
	use namespace agony_internal;
	
public class TweenUpdater implements ITicker
{
	
	public function TweenUpdater()
	{
		if (g_instance) {
			LogMachine.g_instance.error(this, "constructor", "Singleton.");
		}
		g_instance = this;
		FrameManager.doAddTicker(this)
	}
	
	private static var g_instance:TweenUpdater;
	public static function getInstance() : TweenUpdater {
		return g_instance ||= new TweenUpdater;
	}
	
	public var mRootTimeLine:SimpleTimeline
	
	public var mRootFramesTimeLine:SimpleTimeline
	
	public var mTime:Number = 0
		
	public var mPaused:Boolean	
	
	public function get paused() : Boolean { return mPaused }
	public function set paused( b:Boolean ) : void
	{
		if(mPaused != b)
		{
			mPaused = b
			if(b)
			{
				FrameManager.doRemoveTicker(this)
			}
			else
			{
				FrameManager.doAddTicker(this)
			}
		}
	}
		
	
	public function updateTime( elapsedTime:Number ) : void
	{
		mTime += elapsedTime * 0.001
		mRootTimeLine.renderTime(mTime * mRootTimeLine.cachedTimeScale, false, false)
		//trace(deltaTime)
		
		if (!(TweenLite.rootFrame % 60))
		{ //garbage collect every 60 frames...
			var ml:Dictionary=TweenLite.masterList, tgt:Object, a:Array, i:int;
			for (tgt in ml)
			{
				a=ml[tgt];
				i=a.length;
				while (--i > -1)
				{
					if (TweenLite(a[i]).gc)
					{
						a.splice(i, 1);
					}
				}
				if (a.length == 0)
				{
					delete ml[tgt];
				}
			}
		}
	}
	
}

}