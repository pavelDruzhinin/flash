package  
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Star extends Sprite 
	{
		
		public var _speed:int;
		private var _maxspeed:int = 10;
		
		public function Star() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			mouseEnabled = false;
		}
		
		public function setStar():void
		{
		alpha = (Math.random());
		_speed = (Math.random() * _maxspeed) + 1;
		graphics.clear();
		graphics.lineStyle(1,0xFFFFFF);
		graphics.moveTo(0,0);
		graphics.lineTo(0,Math.random()*5);
		}
		
	}

}