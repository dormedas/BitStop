package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Ian Mason
	 */
	public class PC extends FlxSprite 
	{
		[Embed(source = "../assets/pc.png")] private static var pcSprite:Class;
		[Embed(source = "../assets/isp.png")] private static var ispSprite:Class;
		public function PC(home:Boolean = true) 
		{
			super();
			if (home)
			{
				this.loadGraphic(pcSprite, false, false, 64, 64);
			}
			else
			{
				this.loadGraphic(ispSprite, false, false, 64, 64);
			}
		}
		
		public function checkInEthernet(X:int, Y:int):Boolean
		{
			if (X == this.x + 26 && Y == this.y + (64 - 12))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
	}

}