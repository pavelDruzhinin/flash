package  
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Enemy extends Sprite 
	{
		private var _speed:int = 7; //скорость полета
		
		public function Enemy() 
		{
			init();
		}
		
		private function init():void 
		{
			graphics.beginFill(0x008000); //цвет врага
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
			
			rotation = 180; //переворачиваем изображение
			addEventListener(Event.ENTER_FRAME, _enterframe);
		}
		
		private function _enterframe(e:Event):void 
		{
			y += _speed;
			if (y > 600) //если вылетел за экран возвразаем назад
			{
				y = -30;
				x = (Math.random() * 700) + 50;
			}
		}
		
	}

}