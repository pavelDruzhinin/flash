package  
{
	import flash.display.Sprite;
	import zoo.*;
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class VirtualZoo 
	{
		private var pet: VirtualPet;
		public function VirtualZoo() 
		{
			pet = new VirtualPet("Stan");
			pet.eat(new Apple());
			pet.eat(new Sushi());
		}
		
	}

}