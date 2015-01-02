package org.agony2d.utils {
	import flash.utils.getTimer;
	
	/**
	 * 測算函數執行時間.
	 * 
	 * @param	method
	 * @param	count
	 * @return
	 * @usage	共執行的毫秒數.
	 */
	public function calcExecutingTime( method:Function, count:int = 200000 ) : int {
		var t:int;
		
		t = getTimer();
		while (--count > -1) {
			method();
		}
		return getTimer() - t;
	}	
}