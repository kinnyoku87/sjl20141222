package org.agony2d.geom {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
public class RectUtil {
	
	public static function getNearestFromRect( point:Point, rect:Rectangle, forBoundary:Boolean = false, result:Point = null ) : Point {
		if (!result) {
			result = new Point;
		}
		if (!forBoundary && rect.containsPoint(point)) {
			result.copyFrom(point)
		}
		else {
			if (point.x >= rect.x && point.x <= rect.right) {
				result.x = point.x;
			}
			else {
				result.x = ((point.x - rect.x) * (point.x - rect.x) < (point.x - rect.right) * (point.x - rect.right)) ? rect.x : rect.right;
			}
			if (point.y >= rect.y && point.y <= rect.bottom) {
				result.y = point.y;
			}
			else {
				result.y = ((point.y - rect.y) * (point.y - rect.y) < (point.y - rect.bottom) * (point.y - rect.bottom)) ? rect.y : rect.bottom;
			}
		}
		return result;
	}
}
}