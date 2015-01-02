package org.agony2d.flashApi {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
public class ButtonOutInReaction {
	
	/** 被按下時，滑出滑入皆使用RELEASE狀態. */
	public static const OUT_RELEASE_IN_RELEASE:String  =  "releaseRelease";
	
	/** 被按下時，滑出使用OVER狀態 (臺式電腦專用，移動設備為RELEASE狀態)，滑入使用PRESS狀態. */
	public static const OUT_OVER_IN_PRESS:String       =  "overPress";
	
	/** 被按下時，滑出使用RELEASE狀態，滑入使用PRESS狀態. */
	public static const OUT_RELEASE_IN_PRESS:String    =  "releasePress";
	
	/** 被按下時，滑出滑入皆使用PRESS狀態. */
	public static const OUT_PRESS_IN_PRESS:String      =  "pressPress";
	
	
	
	/** @private */
	agony_internal static function doValidateValue( v:String ) : void {
		if (v != OUT_RELEASE_IN_RELEASE && 
			v != OUT_OVER_IN_PRESS &&
			v != OUT_RELEASE_IN_PRESS &&
			v != OUT_PRESS_IN_PRESS) {
			LogMachine.g_instance.error("ButtonLeaveReaction", "doValidateValue", "Unknown value: [ {0} ] !!!", v);
		}
	}
}
}