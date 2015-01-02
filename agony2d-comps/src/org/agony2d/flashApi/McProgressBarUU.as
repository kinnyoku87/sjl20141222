package org.agony2d.flashApi {
	import flash.display.MovieClip;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AbstractRangeUU;
	import org.agony2d.events.AEvent;
	import org.agony2d.base.LogMachine;
	import org.agony2d.utils.getInstance;
	
	use namespace agony_internal;
    
public class McProgressBarUU extends AbstractRangeUU {
    
	/**
	 * Constructor.
	 * 
	 * @param	source
	 */
    public function McProgressBarUU( source:* = null ) {
		super();
		if (source) {
			this.source = source;
		}
	}
	
	/** mc數據源 (僅可設定一次). */
	public function set source( v:Object ) : void {
		var rawSprite:RawSpriteUU;
		
		if (m_movieClip) {
			LogMachine.g_instance.error(this, "set source", "Source can be set just once !!!");
		}
		m_movieClip = getInstance(v) as MovieClip;
		if(!m_movieClip) {
			LogMachine.g_instance.error(this, "set source", "Error mc data !!!");
		}
		rawSprite = new RawSpriteUU;
		this.addNode(rawSprite);
		rawSprite.addChild(m_movieClip);
		this.____onModelChanged(null);
	}
	
	
	
	/** @private */
	agony_internal var m_movieClip:MovieClip;
	
	
	
	/** @private */
	override agony_internal function ____onModelChanged( e:AEvent ) : void {
		if (m_movieClip) {
			m_movieClip.gotoAndStop(int((m_movieClip.totalFrames - 1) * m_model.ratio) + 1);
		}
	}
}
}