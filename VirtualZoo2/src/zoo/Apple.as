package zoo 
{
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class Apple extends Food 
	{
		private static var DEFAUT_CALORIES:int = 100;
		private var wormInApple:Boolean;
		
		public function Apple(initialCalories:int = 0) 
		{
			if (initialCalories <= 0) {
				initialCalories = Apple.DEFAUT_CALORIES;
			}
			
			super(initialCalories);
			
			wormInApple = Math.random() >= .5;
			setName("Apple");
		}
		
		public function hasWorm():Boolean {
			return wormInApple;
		}
		
	}

}