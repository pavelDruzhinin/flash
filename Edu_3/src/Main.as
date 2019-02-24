package 
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class Main extends Sprite 
	{
		private static var _main:Main; //храним ссылку на экземпляр этого класса
		
		private var _player:Player; //корабль игрока
		private var _backgr:Background; //Задний фон
		
		public var _numenemy:int = 5; //сколько в данный момент может вылететь
		private var j:int = 0;
		public var _enemies:Array = [];
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			if (_main != null)
			{
				throw("Error: Используй Main.getMain();");
			}
			_main = this;
			_backgr = new Background();
			addChild(_backgr);
			_player = new Player();
			stage.addChild(_player);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, _moveplayer);
			
			while (j < _numenemy)
			{
			_enemies[j] = new Enemy();
			stage.addChild(_enemies[j]);
			_enemies[j].x = (Math.random() * 700) + 50;
			_enemies[j].y = Math.random() * -200;
			j++;
			}
			
			Mouse.hide();
		}
		
		private function _moveplayer(e:MouseEvent):void 
		{
			_player.x = mouseX - _player.width * 0.5;
			_player.y = mouseY - _player.height * 0.5;
		}
		
		public static function getMain():Main
		{
			if (_main == null)
			return new Main() 
			else return _main;
		}
		
	}
}