package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.inputs.events.ATouchEvent;
	
	use namespace agony_internal;
	
public class CheckBoxUU extends ToggleUU {
	
	/**
	 * Constructor.
	 * 
	 * @param	skinName
	 * @param	selected
	 */
    public function CheckBoxUU( skinName:String = null, selected:Boolean = false ) {
		super(skinName, selected);
		this.addEventListener(ATouchEvent.CLICK, ____onChanged);
    }
	
	/** @private */
	agony_internal function ____onChanged( e:ATouchEvent ) : void {
		this.selected = !this.selected;
	}
}
}