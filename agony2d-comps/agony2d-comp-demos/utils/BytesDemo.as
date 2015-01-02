package utils
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import org.agony2d.utils.bytes.BytesUtil;
	
public class BytesDemo extends Sprite
{

	public function BytesDemo() 
	{
		var bytes_A:ByteArray,bytes_B:ByteArray, bytes:ByteArray
			
		bytes_A = new ByteArray
		bytes_A.writeDouble(11)
		bytes_A.writeDouble(11)
		bytes_A.writeDouble(11)
		bytes_A.writeDouble(11)
		
		bytes_B = new ByteArray
		bytes_B.writeDouble(11)
		bytes_B.writeDouble(11)
		bytes_B.writeDouble(11)
		bytes_B.writeDouble(11)
		
		bytes = BytesUtil.merge([bytes_A, null, bytes_B, new ByteArray])
		trace(bytes.length)
		
		
		var AY:Array
		var i:int, l:int
		
		AY = BytesUtil.unmerge(bytes)
		l = AY.length
		while (i < l) {
			bytes = AY[i++]
			trace(bytes ? bytes.length : 0)
			
		}
		trace(AY)
	}
	
}

}