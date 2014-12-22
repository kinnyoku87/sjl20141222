package models.battle.interactions
{
	import flash.utils.Dictionary;

	public class InteractPolicy
	{
		
		private static var _interactPolicyMap:Dictionary;
		
		public static function execPolicy( policyRef:Class, args:Array ) : void {
			var policy:InteractPolicy;
			
			if(!_interactPolicyMap){
				_interactPolicyMap = new Dictionary;
			}
			policy = _interactPolicyMap[policyRef];
			if(!policy){
				policy = _interactPolicyMap[policyRef] = new policyRef
			}
			policy.onExec(args);
		}
		
		
		public function onExec( args:Array ) : void {
			
			
		}
	}
}