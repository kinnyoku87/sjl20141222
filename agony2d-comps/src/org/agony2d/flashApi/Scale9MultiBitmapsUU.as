package org.agony2d.flashApi {
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.AutoSmoothNode;
	import org.agony2d.flashApi.inside.flashViews.FlashScale9MultiBitmaps;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.skins.SkinUU;
	import org.agony2d.inputs.Touch;
	
	use namespace agony_internal;
	
	// 浮點數會導致畫像出現"縫隙"，所以寬高在內部會換算為整數.
	
	// 可能会引发Flash系统自身的像素偏移bug，谨慎使用.
public class Scale9MultiBitmapsUU extends AutoSmoothNode {
	
	override public function get width() : Number {
		return (isNaN(m_scale9Renderer.m_currWidth) ? (m_scale9Renderer.m_skinName != null ? m_scale9Renderer.minWidth : 0) : m_scale9Renderer.m_currWidth) / g_pixelRatio;
	}
	
	public function set width( v:Number ) : void {
		if (m_scale9Renderer.m_currWidth != Math.round(v * g_pixelRatio)) {
			m_scale9Renderer.m_currWidth = Math.round(v * g_pixelRatio);
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
	}
	
	override public function get height() : Number {
		return (isNaN(m_scale9Renderer.m_currHeight) ? (m_scale9Renderer.m_skinName != null ? m_scale9Renderer.minHeight : 0) : m_scale9Renderer.m_currHeight) / g_pixelRatio;
	}
	
	public function set height( v:Number ) : void { 
		if (m_scale9Renderer.m_currHeight != Math.round(v * g_pixelRatio)) {
			m_scale9Renderer.m_currHeight = Math.round(v * g_pixelRatio);
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
	}
	
	public function get skinName() : String { 
		return m_scale9Renderer.m_skinName;
	}
	
	public function set skinName( v:String ) : void {
		var skin:Scale9MultiBitmapsSkinUU;
		
		skin = SkinUU.toRetrieveSkin(v) as Scale9MultiBitmapsSkinUU;
		if (!skin) {
			LogMachine.g_instance.error(this, "set skinName", "Not exist skin: [ {0} ] !!!", v);
		}
		else {
			m_scale9Renderer.setScale9MultiBitmapsSkin(skin);
			m_scale9Renderer.m_skinName = v;
			//this.____doAddToPreRenderList();
			
			m_flags |= FLAG_RESIZE;
			this.____doAddToPostUpdateList();
		}
	}
	
	//override public function revert() : void {
		//if (m_flags & FLAG_PRE_RENDER) {
			//FrameManager.doRemovePreRenderObject(this);
		//}
		//super.revert();
	//}
	
	
	
	/** @private */
	agony_internal var m_scale9Renderer:FlashScale9MultiBitmaps;
	
	
	
	/**
	 * @private
	 * 加入到預渲染列表.
	 */
	//agony_internal function ____doAddToPreRenderList() : void {
		//if (!(m_flags & FLAG_PRE_RENDER)) {
			//FrameManager.doAddPreRenderObject(this);
			//m_flags |= FLAG_PRE_RENDER;
		//}
	//}
	
	/** @private */
	//public function onPreRender() : void {
		//m_scale9Renderer.doModify();
	//}
	
	override public function onPostUpdate() : void {
		super.onPostUpdate();
		if (m_flags & FLAG_RESIZE) {
			m_flags &= ~FLAG_RESIZE;
			m_scale9Renderer.doModify();
		}
	}
	
	/** @private */
	override agony_internal function ____doRegisterRenderer() : void {
		m_flashView = m_scale9Renderer = FlashScale9MultiBitmaps.toScale9MultiBitmaps(this);
	}
	
	/** @private */
	override agony_internal function doCheckSmoothingState( smoothing:Boolean, external:Boolean ) : void {
		if (external) {
			m_externalAltered = smoothing;
		}
		else {
			m_internalAltered = smoothing;
		}
		m_scale9Renderer.doSetSmoothing(m_internalAltered || m_externalAltered);
	}
}
}