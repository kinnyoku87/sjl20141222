package org.agony2d.geom {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
public class LineUtil {
	
	/**
	 * 計算連續特定像素列表.
	 * 
	 * @param	data
	 * @param	startPoint
	 * @param	color
	 * @return
	 */
	public static function regionGrow( data:BitmapData, startPoint:Point, color:uint = 0x30000000 ) : Vector.<int> {
		var pixels_A:Vector.<int> = new <int>[]; // 正在遍歷
		var pixels_B:Vector.<int> = new <int>[]; // 緩存遍歷
		var result:Vector.<int> = new <int>[];
		var existList:Array = []; // 已經存在列表
		var length:int;
		var length_A:int;
		var length_result:int;
		var count:int;
		
		var i:int;
		var N:int;
		var arr:Vector.<int>;
		var BA:BitmapData;
		var rect:Rectangle;
		var tx:int;
		var ty:int;
		
		var a:int; // 左邊界
		var b:int; // 上邊界
		var c:int; // 右邊界
		var d:int; // 下邊界
		
		tx    =  startPoint.x;
		ty    =  startPoint.y;
		a     =  0;
		b     =  0;
		c     =  data.width;
		d     =  data.height;
		existList[(tx << 12) | ty] = true;
		pixels_B[length++] = (tx << 12) | ty;
		while (length > 0) {
			i                =  0;
			arr              =  pixels_A;
			pixels_A         =  pixels_B;
			pixels_B         =  arr;
			pixels_B.length  =  length_A  =  0;
			while (i < length) {
				N   =  pixels_A[i++];
				tx  =  N >> 12;
				ty  =  N & 0xFFF;
				if (data.getPixel32(tx, ty) <= color) {
					//data.setPixel32(tx, ty, 0xFF000000);
					result[length_result++] = (tx << 12) | ty;
					if (!existList[((tx - 1) << 12) | ty] && tx - 1 >= a && ty >= b     && tx - 1 < c && ty < d) {
						existList[((tx - 1) << 12) | ty] = pixels_B[length_A++] = ((tx - 1) << 12) | ty;
					}
					if (!existList[((tx + 1) << 12) | ty] && tx + 1 >= a && ty >= b     && tx + 1 < c && ty < d) {
						existList[((tx + 1) << 12) | ty] = pixels_B[length_A++] = ((tx + 1) << 12) | ty;
					}
					if (!existList[(tx << 12) | (ty - 1)] && tx >= a     && ty - 1 >= b && tx < c     && ty - 1 < d) {
						existList[(tx << 12) | (ty - 1)] = pixels_B[length_A++] = (tx << 12) | (ty - 1);
					}
					if (!existList[(tx << 12) | (ty + 1)] && tx >= a     && ty + 1 >= b && tx < c     && ty + 1 < d) {
						existList[(tx << 12) | (ty + 1)] = pixels_B[length_A++] = (tx << 12) | (ty + 1);
					}
				}
			}
			length = length_A;
			//trace(length);
			count++
		}
		trace("[結果]: ",length_result);
		trace("[遍歷次數]: ", count);
		return result;
	}
	
	/**
	 * 自動計算封閉圖像外部的連續特定像素列表.
	 * 
	 * @param	data
	 * @param	color
	 * @return
	 */
	public static function autoRegionGrow( data:BitmapData, color:uint = 0x30000000 ) : Vector.<int> {
		var pixels_A:Vector.<int> = new <int>[]; // 正在遍歷
		var pixels_B:Vector.<int> = new <int>[]; // 緩存遍歷
		var result:Vector.<int> = new <int>[];
		var existList:Array = []; // 已經存在列表
		var length:int;
		var length_A:int;
		var length_result:int;
		var count:int;
		
		var i:int;
		var N:int;
		var arr:Vector.<int>;
		var BA:BitmapData;
		var rect:Rectangle;
		var tx:int;
		var ty:int;
		
		var a:int; // 左邊界
		var b:int; // 上邊界
		var c:int; // 右邊界
		var d:int; // 下邊界
		
		//rect =  ata.getColorBoundsRect(0xFFFFFF, 0x0, false);
		BA    =  new BitmapData(data.width + 2, data.height + 2, true, 0x0);
		BA.copyPixels(data, data.rect, new Point(1, 1));
		//trace(startPoint);
		data  =  BA;
		tx    =  0;
		ty    =  0;
		a     =  0;
		b     =  0;
		c     =  data.width;
		d     =  data.height;
		existList[(tx << 12) | ty] = true;
		pixels_B[length++] = (tx << 12) | ty;
		while (length > 0) {
			i                =  0;
			arr              =  pixels_A;
			pixels_A         =  pixels_B;
			pixels_B         =  arr;
			pixels_B.length  =  length_A  =  0;
			while (i < length) {
				N   =  pixels_A[i++];
				tx  =  N >> 12;
				ty  =  N & 0xFFF;
				if (data.getPixel32(tx, ty) <= color) {
					//data.setPixel32(tx, ty, 0xFF000000);
					result[length_result++] = ((tx - 1) << 12) | (ty - 1);
					if (!existList[((tx - 1) << 12) | ty] && tx - 1 >= a && ty >= b     && tx - 1 < c && ty < d) {
						existList[((tx - 1) << 12) | ty] = pixels_B[length_A++] = ((tx - 1) << 12) | ty;
					}
					if (!existList[((tx + 1) << 12) | ty] && tx + 1 >= a && ty >= b     && tx + 1 < c && ty < d) {
						existList[((tx + 1) << 12) | ty] = pixels_B[length_A++] = ((tx + 1) << 12) | ty;
					}
					if (!existList[(tx << 12) | (ty - 1)] && tx >= a     && ty - 1 >= b && tx < c     && ty - 1 < d) {
						existList[(tx << 12) | (ty - 1)] = pixels_B[length_A++] = (tx << 12) | (ty - 1);
					}
					if (!existList[(tx << 12) | (ty + 1)] && tx >= a     && ty + 1 >= b && tx < c     && ty + 1 < d) {
						existList[(tx << 12) | (ty + 1)] = pixels_B[length_A++] = (tx << 12) | (ty + 1);
					}
				}
			}
			length = length_A;
			//trace(length);
			count++
		}
		trace("[結果]: ",length_result);
		trace("[遍歷次數]: ", count);
		return result;
	}
	
	/**
	 * 獲取圖像封閉區域 (RegionGrow).
	 */
	public static function getClosurePixels( data:BitmapData, maskColor:uint = 0x30000000 ) : BitmapData {
		var pixels_A:Vector.<int> = new <int>[]; // 正在遍歷
		var pixels_B:Vector.<int> = new <int>[]; // 緩存遍歷
		var existList:Array = []; // 已經存在列表
		var length:int;
		var length_A:int;
		var count:int;
		
		var i:int;
		var N:int;
		var arr:Vector.<int>;
		var BA:BitmapData;
		var result:BitmapData;
		var rect:Rectangle;
		var tx:int;
		var ty:int;
		
		var a:int; // 左邊界
		var b:int; // 上邊界
		var c:int; // 右邊界
		var d:int; // 下邊界
		
		result  =  new BitmapData(data.width, data.height, true, 0xffdddd33);
		rect    =  data.getColorBoundsRect(0xFFFFFF, 0x0, false);
		BA      =  new BitmapData(rect.width + 2, rect.height + 2, true, 0x0);
		BA.copyPixels(data, rect, new Point(1, 1));
		
		//trace(startPoint);
		data  =  BA;
		tx    =  0;
		ty    =  0;
		a     =  0;
		b     =  0;
		c     =  data.width;
		d     =  data.height;
		existList[(tx << 12) | ty] = true;
		pixels_B[length++] = (tx << 12) | ty;
		while (length > 0) {
			i                =  0;
			arr              =  pixels_A;
			pixels_A         =  pixels_B;
			pixels_B         =  arr;
			pixels_B.length  =  length_A  =  0;
			while (i < length) {
				N   =  pixels_A[i++];
				tx  =  N >> 12;
				ty  =  N & 0xFFF;
				if (data.getPixel32(tx, ty) <= maskColor) {
					data.setPixel32(tx, ty, 0xffdddd33);
					if (!existList[((tx - 1) << 12) | ty] && tx - 1 >= a && ty >= b     && tx - 1 < c && ty < d) {
						existList[((tx - 1) << 12) | ty] = pixels_B[length_A++] = ((tx - 1) << 12) | ty;
					}
					if (!existList[((tx + 1) << 12) | ty] && tx + 1 >= a && ty >= b     && tx + 1 < c && ty < d) {
						existList[((tx + 1) << 12) | ty] = pixels_B[length_A++] = ((tx + 1) << 12) | ty;
					}
					if (!existList[(tx << 12) | (ty - 1)] && tx >= a     && ty - 1 >= b && tx < c     && ty - 1 < d) {
						existList[(tx << 12) | (ty - 1)] = pixels_B[length_A++] = (tx << 12) | (ty - 1);
					}
					if (!existList[(tx << 12) | (ty + 1)] && tx >= a     && ty + 1 >= b && tx < c     && ty + 1 < d) {
						existList[(tx << 12) | (ty + 1)] = pixels_B[length_A++] = (tx << 12) | (ty + 1);
					}
				}
			}
			length = length_A;
			//trace(length);
			count++
		}
		trace("[遍歷次數]: ", count);
		result.fillRect(rect, 0x0);
		trace(rect);
		result.copyPixels(data, new Rectangle(1, 1, rect.width, rect.height), new Point(rect.x, rect.y));
		//return result;
		return thresholdFilter(result, 128);
	}
	
	public static function thresholdFilter( source:BitmapData, threshold:uint = 128 ):BitmapData
	{
		var returnBitmapData:BitmapData = new BitmapData( source.width, source.height, true, 0xFF000000 );
		
		threshold = Math.max( 0, Math.min( threshold, 255 ) );
		threshold =  255 * 0xFFFFFF + threshold * 0xFFFF + threshold * 0xFF + threshold;
		
		returnBitmapData.threshold( source, returnBitmapData.rect, new Point(0, 0), ">", threshold, 0x00FFFFFF, 0xFFFFFFFF, false );
		
		return returnBitmapData;
	}
}
}