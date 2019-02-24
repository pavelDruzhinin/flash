package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class Main extends Sprite 
	{
		public var _enemy:Enemy;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_enemy = new Enemy();
			
			addChild(_enemy);
			// entry point
		}
		
	}
	
}