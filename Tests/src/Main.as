package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class Main extends Sprite 
	{
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{	
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var t:TextField = new TextField();
			t.text = "Click Here";
			t.background = true;
			t.border = true;
			t.autoSize = TextFieldAutoSize.LEFT;
			stage.addEventListener(FocusEvent.FOCUS_IN, focusInListener);
			
			stage.addChild(t);
			
			
		}
		
		public function focusInListener(e:FocusEvent):void {
			
			trace("Click textField");
			
			TextField(e.target).backgroundColor = 0xFF0000;
			
			//var theSprite:Sprite = Sprite(e.currentTarget);
			
			//theSprite.graphics.beginFill(0x0000FF);
			//theSprite.graphics.drawEllipse( -10, -10, 75, 40);
		}
		
	}
	
}