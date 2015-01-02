package org.agony2d.flashApi {
	import org.agony2d.display.animation.AnimationData;
	import org.agony2d.display.animation.AnimatorAction;
	import org.agony2d.display.animation.FrameClip;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.inside.ITicker;
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AutoSmoothNode;
	import org.agony2d.flashApi.inside.AnimatorProp;
	import org.agony2d.flashApi.inside.flashViews.FlashImage;
	import org.agony2d.inputs.Touch;
	
	use namespace agony_internal;
	
public class AdvancedAnimatorUU extends AutoSmoothNode implements ITicker {
	
	public function AdvancedAnimatorUU( id:String ) {
		m_animationData = AnimationData.toGetAnimationData(id);
		if (!m_animationData) {
			LogMachine.g_instance.error(this, "constructor", "Animation data ( " + id + " ) can't be null.");
		}
		m_actionList  =  [];
		m_speedRatio  =  m_currFrame  =  1.0;
		this.____doSetFrame();
	}
	
	/** 源圖像寬度. */
	public function get sourceWidth() : int {
		return m_prop ? m_prop.m_frameWidth : 0;
	}
	
	/** 源圖像高度. */
	public function get sourceHeight() : int {
		return m_prop ? m_prop.m_frameHeight : 0;
	}
	
	override public function set pivotX( v:Number ) : void { 
		m_pivotX = v;
		m_imgRenderer.m_img.x = ((isNaN(m_pivotX) ? 0 : m_pivotX) - m_prop.m_frameX) * g_pixelRatio;
		m_imgRenderer.m_img.y = ((isNaN(m_pivotY) ? 0 : m_pivotY) - m_prop.m_frameY) * g_pixelRatio;
	}
	
	override public function set pivotY( v:Number ) : void {
		m_pivotY = v;
	}
	
	/** 是否播放中. */
	public function get isPlaying() : Boolean {
		return Boolean(m_execActionIndexList);
	}
	
	/** 當前為第几帧. */
	public function get currFrame() : uint {
		return m_currFrame;
	}
	
	public function set currFrame( v:uint ) : void {
		m_currFrame = v;
		this.____doSetFrame();
		if (m_execActionIndexList) {
			FrameManager.doRemoveTicker(this);
			m_execActionIndexList = null;
		}
	}
	
	/** 播放速率. */
	public function get speedRatio() : Number {
		return m_speedRatio;
	}
    
	public function set speedRatio( v:Number ) : void {
		m_speedRatio = (v < 0 || isNaN(v)) ? 0 : v;
	}
	
	public function setPivot( pivX:Number, pivY:Number ) : void {
		m_pivotX = pivX;
		m_pivotY = pivY;
		m_imgRenderer.m_img.x = ((isNaN(m_pivotX) ? 0 : m_pivotX) - m_prop.m_frameX) * g_pixelRatio;
		m_imgRenderer.m_img.y = ((isNaN(m_pivotY) ? 0 : m_pivotY) - m_prop.m_frameY) * g_pixelRatio;
	}
	
	/**
	 * 获取动作.
	 * 
	 * @param	index
	 * @return
	 */
	public function getAction( index:int ) : AnimatorAction {
		return m_actionList[index];
	}
	
	/**
	 * 开始播放.
	 * 
	 * @param	actionIndexes
	 * @param	totalRepeat
	 * @param	callback
	 */
	public function play( actionIndexes:Array, totalRepeat:int = 1, callback:Function = null ) : void {
		if (actionIndexes && actionIndexes.length > 0) {
			if (!m_execActionIndexList) {
				FrameManager.doAddTicker(this);
			}
			m_execActionIndexList  =  actionIndexes;
			m_allTotalRepeat       =  totalRepeat;
			m_execActionIndex      =  0;
			m_allCallback          =  callback;
			this.____doResetAction();
			m_actionTotalCount     =  m_currAction.m_totalRepeat;
		}
		else {
			if (m_execActionIndexList) {
				m_execActionIndexList = null;
				FrameManager.doRemoveTicker(this);
			}
		}
	}
	
	/**
	 * 由剪辑名称设定动作.
	 * 
	 * @param	actionIndex
	 * @param	clipName
	 * @param	totalRepeat
	 * @return
	 */
	public function setActionByClipName( actionIndex:uint, clipName:String, totalRepeat:int = 1 ) : AnimatorAction {
		return this.____doAddAction(actionIndex, m_animationData.m_clipMap[clipName], totalRepeat);
	}
	
	/**
	 * 由剪辑索引设定动作.
	 * 
	 * @param	actionIndex
	 * @param	clipIndex
	 * @param	totalRepeat
	 * @return
	 */
	public function setActionByClipIndex( actionIndex:uint, clipIndex:int, totalRepeat:int = 1 ) : AnimatorAction {
		return this.____doAddAction(actionIndex, m_animationData.m_clipList[clipIndex], totalRepeat);
	}
	
	
	
	/** @private */
	agony_internal var m_imgRenderer:FlashImage;
	/** @private */
	agony_internal var m_prop:AnimatorProp;
	/** @private */
	agony_internal var m_animationData:AnimationData;
	/** @private */
	agony_internal var m_speedRatio:Number;
	/** @private */
	agony_internal var m_currFrame:int;
	/** @private */
	//agony_internal var m_prevFrame:int;
	
	/** @private */
	agony_internal var m_currTime:Number;
	/** @private */
	agony_internal var m_currAction:AnimatorAction;
	/** @private */
	agony_internal var m_clip:FrameClip;
	/** @private */
	agony_internal var m_frames:Vector.<int>;
	/** @private */
	agony_internal var m_actionList:Array;
	/** @private */
	agony_internal var m_execActionIndex:uint;
	/** @private */
	agony_internal var m_numframesInAction:int;
	/** @private */
	agony_internal var m_frameIndex:int;
	/** @private */
	agony_internal var m_execActionIndexList:Array;  // indicate is playing.
	/** @private */
	agony_internal var m_allTotalRepeat:int; // all action repeat count.
	/** @private */
	agony_internal var m_actionTotalCount:int; // action self repeat count.
	/** @private */
	agony_internal var m_allCallback:Function; // action self repeat count.
	
	
	
	/** @private */
	final public function updateTime( elapsedTime:Number ) : void {
		if (m_currTime >= m_clip.m_stepTime) {
			this.____doAdvance();
		}
		m_currTime += (elapsedTime > 300 ? 300 : elapsedTime) * m_currAction.m_speedRatio * m_speedRatio * AnimationData.g_speedScaleFactor;
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doAddAction( actionIndex:uint, clip:FrameClip, totalRepeat:int ) : AnimatorAction {
		var action:AnimatorAction;
		
		if (!clip) {
			LogMachine.g_instance.error(this, "doAddAction", "Null frame clip.");
		}
		if (m_actionList[actionIndex]) {
			LogMachine.g_instance.error(this, "doAddAction", "Existed action.");
		}
		action = m_actionList[actionIndex] = new AnimatorAction(clip).setTotalRepeat(totalRepeat);
		return action;
	}
	
	/** @private */
	final agony_internal function ____doAdvance() : void {
		m_currTime -= m_clip.m_stepTime;
		
		// frame list tail.
		if (++m_frameIndex >= m_numframesInAction) {
			// into next action，otherwise repeat in action.
			if (m_actionTotalCount > 0 && --m_actionTotalCount <= 0) {
				// action list tail.
				if (++m_execActionIndex >= m_execActionIndexList.length) {
					// repeat in action.
					if (m_allTotalRepeat <= 0 || --m_allTotalRepeat > 0) {
						m_execActionIndex = 0;
					}
					// no next action.
					else {
						m_execActionIndexList = null;
						FrameManager.doRemoveTicker(this);
						if (m_currAction.m_callback != null) {	
							m_currAction.m_callback();
						}
						if (m_allCallback != null) {
							m_allCallback();
						}
						return;
					}
				}
				this.____doNextAction();
				m_actionTotalCount = m_currAction.m_totalRepeat;
			}
			else {
				this.____doNextAction();
			}
		}
		m_currFrame = m_clip.frames[m_frameIndex];
		this.____doSetFrame();
		//m_currFrame = m_clip.frames[m_frameIndex];
		//trace("currFrame: " + m_currFrame);
		
		// prevent that callback's update state is removed when executing.
		if (m_execActionIndexList) {
			if (m_currTime >= m_clip.m_stepTime) {
				this.____doAdvance();
			}
		}
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doNextAction() : void {
		var callback:Function;
		
		callback = m_currAction.m_callback;
		this.____doResetAction();
		if (callback != null) {
			callback();
		}
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doResetAction() : void {
		m_currTime    =  m_frameIndex  =  0;
		m_currAction  =  m_actionList[m_execActionIndexList[m_execActionIndex]];
		if (!m_currAction) {
			LogMachine.g_instance.error(this, "doResetAction", "Non existed action index ( " + m_execActionIndexList[m_execActionIndex] + " ).");
		}
		m_clip               =  m_currAction.m_clip;
		m_numframesInAction  =  m_clip.numFrames;
		m_currFrame          =  m_clip.frames[0];  
		this.____doSetFrame();
	}
	
	/** @private */
	[Inline]
	final agony_internal function ____doSetFrame() : void {
		m_prop = g_bitmapDataMap[m_animationData.m_id + "_" + m_currFrame];
		m_imgRenderer.m_img.bitmapData = m_prop.m_data;
		m_imgRenderer.m_img.x = ((isNaN(m_pivotX) ? 0 : -m_pivotX) - m_prop.m_frameX) * g_pixelRatio;
		m_imgRenderer.m_img.y = ((isNaN(m_pivotY) ? 0 : -m_pivotY) - m_prop.m_frameY) * g_pixelRatio;
	}
	
	/** @private */
	[Inline]
	final override agony_internal function ____doValidateType() : void {
		
	}
	
	/** @private */
	override agony_internal function ____doRegisterRenderer() : void {
		m_flashView = m_imgRenderer = FlashImage.toImage(this);
	}
	
	/** @private */
	final override agony_internal function doDispose() : void {
		if (m_execActionIndexList) {
			FrameManager.doRemoveTicker(this);
		}
		super.doDispose();
	}
	
	/** @private */
	override agony_internal function doCheckSmoothingState( smoothing:Boolean, external:Boolean ) : void {
		if (external) {
			m_externalAltered = smoothing;
		}
		else {
			m_internalAltered = smoothing;
		}
		m_imgRenderer.m_img.smoothing = (m_internalAltered || m_externalAltered);
	}
}
}