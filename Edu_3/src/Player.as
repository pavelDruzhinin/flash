package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Player extends Sprite 
	{
		private var _fire:Boolean = false; //нажата ли левая клваиша мыши
		private var _coutn:int = 10; // устанавливаем задержку выстрела в кадрах
 		private var i:int = _coutn;
		private var _bullet:Bullet;
		
		private var _main:Main;
		private var _countenemy:int;
		
		
		public function Player() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_main = Main.getMain();
			graphics.beginFill(0x0000C4);
			graphics.lineStyle();
			graphics.moveTo(0,35);
			graphics.lineTo(20,25);
			graphics.lineTo(20,10);
			graphics.lineTo(25,0);
			graphics.lineTo(30,10);
			graphics.lineTo(30,25);
			graphics.lineTo(50,35);
			graphics.lineTo(32,35);
			graphics.lineTo(32,45);
			graphics.lineTo(18,45);
			graphics.lineTo(18,35);
			graphics.lineTo(0, 35);
			graphics.endFill();
			graphics.beginFill(0x1D1D1D);
			graphics.drawEllipse(22.5, 8, 5, 8);
			graphics.endFill();
			
			addEventListener(MouseEvent.MOUSE_DOWN, _Down); 
			addEventListener(MouseEvent.MOUSE_UP, _Up);
			stage.addEventListener(Event.ENTER_FRAME, _enterframe);
		}
		
		private function _enterframe(e:Event):void 
		{
			if (_fire)
			{
				i++;
				if (i > _coutn)
				{
					_bullet = new Bullet();
					stage.addChildAt(_bullet,1); //добавляем выстрел всегда вторым в список отображения, чтобы наш корабль был поверх 
					_bullet.init(x+width * 0.5,y); //координаты из которых производим выстрел
					i = 0;
				}
			}
			_countenemy = _main._numenemy-1;
			while (_countenemy>-1) 
			{
				if (hitTestObject(_main._enemies[_countenemy]))
				{
					_main._enemies[_countenemy].y = 640;
				}
				_countenemy--;
			}
		}
		
		private function _Down(e:MouseEvent):void 
		{
			i = _coutn;
			_fire = true;
		}
		
		private function _Up(e:MouseEvent):void 
		{
			_fire = false;
		}
		
	
		
	}

}