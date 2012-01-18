package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Team In The Back
	 */
	public class PlayState extends FlxState 
	{
		public var level:FlxTilemap;
		public var player:FlxSprite;
		public var bits:FlxGroup;
		
		public function PlayState() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			
			var data:Array = new Array(
			//  /,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/,/
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 );
				
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(data, 26), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(level);
			
			// Player duh
			player = new FlxSprite(FlxG.width / 4 - 5);
			player.makeGraphic(10, 12, 0xffaa1111);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x * 4;
			player.x = 10;
			player.y = 10;
			add(player);
			
			bits = new FlxGroup();
			createBit(8, 4);
			add(bits);
		}
		
		public function createBit(X:uint, Y:uint):void
		{
			var bit:FlxSprite = new FlxSprite(X * 8 + 3, Y * 8 + 2);
			bit.makeGraphic(2, 2, 0xff22eeff);
			bits.add(bit);
		}
		
		override public function update():void
		{
			player.acceleration.x = 0;
			if (FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x * 4;
			if (FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x * 4;
			if (FlxG.keys.SPACE && (player.isTouching(FlxObject.FLOOR) || player.isTouching(FlxObject.CEILING)))
			{
				player.velocity.y = -player.maxVelocity.y / 2;
				//player.velocity.y = -player.maxVelocity.y / 2;
			}
			super.update();
			
			FlxG.collide(level, player);
		}
	}

}