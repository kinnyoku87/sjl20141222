package org.agony2d.resources {
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	// 對單獨的AZipFile進行二級解析封裝.
	// 存儲可使用的數據.
	
public class TAssetData {
	
	public function TAssetData( id:String) {
		m_id = id;
	}
	
	public function get id() : String {
		return m_id;
	}
	
	public function get data() : * {
		return m_data;
	}
	
	public function toString() : String {
		//return "[id: " + m_id + "，data: " + getQualifiedClassName(m_data) + "]";
		return m_id;
	}
	
	
	agony_internal var m_id:String;
	agony_internal var m_data:*;
	agony_internal var m_index:int;
}
}