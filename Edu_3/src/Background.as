package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Background extends Sprite
	{
		
		private var _stars:Array = [];
		private var _star:Star;
		private var _starCount:int = 1000; //количество звезд
		private var i:int = _starCount;
		
		public function Background()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, 800, 600);
			graphics.endFill();
			mouseEnabled = false;
			while (--i > -1)
			{
				_stars[i] = new Star();
				this.addChild(_stars[i]);
				_stars[i].setStar();
				_stars[i].x = (Math.random() * 800);
				_stars[i].y = (Math.random() * 600);
			}
			stage.addEventListener(Event.ENTER_FRAME, _enterframe);
		}
		
		private function _enterframe(e:Event):void
		{
			i = _starCount;
			while (--i > -1)
			{
				_star = _stars[i];
				_star.y += _star._speed;
				if (_star.y > 600)
				{
					_star.y = -5;
					_star.x = (Math.random() * 800);
					_star.setStar();
				}
			}
		}
	
	}

}