package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Team In The Back
	 */
	public class Packet extends FlxSprite 
	{
		[Embed(source = "../assets/Player.png")] private static var playerSprite:Class;
		[Embed(source = "../assets/Packet.png")] private static var packetSprite:Class;
		public var dest:FlxText;
		public var websiteArray:Array = new Array(
			"facebook.com", "twitter.com", "tumblr.com", "wikipedia.com",
			"youtube.com", "google.com", "reddit.com", "steampowered.com"
		);
		
		public function Packet(player:Boolean = false) 
		{
			super();
			init(player);
		}
		
		public function init(player:Boolean):void
		{
			dest = new FlxText(this.x, this.y - 20, 400);
			genRandomText();
			//dest.alignment = "center";
			if (player)
				this.loadGraphic(playerSprite, false, false, 12, 12);
			else
				this.loadGraphic(packetSprite, false, false, 12, 12);
			this.addAnimation("pulse", new Array(0, 1), 4, true);
			this.play("pulse");
			dest.shadow = 0xaa000000;
		}
		
		override public function draw():void
		{
			super.draw();
			
			dest.x = this.x - 25;
			dest.y = this.y - 12;
			dest.draw();
		}
		
		public function removeText():void
		{
			dest.text = "";
		}
		public function genRandomText():void
		{
			var randIndex:int = Math.floor(Math.random() * (7 - 0));
			dest.text = websiteArray[randIndex];
		}
	}

}