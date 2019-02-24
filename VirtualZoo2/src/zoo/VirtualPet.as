package zoo
{
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	/**
	 * ...
	 * @author Pavel Druzhinin
	 */
	public class VirtualPet 
	{
		private static var maxNameLength:int = 20;
		private static var maxCalories:int = 2000;
		private static var caloriesPerSecond:int = 100;
		
		private var petName:String;
		private var currentCalories:int = VirtualPet.maxCalories / 2;
		private var digestIntervalID:int;
		
		public function VirtualPet(name:String) 
		{
			setName(name);
			digestIntervalID = setInterval(digest, 1000);
		}
		
		public function eat(foodItem:Food):void {
			if (currentCalories == 0) {
				trace(getName() + " is dead. You can't feed it.");
				return;
			}
			
			if (foodItem is Apple) {
				if (Apple(foodItem).hasWorm()) {
					trace("The " + foodItem.getName() + " had a worm. " + getName() + " didn't eat it.");
					return;
				}
			}
			
			var newCurrentCalories:int = currentCalories + foodItem.getCalories();
			currentCalories = newCurrentCalories > VirtualPet.maxCalories ? VirtualPet.maxCalories : newCurrentCalories;
			
			trace(getName() + " ate some " + foodItem.getName() + ". It now has " + currentCalories + " calories remaining");
		}
		
		public function getHunger() : Number
		{
			return currentCalories / VirtualPet.maxCalories;
		}
		
		public function setName(newName:String):void {
			if(newName == '') {
				return;
			}
			
			petName = newName.length > VirtualPet.maxNameLength ? newName.substr(0, VirtualPet.maxNameLength): newName;
			
		}
		
		public function getName() {
			return petName;
		}
		
		private function digest():void {
			if (currentCalories - VirtualPet.caloriesPerSecond <= 0) {
				clearInterval(digestIntervalID);
				
				currentCalories = 0;
				
				trace(getName() + " has dead.");
				
			} else {
				currentCalories -= VirtualPet.caloriesPerSecond;
				trace(getName() + " digested some food. It now has " + currentCalories + " calories remaining.");
			}
			
			
		}
	}

}