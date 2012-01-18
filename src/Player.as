package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Team In The Back
	 */
	public class Player extends FlxSprite 
	{
		public var dest:FlxText;
		
		public function Player() 
		{
			dest = new FlxText(this.x - 20, this.y - 20, 400, "facebook.com");
		}
		
		override public function draw():void
		{
			super.draw();
			
			dest.x = this.x - 24;
			dest.y = this.y - 12;
			dest.draw();
		}
	}

}