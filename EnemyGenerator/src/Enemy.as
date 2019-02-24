package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class Enemy extends Sprite
	{
		
		public function Enemy() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			graphics.beginFill(0x0000C4);
			graphics.lineStyle();
			graphics.moveTo(10,35);
			graphics.lineTo(50,35);
			graphics.lineTo(30,10);
			//graphics.lineTo(25,0);
			//graphics.lineTo(30,10);
			//graphics.lineTo(30,25);
			//graphics.lineTo(50,35);
			//graphics.lineTo(32,35);
			//graphics.lineTo(32,45);
			//graphics.lineTo(18,45);
			//graphics.lineTo(18,35);
			//graphics.lineTo(0, 35);
			graphics.endFill();
			
		}
		
	}

}