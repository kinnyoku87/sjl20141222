package net.responses {
	
public interface IResponsor {
	
	function onHandle( cmd_B:int, subMsg:Object ,ret:int) : void;
	
}
}