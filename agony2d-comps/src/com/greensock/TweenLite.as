package com.greensock {
	import com.greensock.core.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	/**
	 * <ul>
	 * 	<li><b> delay : Number</b>			Amount of delay in seconds (or frames for frames-based tweens) before the tween should begin.</li>
	 *
	 * 	<li><b> useFrames : Boolean</b>		If useFrames is set to true, the tweens's timing mode will be based on frames.
	 * 										Otherwise, it will be based on seconds/time. NOTE: a tween's timing mode is
	 * 										always determined by its parent timeline. </li>
	 *
	 * 	<li><b> ease : Function</b>			Use any standard easing equation to control the rate of change. For example,
	 * 										<code>Elastic.easeOut</code>. The Default is Quad.easeOut.</li>
	 *
	 * 	<li><b> easeParams : Array</b>		An Array of extra parameters to feed the easing equation. This can be useful when
	 * 										using an ease like <code>Elastic</code> and want to control extra parameters like the amplitude
	 * 										and period.	Most easing equations, however, don't require extra parameters so you
	 * 										won't need to pass in any easeParams.</li>
	 *
	 * 	<li><b> immediateRender : Boolean</b> Normally when you create a tween, it begins rendering on the very next frame (when
	 * 										the Flash Player dispatches an ENTER_FRAME event) unless you specify a <code>delay</code>. This
	 * 										allows you to insert tweens into timelines and perform other actions that may affect
	 * 										its timing. However, if you prefer to force the tween to render immediately when it is
	 * 										created, set <code>immediateRender</code> to true. Or to prevent a tween with a duration of zero from
	 * 										rendering immediately, set <code>immediateRender</code> to false.</li>
	 *
	 *  <li><b> onInit : Function</b>		A function that should be called just before the tween inits (renders for the first time).
	 * 										Since onInit runs before the start/end values are recorded internally, it is a good place to run
	 * 										code that affects the target's initial position or other tween-related properties. onStart, by
	 * 										contrast, runs AFTER the tween inits and the start/end values are recorded internally. onStart
	 * 										is called every time the tween begins which can happen more than once if the tween is restarted
	 * 										multiple times.</li>
	 *
	 *  <li><b> onInitParams : Array</b>	An Array of parameters to pass the onInit function.</li>
	 *
	 *  <li><b> onStart : Function</b>		A function that should be called when the tween begins (when its currentTime is at 0 and
	 * 										changes to some other value which can happen more than once if the tween is restarted multiple times).</li>
	 *
	 * 	<li><b> onStartParams : Array</b>	An Array of parameters to pass the onStart function.</li>
	 *
	 * 	<li><b> onUpdate : Function</b>		A function that should be called every time the tween's time/position is updated
	 * 										(on every frame while the tween is active)</li>
	 *
	 * 	<li><b> onUpdateParams : Array</b>	An Array of parameters to pass the onUpdate function</li>
	 *
	 * 	<li><b> onComplete : Function</b>	A function that should be called when the tween has finished </li>
	 *
	 * 	<li><b> onCompleteParams : Array</b> An Array of parameters to pass the onComplete function</li>
	 *
	 * 	<li><b> onReverseComplete : Function</b> A function that should be called when the tween has reached its starting point again after having been reversed. </li>
	 *
	 * 	<li><b> onReverseCompleteParams : Array</b> An Array of parameters to pass the onReverseComplete function</li>
	 *
	 *  <li><b> paused : Boolean</b>		If true, the tween will be paused initially.</li>
	 *
	 * 	<li><b> overwrite : int</b>			Controls how (and if) other tweens of the same target are overwritten by this tween. There are
	 * 										several modes to choose from, but only the first two are available in TweenLite unless
	 * 										<code>OverwriteManager.init()</code> has been called (please see
	 * 										<a href="http://www.greensock.com/overwritemanager/">http://www.greensock.com/overwritemanager/</a>
	 * 										for details and a full explanation of the various modes):
	 * 										<ul>
	 * 			  								<li>NONE (0) (or false) </li>
	 *
	 * 											<li>ALL_IMMEDIATE (1) (or true) - this is the default mode in TweenLite</li>
	 *
	 * 											<li>AUTO (2) - this is the default mode if TweenMax, TimelineLite, or TimelineMax is used in the swf. (these classes automatically init() OverwriteManager if you haven't done so already)</li>
	 *
	 * 											<li>CONCURRENT (3) (requires OverwriteManager)</li>
	 *
	 * 											<li>ALL_ONSTART (4) (requires OverwriteManager)</li>
	 *
	 * 											<li>PREEXISTING (5) (requires OverwriteManager)</li>
	 */
public class TweenLite extends TweenCore {	
	
	public function TweenLite(target:Object, duration:Number, vars:Object) {
		super(duration, vars);
		this.target=target;
		if (this.target is TweenCore && this.vars.timeScale) {
			this.cachedTimeScale=1;
		}
		propTweenLookup={};
		_ease=defaultEase;
		
		// overwrite
		_overwrite=(!(Number(vars.overwrite) > -1) || (!overwriteManager.enabled && vars.overwrite > 1)) ? overwriteManager.mode : int(vars.overwrite);
		var a:Array=masterList[target];
		if (!a) {
			masterList[target]=[this];
		}
		// overwrite...
		else {
			if (_overwrite == 1)
			{
				for each (var sibling:TweenLite in a)
				{
					if (!sibling.gc)
					{
						sibling.setEnabled(false, false);
					}
				}
				masterList[target]=[this];
			}
			else
			{
				a[a.length]=this;
			}
		}
		
		if (this.active || this.vars.immediateRender)
		{
			renderTime(0, false, true);
		}
	}
	
	override public function renderTime(time:Number, suppressEvents:Boolean=false, force:Boolean=false):void
	{
		var isComplete:Boolean
		var prevTime:Number = this.cachedTime;
		
		// complete...
		if (time >= this.cachedDuration)
		{
			this.cachedTotalTime=this.cachedTime=this.cachedDuration;
			this.ratio=1;
			isComplete=true;
			if (this.cachedDuration == 0)
			{ //zero-duration tweens are tricky because we must discern the momentum/direction of time in order to determine whether the starting values should be rendered or the ending values. If the "playhead" of its timeline goes past the zero-duration tween in the forward direction or lands directly on it, the end values should be rendered, but if the timeline's "playhead" moves past it in the backward direction (from a postitive time to a negative time), the starting values must be rendered.
				if ((time == 0 || _rawPrevTime < 0) && _rawPrevTime != time)
				{
					force=true;
				}
				_rawPrevTime=time;
			}
		}
		// delay...
		else if (time <= 0)
		{
			this.cachedTotalTime=this.cachedTime=this.ratio=0;
			if (time < 0)
			{
				this.active=false;
				if (this.cachedDuration == 0)
				{ //zero-duration tweens are tricky because we must discern the momentum/direction of time in order to determine whether the starting values should be rendered or the ending values. If the "playhead" of its timeline goes past the zero-duration tween in the forward direction or lands directly on it, the end values should be rendered, but if the timeline's "playhead" moves past it in the backward direction (from a postitive time to a negative time), the starting values must be rendered.
					if (_rawPrevTime > 0)
					{
						force=true;
						isComplete=true;
					}
					_rawPrevTime=time;
				}
			}
			if (this.cachedReversed && prevTime != 0)
			{
				isComplete=true;
			}
		}
		// ratio change...
		else
		{
			this.cachedTotalTime=this.cachedTime=time;
			this.ratio=_ease(time, 0, 1, this.cachedDuration);
		}
		// pass...
		if (this.cachedTime == prevTime && !force)
		{
			return;
		}
		// 初期化
		else if (!this.initted)
		{
			this.init();
			if (!isComplete && this.cachedTime)
			{ //_ease is initially set to defaultEase, so now that ini t() has run, _ease is set properly and we need to recalculate the ratio. Overall this is faster than using conditional logic earlier in the method to avoid having to set ratio twice because we only init() once but renderTime() gets called VERY frequently.
				this.ratio=_ease(this.cachedTime, 0, 1, this.cachedDuration);
			}
		}
		if (!this.active && !this.cachedPaused)
		{
			this.active=true; //so that if the user renders a tween (as opposed to the timeline rendering it), the timeline is forced to re-render and align it with the proper time/frame on the next rendering cycle. Maybe the tween already finished but the user manually re-renders it as halfway done.
		}
		// 觸發start事件
		if (prevTime == 0 && this.vars.onStart && this.cachedTime != 0 && !suppressEvents)
		{
			this.vars.onStart.apply(null, this.vars.onStartParams);
		}
		// 改變相關屬性
		var pt:PropTween=this.cachedPT1;
		while (pt)
		{
			pt.target[pt.property]=pt.start + (this.ratio * pt.change);
			pt=pt.nextNode;
		}
		// 觸發update事件
		if (_hasUpdate && !suppressEvents)
		{
			this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
		}
		// 觸發complete事件
		if (isComplete)
		{
			if (_hasPlugins && this.cachedPT1)
			{
				onPluginEvent("onComplete", this);
			}
			complete(true, suppressEvents);
		}
	}
	
	protected function init():void
	{
		// init callback
		if (this.vars.onInit)
		{
			this.vars.onInit.apply(null, this.vars.onInitParams);
		}
		// ease function
		var p:String, i:int, plugin:*, prioritize:Boolean, siblings:Array;
		if (typeof(this.vars.ease) == "function")
		{
			_ease=this.vars.ease;
		}
		if (this.vars.easeParams)
		{
			this.vars.proxiedEase=_ease;
			_ease=easeProxy;
		}
		this.cachedPT1 = null;
		
		// propertyyyyy
		this.propTweenLookup={};
		for (p in this.vars)
		{
			if (p in _reservedProps && !(p == "timeScale" && this.target is TweenCore))
			{
				//ignore
			}
			// plugin
			else if (p in plugins && (plugin=new (plugins[p] as Class)()).onInitTween(this.target, this.vars[p], this))
			{
				this.cachedPT1=new PropTween(plugin, "changeFactor", 0, 1, (plugin.overwriteProps.length == 1) ? plugin.overwriteProps[0] : "_MULTIPLE_", true, this.cachedPT1);
				
				if (this.cachedPT1.name == "_MULTIPLE_")
				{
					i=plugin.overwriteProps.length;
					while (--i > -1)
					{
						this.propTweenLookup[plugin.overwriteProps[i]]=this.cachedPT1;
					}
				}
				
				else
				{
					this.propTweenLookup[this.cachedPT1.name]=this.cachedPT1;
				}
				if (plugin.priority)
				{
					this.cachedPT1.priority=plugin.priority;
					prioritize=true;
				}
				if (plugin.onDisable || plugin.onEnable)
				{
					_notifyPluginsOfEnabled=true;
				}
				_hasPlugins=true;

			}
			// property
			else
			{
				this.cachedPT1=new PropTween(this.target, p, Number(this.target[p]), (typeof(this.vars[p]) == "number") ? Number(this.vars[p]) - this.target[p] : Number(this.vars[p]), p, false, this.cachedPT1);
				this.propTweenLookup[p]=this.cachedPT1;
			}

		}
		if (prioritize)
		{
			onPluginEvent("onInit", this); //reorders the linked list in order of priority. Uses a static TweenPlugin method in order to minimize file size in TweenLite
		}
		if (this.vars.runBackwards)
		{
			var pt:PropTween=this.cachedPT1;
			while (pt)
			{
				pt.start+=pt.change;
				pt.change=-pt.change;
				pt=pt.nextNode;
			}
		}
		// update callback
		_hasUpdate = Boolean(this.vars.onUpdate != null);
		
		if (_overwrittenProps)
		{ //another tween may have tried to overwrite properties of this tween before init() was called (like if two tweens start at the same time, the one created second will run first)
			killVars(_overwrittenProps);
			if (this.cachedPT1 == null)
			{ //if all tweening properties have been overwritten, kill the tween.
				this.setEnabled(false, false);
			}
		}
		// overwrite >= 2...
		if (_overwrite > 1 && this.cachedPT1 && (siblings == masterList[this.target]) && siblings.length > 1)
		{
			if (overwriteManager.manageOverwrites(this, this.propTweenLookup, siblings, _overwrite))
			{
				//one of the plugins had activeDisable set to true, so properties may have changed when it was disabled meaning we need to re-ini t()
				this.init();
			}
		}
		this.initted=true;
	}
	
	public function killVars(vars:Object, permanent:Boolean=true):Boolean
	{
		if (_overwrittenProps == null)
		{
			_overwrittenProps={};
		}
		var p:String, pt:PropTween, changed:Boolean;
		for (p in vars)
		{
			if (p in propTweenLookup)
			{
				pt=propTweenLookup[p];
				if (pt.isPlugin && pt.name == "_MULTIPLE_")
				{
					pt.target.killProps(vars);
					if (pt.target.overwriteProps.length == 0)
					{
						pt.name="";
					}
				}
				if (pt.name != "_MULTIPLE_")
				{
					//remove PropTween (do it inline to improve speed and keep file size low)
					if (pt.nextNode)
					{
						pt.nextNode.prevNode=pt.prevNode;
					}
					if (pt.prevNode)
					{
						pt.prevNode.nextNode=pt.nextNode;
					}
					else if (this.cachedPT1 == pt)
					{
						this.cachedPT1=pt.nextNode;
					}
					if (pt.isPlugin && pt.target.onDisable)
					{
						pt.target.onDisable(); //some plugins need to be notified so they can perform cleanup tasks first
						if (pt.target.activeDisable)
						{
							changed=true;
						}
					}
					delete propTweenLookup[p];
				}
			}
			if (permanent && vars != _overwrittenProps)
			{
				_overwrittenProps[p]=1;
			}
		}
		return changed;
	}
	
	/** @private **/
	override public function setEnabled(enabled:Boolean, ignoreTimeline:Boolean=false):Boolean
	{
		if (enabled)
		{
			var a:Array=TweenLite.masterList[this.target];
			if (!a)
			{
				TweenLite.masterList[this.target]=[this];
			}
			else
			{
				a[a.length]=this;
			}
		}
		super.setEnabled(enabled, ignoreTimeline);
		if (_notifyPluginsOfEnabled && this.cachedPT1)
		{
			return onPluginEvent(((enabled) ? "onEnable" : "onDisable"), this);
		}
		return false;
	}
	
	protected static function updateAll(e:Event=null):void
	{
		rootTimeline.renderTime(((getTimer() * 0.001) - rootTimeline.cachedStartTime) * rootTimeline.cachedTimeScale, false, false);
		rootFrame++;
		rootFramesTimeline.renderTime((rootFrame - rootFramesTimeline.cachedStartTime) * rootFramesTimeline.cachedTimeScale, false, false);

		if (!(rootFrame % 60))
		{ //garbage collect every 60 frames...
			var ml:Dictionary=masterList, tgt:Object, a:Array, i:int;
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
	
	public static function killTweensOf(target:Object, complete:Boolean=false, vars:Object=null):void
	{
		if (target in masterList)
		{
			var a:Array=masterList[target];
			var i:int=a.length;
			var tween:TweenLite;
			while (--i > -1)
			{
				tween=a[i];
				if (!tween.gc)
				{
					if (complete)
					{
						tween.complete(false, false);
					}
					if (vars != null)
					{
						tween.killVars(vars);
					}
					if (vars == null || (tween.cachedPT1 == null && tween.initted))
					{
						tween.setEnabled(false, false);
					}
				}
			}
			if (vars == null)
			{
				delete masterList[target];
			}
		}
	}
	
	
	
	//================================================================
	//================================================================
	//================================================================
	//================================================================
	//================================================================
	
	public static var fastEaseLookup:Dictionary=new Dictionary(false);
	public static var onPluginEvent:Function;
	public static var defaultEase:Function=TweenLite.easeOut;
	public static var overwriteManager:Object;
	public static var rootFrame:Number;
	public static var rootTimeline:SimpleTimeline;
	public static var rootFramesTimeline:SimpleTimeline;
	public static var masterList:Dictionary = new Dictionary(false);
	public static var plugins:Object={};
	protected static var _reservedProps:Object =
	{ 
		ease: 1, 
		delay: 1, 
		overwrite: 1,
		onComplete: 1,
		onCompleteParams: 1, 
		useFrames: 1, 
		runBackwards: 1, 
		startAt: 1, 
		onUpdate: 1,
		onUpdateParams: 1,
		roundProps: 1, 
		onStart: 1, 
		onStartParams: 1, 
		onInit: 1, 
		onInitParams: 1, 
		onReverseComplete: 1,
		onReverseCompleteParams: 1, 
		onRepeat: 1, 
		onRepeatParams: 1, 
		proxiedEase: 1, 
		easeParams: 1, 
		yoyo: 1, 
		onCompleteListener: 1, 
		onUpdateListener: 1, 
		onStartListener: 1, 
		onReverseCompleteListener: 1, 
		onRepeatListener: 1, 
		orientToBezier: 1,
		timeScale: 1,
		immediateRender: 1, 
		repeat: 1, 
		repeatDelay: 1,
		timeline: 1, 
		data: 1, 
		paused: 1
	};


	public var target:Object;
	public var propTweenLookup:Object;
	public var ratio:Number=0;
	public var cachedPT1:PropTween;
	protected var _ease:Function;
	/** @private 0 = NONE, 1 = ALL, 2 = AUTO 3 = CONCURRENT, 4 = ALL_AFTER **/
	protected var _overwrite:uint;
	/** @private When other tweens overwrite properties in this tween, the properties get added to this object. Remember, sometimes properties are overwritten BEFORE the tween inits, like when two tweens start at the same time, the later one overwrites the previous one. **/
	protected var _overwrittenProps:Object;
	protected var _hasPlugins:Boolean;
	/** @private If this tween has any TweenPlugins that need to be notified of a change in the "enabled" status, this will be true. (speeds things up in the enabled setter) **/
	protected var _notifyPluginsOfEnabled:Boolean;
	
	
	
	public static function get paused() : Boolean { return updater.paused }
	public static function set paused( b:Boolean ) : void { updater.paused = b }
	
	
	public static var updater:TweenUpdater
	
	public static const version:Number=11.36;
	
	public static function to(target:Object, duration:Number, vars:Object):TweenLite
	{
		return new TweenLite(target, duration, vars);
	}
	
	public static function from(target:Object, duration:Number, vars:Object):TweenLite
	{
		vars.runBackwards=true;
		if (!("immediateRender" in vars))
		{
			vars.immediateRender=true;
		}
		return new TweenLite(target, duration, vars);
	}
	
	public static function delayedCall(delay:Number, onComplete:Function, onCompleteParams:Array=null, useFrames:Boolean=false):TweenLite
	{
		return new TweenLite(onComplete, 0, {delay: delay, onComplete: onComplete, onCompleteParams: onCompleteParams, immediateRender: false, useFrames: useFrames, overwrite: 0});
	}
	
	public static function initClass():void
	{
		rootFrame=0;
		rootTimeline=new SimpleTimeline(null);
		//rootFramesTimeline=new SimpleTimeline(null);
		rootTimeline.cachedStartTime=getTimer() * 0.001;
		//rootFramesTimeline.cachedStartTime=rootFrame;
		rootTimeline.autoRemoveChildren=true;
		//rootFramesTimeline.autoRemoveChildren=true;
		//_shape.addEventListener(Event.ENTER_FRAME, updateAll, false, 0, true);
		updater = new TweenUpdater()
		//updater.mRootFramesTimeLine = rootFramesTimeline
		updater.mRootTimeLine = rootTimeline
		
		if (overwriteManager == null)
		{
			overwriteManager={mode: 1, enabled: false};
		}
	}
	
	/**
	 * @private
	 * Default easing equation
	 *
	 * @param t time
	 * @param b start (must always be 0)
	 * @param c change (must always be 1)
	 * @param d duration
	 * @return Eased value
	 */
	protected static function easeOut(t:Number, b:Number, c:Number, d:Number):Number
	{
		return 1 - (t=1 - (t / d)) * t;
	}

	/**
	 * @private
	 * Only used for easing equations that accept extra parameters (like Elastic.easeOut and Back.easeOut).
	 * Basically, it acts as a proxy. To utilize it, pass an Array of extra parameters via the vars object's
	 * "easeParams" special property
	 *
	 * @param t time
	 * @param b start
	 * @param c change
	 * @param d duration
	 * @return Eased value
	 */
	protected function easeProxy(t:Number, b:Number, c:Number, d:Number):Number
	{
		return this.vars.proxiedEase.apply(null, arguments.concat(this.vars.easeParams));
	}
	
	/** @inheritDoc **/
	//override public function invalidate():void
	//{
		//if (_notifyPluginsOfEnabled && this.cachedPT1)
		//{
			//onPluginEvent("onDisable", this);
		//}
		//this.cachedPT1=null;
		//_overwrittenProps=null;
		//_hasUpdate=this.initted=this.active=_notifyPluginsOfEnabled=false;
		//this.propTweenLookup={};
	//}

}
}