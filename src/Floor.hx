import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.ui.Keyboard;
import starling.core.Starling;
import starling.display.Quad;
import starling.utils.AssetManager;
import starling.events.EventDispatcher;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;
import starling.events.Event;

class Floor extends Image{

	public var item:String;
	public var counts:Int = 0;
	public var on:Bool = false;

	public function new(){
		super(Root.assets.getTexture("dancefloor5"));
		item = "dancefloor";
		x = 345;
		y = 299;
		//var ef:EnterFrameEvent = new EnterFrameEvent("clock",1);
		//addEventListener(Event.ENTER_FRAME, lights);
		//trace(description);
	}
		//super(Root.assets.getTexture("dancefloor"));
	public function begin()
	{
		var ef:EnterFrameEvent = new EnterFrameEvent("clock",1);
		addEventListener(Event.ENTER_FRAME, lights);
	}


	public function lights(e:EnterFrameEvent)
	{
		//trace("happen");
		counts = counts + 1;

		if(counts == 10)
		{
			//trace("happen");
			texture = Root.assets.getTexture("dancefloor2");
		}
		if(counts == 20)
		{
			//trace("happen");
			texture = Root.assets.getTexture("dancefloor3");
		}
		if(counts == 30)
		{
			//trace("happen");
			texture = Root.assets.getTexture("dancefloor4");
		}
		if(counts == 40)
		{
			//trace("happen");
			texture = Root.assets.getTexture("dancefloor");
			counts = 0;
		}

	}

	
	
}