package 
{
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Team In The Back
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		public var game:Sopajam;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			game = new Sopajam;
			addChild(game);
		}

	}

}