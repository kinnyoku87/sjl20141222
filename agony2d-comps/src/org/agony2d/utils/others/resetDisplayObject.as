package org.agony2d.utils.others {
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	
    public function resetDisplayObject( v:DisplayObject ) : void {
		if (v.parent) {
			v.parent.removeChild(v);
		}
		if (v is Bitmap){
			if ((v as Bitmap).bitmapData) {
				(v as Bitmap).bitmapData = null;
			}
		}
		else if (v is DisplayObjectContainer) {
			if (v is MovieClip){
				(v as MovieClip).stop();
			}
			while ((v as DisplayObjectContainer).numChildren) {
				resetDisplayObject((v as DisplayObjectContainer).getChildAt(0));
			}
		}
		else if (v is Shape) {
			(v as Shape).graphics.clear();
		}
    }
}