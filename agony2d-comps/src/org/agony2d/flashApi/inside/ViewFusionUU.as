package org.agony2d.flashApi.inside {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.flashApi.RootUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.core.BranchUU;
	import org.agony2d.flashApi.UUFacade;
	
	use namespace agony_internal;
	
	/** @private */
public class ViewFusionUU extends StateFusionUU {
	
	override public function kill() : void {
		UUFacade.getWindow(m_winName).close();
	}
	
	
	agony_internal var m_winName:String;
	
	
	override agony_internal function doAttach( parent:BranchUU ) : void {
		if (!(parent is RootUU)) {
			LogMachine.g_instance.error(this, "doAttach", "Module must belong to root !!!");
		}
		super.doAttach(parent);
	}
}
}