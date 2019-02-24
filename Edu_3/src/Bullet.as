package  
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Bullet extends Sprite 
	{
		private var _speed:int = 10; //скорость полета пули
		private var _countenemy:int;
		private var _main:Main;
		
		
		public function Bullet() 
		{	}
		
		public function init(X:int,Y:int):void 
		{
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(0, 0, 3);
			graphics.endFill();
			mouseEnabled = false;
			x = X;
			y = Y;
			_main = Main.getMain();
			addEventListener(Event.ENTER_FRAME, _enterframe);
		}
		
		private function _enterframe(e:Event):void 
		{
			y -= _speed;
			_countenemy = _main._numenemy-1;
			while (_countenemy>-1) 
			{
				if (hitTestObject(_main._enemies[_countenemy]))
				{
					_main._enemies[_countenemy].y = 640;
					free();
					break;
				}
				_countenemy--;
			}
			
			if (y < 0) //если пуля вылетела за экран, удаляем ее
			{
				free();
			}
		}
		
		private function free():void 
		{
			graphics.clear();
			removeEventListener(Event.ENTER_FRAME, _enterframe);
			if(stage != null)
				stage.removeChild(this);
		}
		
		
		
	}

}