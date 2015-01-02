package com.greensock.plugins
{
	import com.greensock.TweenLite;
	import com.greensock.plugins.TweenPlugin;

	import flash.utils.Dictionary;

	public class ShakeEffect extends TweenPlugin
	{
		public static const API:Number=1.0;

		protected var _target:Object;
		protected var numShakes:Number=3.0;
		protected var _tween:TweenLite;

		private var amplitude:Number;
		private var decrease:Number;

		private var lastValueAdditions:Dictionary=new Dictionary;
		private var currentValueAdditions:Dictionary=new Dictionary;

		private var props:Array=new Array;
		private var strengths:Dictionary=new Dictionary;

		public function ShakeEffect()
		{
			super();
			this.propName="shake";
			this.overwriteProps=[];
		}

		override public function onInitTween(target:Object, value:*, tween:TweenLite):Boolean
		{

			if (!(value is Object))
				throw new Error("invalid arguments!");
			for (var val:* in value)
			{
				if (val == "numShakes")
				{
					if (value[val] is Number)
						numShakes=value[val];
					else
						throw new Error("invalid arguments!");
				}
				else //if (val == "targetProperty")
				{
					if (!target.hasOwnProperty(val))
					{
						throw new Error("invalid arguments!");
					}
					props.push(val);
					strengths[val]=value[val];
					lastValueAdditions[val]=0;
					currentValueAdditions[val]=0;
						//this.overwriteProps.push(val);
				}
			}
			_tween=tween;
			_target=target;


			return true;
		}

		override public function killProps(lookup:Object):void
		{
			var i:int=this.overwriteProps.length;
			while (i--)
			{
				if (this.overwriteProps[i] in lookup)
				{
					_target[this.overwriteProps[i]]=_target[this.overwriteProps[i]] - lastValueAdditions[this.overwriteProps[i]];
					this.overwriteProps.splice(i, 1);
						//return;
				}
			}
			//super.killProps(lookup);
		}


		override public function set changeFactor(n:Number):void
		{
			amplitude=Math.sin((n * (2 * Math.PI)) * numShakes);
			decrease=1 - n;
			for each (var prop:String in props)
			{
				currentValueAdditions[prop]=(strengths[prop] * amplitude * decrease);
				_target[prop]=_target[prop] - lastValueAdditions[prop] + currentValueAdditions[prop];
				lastValueAdditions[prop]=currentValueAdditions[prop];
			}

		}
	}
}
