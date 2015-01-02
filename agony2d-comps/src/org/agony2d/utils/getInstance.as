package org.agony2d.utils {
	import flash.utils.getDefinitionByName;

	public function getInstance( source:* ) : * {
		if (source is Class) {
			return new (source as Class);
		}
		else if (source is String) {
			return new (getDefinitionByName(source) as Class);
		}
		else if (source != null) {
			return source;
		}
		return null;
	}
}