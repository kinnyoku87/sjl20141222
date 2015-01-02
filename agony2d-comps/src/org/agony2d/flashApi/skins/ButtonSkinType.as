package org.agony2d.flashApi.skins {
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
public class ButtonSkinType {
	
	// COMMON.
	public static const NONE : int                             =  0x00;
	public static const PRESS : int                            =  0x04;
	public static const PRESS_OVER : int                       =  PRESS | OVER;
	public static const PRESS_INVALID : int                    =  PRESS | INVALID;
	public static const PRESS_OVER_INVALID : int               =  PRESS | OVER | INVALID;
	
	// SCALE9.
	public static const SCALE9 : int                           =  0x08;
	public static const SCALE9_PRESS : int                     =  SCALE9 | PRESS;
	public static const SCALE9_PRESS_OVER : int                =  SCALE9 | PRESS | OVER;
	public static const SCALE9_PRESS_INVALID : int             =  SCALE9 | PRESS | INVALID;
	public static const SCALE9_PRESS_OVER_INVALID : int        =  SCALE9 | PRESS | OVER | INVALID;
	
	// ATLAS COMMON.
	public static const ATLAS_PRESS : int                      =  ATLAS | PRESS;
	public static const ATLAS_PRESS_OVER : int                 =  ATLAS | PRESS | OVER;
	public static const ATLAS_PRESS_INVALID : int              =  ATLAS | PRESS | INVALID;
	public static const ATLAS_PRESS_OVER_INVALID : int         =  ATLAS | PRESS | OVER | INVALID;
	
	// ATLAS SCALE9.
	public static const ATLAS_SCALE9_PRESS : int               =  ATLAS | SCALE9 | PRESS;
	public static const ATLAS_SCALE9_PRESS_OVER : int          =  ATLAS | SCALE9 | PRESS | OVER;
	public static const ATLAS_SCALE9_PRESS_INVALID : int       =  ATLAS | SCALE9 | PRESS | INVALID;
	public static const ATLAS_SCALE9_PRESS_OVER_INVALID : int  =  ATLAS | SCALE9 | PRESS | OVER | INVALID;
	
	
	
	/** @private */
	agony_internal static const OVER : int                     =  0x01;
	/** @private */
	agony_internal static const INVALID : int                  =  0x02;
	/** @private */
	agony_internal static const ATLAS : int                    =  0x10;
}
}